package com.lyk.coursearrange.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lyk.coursearrange.entity.CoursePlan;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 课程计划表（课表）的数据访问对象
 * 依赖 MyBatis-Plus 实现标准的增删改查操作
 *
 * @author lequal
 * @since 2020-04-15
 */
@Repository
public interface CoursePlanDao extends BaseMapper<CoursePlan> {

    /**
     * 【重要修正】根据学期标识，删除该学期所有的课程计划。
     * 将返回类型从 void 修改为 int，以便接收受影响的行数。
     *
     * @param semester 学期标识 (例如: "2024-2025-1")
     * @return 返回被删除的记录行数
     */
    @Delete("DELETE FROM tb_course_plan WHERE semester = #{semester}")
    int deletePlanBySemester(@Param("semester") String semester);

    // 标准的 insert, saveBatch 等方法均由 BaseMapper<CoursePlan> 自动提供。
    // 无需自定义 insert 方法。
}
