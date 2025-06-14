package com.lyk.coursearrange.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lyk.coursearrange.common.ServerResponse;
import com.lyk.coursearrange.dao.*;
import com.lyk.coursearrange.entity.ClassTask;
import com.lyk.coursearrange.entity.Classroom;
import com.lyk.coursearrange.entity.CoursePlan;
import com.lyk.coursearrange.entity.request.ConstantInfo;
import com.lyk.coursearrange.service.ClassTaskService;
import com.lyk.coursearrange.util.ClassUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.lyk.coursearrange.service.CoursePlanService;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author lequal
 * @since 2020-04-06
 */
@Service
@Slf4j
public class ClassTaskServiceImpl extends ServiceImpl<ClassTaskDao, ClassTask> implements ClassTaskService {

    @Autowired
    private ClassTaskDao classTaskDao;
    @Autowired
    private TeachBuildInfoDao teachBuildInfoDao;
    @Autowired
    private ClassroomDao classroomDao;
    @Autowired
    private ClassInfoDao classInfoDao;
    @Autowired
    private CoursePlanService coursePlanService;
    @Autowired
    private CoursePlanDao coursePlanDao;


    private final String UNFIXED_TIME = "unFixedTime";
    private final String IS_FIX_TIME = "isFixedTime";


    /**
     * 排课算法入口
     * @param semester 学期, 例如 "2024-2025-1"
     * @return
     */
    @Transactional(rollbackFor = Exception.class) // 确保任何异常都会回滚事务
    @Override
    public ServerResponse classScheduling(String semester) {
        try {
            log.info("开始排课, 学期: {}", semester);
            long start = System.currentTimeMillis();

            // 1、获得指定学期的开课任务
            QueryWrapper<ClassTask> wrapper = new QueryWrapper<ClassTask>().eq("semester", semester);
            List<ClassTask> classTaskList = classTaskDao.selectList(wrapper);

            if (CollectionUtils.isEmpty(classTaskList)) {
                return ServerResponse.ofError("排课失败，该学期没有排课任务！");
            }

            // 2、将开课任务编码成基因(分为固定/不固定时间)
            List<Map<String, List<String>>>  geneList = coding(classTaskList);
            // 3、给初始基因编码随机分配时间
            List<String> resultGeneList = codingTime(geneList);
            // 4、将基因按班级分组，形成初始种群(个体)
            Map<String, List<String>> individualMap = transformIndividual(resultGeneList);
            // 5、遗传进化
            individualMap = geneticEvolution(individualMap);
            // 6、为最终的基因分配教室
            List<String> finalGeneList = finalResult(individualMap);
            // 7、解码最终基因，得到上课计划
            List<CoursePlan> coursePlanList = decoding(finalGeneList, semester);

            // 8、将排课结果写入数据库
            // 8.1、先删除该学期已有的旧课表 (这里仍然使用 coursePlanDao，因为这是我们自定义的SQL)
            int deletedRows = coursePlanDao.deletePlanBySemester(semester);
            log.info("已删除学期 {} 的旧课表 {} 条", semester, deletedRows);

            // 8.2、【核心修正】使用 coursePlanService 来调用 saveBatch
            if (!CollectionUtils.isEmpty(coursePlanList)) {
                // 调用 Service 层的 saveBatch 方法
                boolean saveSuccess = coursePlanService.saveBatch(coursePlanList);
                if (!saveSuccess) {
                    throw new RuntimeException("批量保存课表到数据库失败！");
                }
            }

            log.info("排课成功！共生成 {} 条课程计划，耗时：{} ms", coursePlanList.size(), (System.currentTimeMillis() - start));
            return ServerResponse.ofSuccess("排课成功！");

        } catch (Exception e) {
            log.error("排课期间发生严重异常: {}", e.getMessage(), e);
            throw new RuntimeException("排课失败，发生内部错误，事务已回滚。错误信息: " + e.getMessage());
        }
    }


    /**
     * 6. 分配教室并做教室冲突检测
     */
    private List<String> finalResult(Map<String, List<String>> individualMap) {
        List<String> resultList = new ArrayList<>();
        List<String> allGenes = collectGene(individualMap);

        List<String> gradeList = allGenes.stream()
                .map(gene -> ClassUtil.cutGene(ConstantInfo.GRADE_NO, gene))
                .distinct()
                .collect(Collectors.toList());

        Map<String, List<String>> gradeMap = collectGeneByGrade(allGenes, gradeList);

        for (Map.Entry<String, List<String>> entry : gradeMap.entrySet()) {
            String gradeNo = entry.getKey();
            List<String> gradeGeneList = entry.getValue();

            List<String> teachBuildNoList = teachBuildInfoDao.selectTeachBuildList(gradeNo);
            if (CollectionUtils.isEmpty(teachBuildNoList)) {
                throw new RuntimeException("排课失败：年级 " + gradeNo + " 未分配任何教学楼！");
            }

            List<Classroom> availableClassrooms = classroomDao.selectList(new QueryWrapper<Classroom>().in("teachbuild_no", teachBuildNoList));
            if (CollectionUtils.isEmpty(availableClassrooms)) {
                throw new RuntimeException("排课失败：年级 " + gradeNo + " 分配的教学楼下没有任何教室！");
            }

            for (String gene : gradeGeneList) {
                String classroomNo = issueClassroom(gene, availableClassrooms, resultList);
                resultList.add(gene + classroomNo);
            }
        }
        return resultList;
    }

    /**
     * 为单个基因分配具体教室
     */
    private String issueClassroom(String gene, List<Classroom> availableClassrooms, List<String> resultList) {
        String courseAttr = ClassUtil.cutGene(ConstantInfo.COURSE_ATTR, gene);
        String classNo = ClassUtil.cutGene(ConstantInfo.CLASS_NO, gene);
        int studentNum = classInfoDao.selectStuNum(classNo);

        List<Classroom> targetClassrooms;
        // 根据课程属性筛选教室类型
        if (courseAttr.equals(ConstantInfo.EXPERIMENT_COURSE)) {
            targetClassrooms = classroomDao.selectList(new QueryWrapper<Classroom>().eq("attr", "03")); // 假设实验楼属性是03
        } else if (courseAttr.equals(ConstantInfo.PHYSICAL_COURSE)) {
            targetClassrooms = classroomDao.selectList(new QueryWrapper<Classroom>().eq("attr", "04")); // 假设体育场馆属性是04
        } else {
            targetClassrooms = availableClassrooms.stream()
                    .filter(c -> "01".equals(c.getAttr())) // 普通教室
                    .collect(Collectors.toList());
        }

        if (CollectionUtils.isEmpty(targetClassrooms)) {
            throw new RuntimeException("排课失败：无法为课程属性 " + courseAttr + " 找到任何匹配类型的教室！");
        }

        // 【核心修正】调用修正后的 chooseClassroom 方法
        return chooseClassroom(studentNum, gene, targetClassrooms, resultList);
    }

    /**
     * 【核心修正】给不同课程的基因编码选择一个教室，避免无限递归
     */
    private String chooseClassroom(int studentNum, String gene, List<Classroom> classroomList, List<String> resultList) {
        // 将教室列表随机打乱，以实现随机性
        Collections.shuffle(classroomList);

        // 使用循环遍历所有可能的教室
        for (Classroom classroom : classroomList) {
            // 如果教室满足所有条件（容量、时间、属性）
            if (judgeClassroom(studentNum, gene, classroom, resultList)) {
                return classroom.getClassroomNo(); // 找到教室，立即返回
            }
        }

        // 【重要】如果循环结束了还没找到教室，说明资源不足，抛出异常终止排课
        String courseInfo = String.format("课程[班级:%s, 课程号:%s, 时间:%s, 人数:%d]",
                ClassUtil.cutGene(ConstantInfo.CLASS_NO, gene),
                ClassUtil.cutGene(ConstantInfo.COURSE_NO, gene),
                ClassUtil.cutGene(ConstantInfo.CLASS_TIME, gene),
                studentNum);
        throw new RuntimeException("教室资源不足！无法为 " + courseInfo + " 找到可用的教室。");
    }

    /**
     * 判断教室是否符合上课班级所需（属性、容量、时间是否冲突）
     */
    private Boolean judgeClassroom(int studentNum, String gene, Classroom classroom, List<String> resultList) {
        // 1. 检查容量
        if (classroom.getCapacity() < studentNum) {
            return false;
        }

        // 2. 检查课程属性与教室属性是否匹配
        String courseAttr = ClassUtil.cutGene(ConstantInfo.COURSE_ATTR, gene);
        // 主要课程和次要课程都应在普通教室
        if (courseAttr.equals(ConstantInfo.MAIN_COURSE) || courseAttr.equals(ConstantInfo.SECONDARY_COURSE)) {
            if (!"01".equals(classroom.getAttr())) { // 假设普通教室属性为 "01"
                return false;
            }
        } else { // 其他课程（实验、体育等）属性必须完全匹配
            if (!courseAttr.equals(classroom.getAttr())) {
                return false;
            }
        }

        // 3. 检查该教室在同一时间是否空闲
        return isFree(gene, resultList, classroom);
    }

    /**
     * 判断同一时间同一个教室是否有多个班级使用
     */
    private Boolean isFree(String gene, List<String> resultList, Classroom classroom) {
        if (resultList.isEmpty()) {
            return true;
        }
        String classTime = ClassUtil.cutGene(ConstantInfo.CLASS_TIME, gene);

        for (String resultGene : resultList) {
            String allocatedClassroomNo = ClassUtil.cutGene(ConstantInfo.CLASSROOM_NO, resultGene);
            // 如果是同一个教室
            if (allocatedClassroomNo.equals(classroom.getClassroomNo())) {
                String allocatedTime = ClassUtil.cutGene(ConstantInfo.CLASS_TIME, resultGene);
                // 如果上课时间也相同，则冲突
                if (allocatedTime.equals(classTime)) {
                    return false;
                }
            }
        }
        return true;
    }

    // =========================================================================
    //  以下是您的遗传算法核心逻辑，本次修改未对其进行大幅调整，仅保留结构
    //  您可以将您原来的代码直接粘贴过来替换以下部分，或者使用以下微调后的版本
    // =========================================================================

    private Map<String, List<String>> geneticEvolution(Map<String, List<String>> individualMap) {
        int generation = ConstantInfo.GENERATION;
        for (int i = 0; i < generation; ++i) {
            individualMap = hybridization(individualMap);
            List<String> allGenes = collectGene(individualMap);
            allGenes = geneMutation(allGenes);
            allGenes = conflictResolution(allGenes);
            individualMap = transformIndividual(allGenes);
        }
        return individualMap;
    }

    private List<String> conflictResolution(List<String> resultGeneList) {
        int conflictTimes = 0;
        eitx:
        for (int i = 0; i < resultGeneList.size(); i++) {
            String gene = resultGeneList.get(i);
            // 固定时间的课程不参与冲突解决，因为它们是既定事实
            if ("2".equals(ClassUtil.cutGene(ConstantInfo.IS_FIX, gene))) {
                continue;
            }
            String teacherNo = ClassUtil.cutGene(ConstantInfo.TEACHER_NO, gene);
            String classTime = ClassUtil.cutGene(ConstantInfo.CLASS_TIME, gene);
            String classNo = ClassUtil.cutGene(ConstantInfo.CLASS_NO, gene);

            for (int j = i + 1; j < resultGeneList.size(); j++) {
                String tempGene = resultGeneList.get(j);
                String tempTeacherNo = ClassUtil.cutGene(ConstantInfo.TEACHER_NO, tempGene);
                String tempClassTime = ClassUtil.cutGene(ConstantInfo.CLASS_TIME, tempGene);

                // 冲突：同一老师在同一时间上课
                if (teacherNo.equals(tempTeacherNo) && classTime.equals(tempClassTime)) {
                    conflictTimes++;
                    String newClassTime = ClassUtil.randomTime(gene, resultGeneList);
                    String newGene = gene.substring(0, 24) + newClassTime;
                    resultGeneList = replace(resultGeneList, gene, newGene);
                    i = -1; // 重置外层循环，从头开始检查
                    continue eitx;
                }
            }
        }
        if (conflictTimes > 0) {
            log.info("遗传算法解决冲突次数: {}", conflictTimes);
        }
        return resultGeneList;
    }

    private List<String> replace(List<String> list, String oldGene, String newGene) {
        int index = list.indexOf(oldGene);
        if (index != -1) {
            list.set(index, newGene);
        }
        return list;
    }

    private Map<String, List<String>> collectGeneByGrade(List<String> resultGeneList, List<String> gradeList) {
        return resultGeneList.stream()
                .collect(Collectors.groupingBy(gene -> ClassUtil.cutGene(ConstantInfo.GRADE_NO, gene)));
    }

    private List<String> collectGene(Map<String, List<String>> individualMap) {
        return individualMap.values().stream()
                .flatMap(List::stream)
                .collect(Collectors.toList());
    }

    private List<String> geneMutation(List<String> resultGeneList) {
        if(CollectionUtils.isEmpty(resultGeneList)) return resultGeneList;
        double mutationRate = 0.005;
        int mutationNumber = (int)(resultGeneList.size() * mutationRate);
        if (mutationNumber < 1) mutationNumber = 1;

        Random random = new Random();
        for (int i = 0; i < mutationNumber; i++) {
            int index = random.nextInt(resultGeneList.size());
            String gene = resultGeneList.get(index);
            // 固定时间的课程不参与变异
            if ("1".equals(ClassUtil.cutGene(ConstantInfo.IS_FIX, gene))) {
                String newClassTime = ClassUtil.randomTime(gene, resultGeneList);
                String newGene = gene.substring(0, 24) + newClassTime;
                resultGeneList.set(index, newGene);
            }
        }
        return resultGeneList;
    }

    private Map<String, List<String>> hybridization(Map<String, List<String>> individualMap) {
        for (String classNo : individualMap.keySet()) {
            List<String> individualList = individualMap.get(classNo);
            List<String> oldIndividualList = new ArrayList<>(individualList);

            individualList = selectGene(individualList);

            if (ClassUtil.calculatExpectedValue(individualList) < ClassUtil.calculatExpectedValue(oldIndividualList)) {
                individualMap.put(classNo, oldIndividualList);
            }
        }
        return individualMap;
    }

    private List<String> selectGene(List<String> individualList) {
        if (individualList.size() < 2) {
            return individualList;
        }
        Random random = new Random();
        int firstIndex = random.nextInt(individualList.size());
        int secondIndex;
        do {
            secondIndex = random.nextInt(individualList.size());
        } while (firstIndex == secondIndex);

        String firstGene = individualList.get(firstIndex);
        String secondGene = individualList.get(secondIndex);

        // 如果任一课程是固定时间的，则不进行交叉
        if ("2".equals(ClassUtil.cutGene(ConstantInfo.IS_FIX, firstGene)) || "2".equals(ClassUtil.cutGene(ConstantInfo.IS_FIX, secondGene))) {
            return individualList;
        }

        String firstClassTime = ClassUtil.cutGene(ConstantInfo.CLASS_TIME, firstGene);
        String secondClassTime = ClassUtil.cutGene(ConstantInfo.CLASS_TIME, secondGene);

        String newFirstGene = firstGene.substring(0, 24) + secondClassTime;
        String newSecondGene = secondGene.substring(0, 24) + firstClassTime;

        individualList.set(firstIndex, newFirstGene);
        individualList.set(secondIndex, newSecondGene);

        return individualList;
    }

    private List<Map<String, List<String>>> coding(List<ClassTask> classTaskList) {
        Map<String, List<String>> geneListMap = new HashMap<>();
        List<String> unFixedTimeGeneList = new ArrayList<>();
        List<String> fixedTimeGeneList = new ArrayList<>();

        for (ClassTask classTask : classTaskList) {
            int size = classTask.getWeeksNumber() / 2;
            for (int i = 0; i < size; i++) {
                String baseGene = classTask.getIsFix() + classTask.getGradeNo() + classTask.getClassNo()
                        + classTask.getTeacherNo() + classTask.getCourseNo() + classTask.getCourseAttr();
                if ("1".equals(classTask.getIsFix())) {
                    unFixedTimeGeneList.add(baseGene + ConstantInfo.DEFAULT_CLASS_TIME);
                } else if ("2".equals(classTask.getIsFix())) {
                    String classTime = classTask.getClassTime().substring(i * 2, (i + 1) * 2);
                    fixedTimeGeneList.add(baseGene + classTime);
                }
            }
        }
        geneListMap.put(UNFIXED_TIME, unFixedTimeGeneList);
        geneListMap.put(IS_FIX_TIME, fixedTimeGeneList);
        return Collections.singletonList(geneListMap);
    }

    private List<String> codingTime(List<Map<String, List<String>>> geneList) {
        List<String> resultGeneList = new ArrayList<>(geneList.get(0).get(IS_FIX_TIME));
        List<String> unFixedTimeGeneList = geneList.get(0).get(UNFIXED_TIME);

        for (String gene : unFixedTimeGeneList) {
            String classTime = ClassUtil.randomTime(gene, resultGeneList);
            String newGene = gene.substring(0, 24) + classTime;
            resultGeneList.add(newGene);
        }
        return resultGeneList;
    }

    private Map<String, List<String>> transformIndividual(List<String> resultGeneList) {
        return resultGeneList.stream()
                .collect(Collectors.groupingBy(gene -> ClassUtil.cutGene(ConstantInfo.CLASS_NO, gene)));
    }

    /**
     * 【重要修正】解码最终基因，得到 CoursePlan 实体列表
     */
    private List<CoursePlan> decoding(List<String> resultList, String semester) {
        List<CoursePlan> coursePlanList = new ArrayList<>();
        for (String gene : resultList) {
            CoursePlan coursePlan = new CoursePlan();
            coursePlan.setGradeNo(ClassUtil.cutGene(ConstantInfo.GRADE_NO, gene));
            coursePlan.setClassNo(ClassUtil.cutGene(ConstantInfo.CLASS_NO, gene));
            coursePlan.setCourseNo(ClassUtil.cutGene(ConstantInfo.COURSE_NO, gene));
            coursePlan.setTeacherNo(ClassUtil.cutGene(ConstantInfo.TEACHER_NO, gene));
            coursePlan.setClassroomNo(ClassUtil.cutGene(ConstantInfo.CLASSROOM_NO, gene));
            coursePlan.setClassTime(ClassUtil.cutGene(ConstantInfo.CLASS_TIME, gene));
            // 【重要】为实体设置学期，以便能正确存入数据库并用于后续查询
            coursePlan.setSemester(semester);
            coursePlanList.add(coursePlan);
        }
        return coursePlanList;
    }
}
