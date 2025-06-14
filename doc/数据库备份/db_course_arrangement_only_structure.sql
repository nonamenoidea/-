/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80042
 Source Host           : localhost:3306
 Source Schema         : db_course_arrangement

 Target Server Type    : MySQL
 Target Server Version : 80042
 File Encoding         : 65001

 Date: 13/06/2025 23:14:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `admin_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员编号',
  `username` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '真实姓名',
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户类型',
  `jobtitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职称',
  `license` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '证件照地址',
  `teach` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教授科目',
  `telephone` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '签名',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '管理员类型',
  `piority` int NULL DEFAULT NULL COMMENT '优先级',
  `power` tinyint(1) NULL DEFAULT NULL COMMENT '1为管理员，0为超级管理员',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '账号状态',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_banner
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner`;
CREATE TABLE `tb_banner`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `image_url` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_class_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_class_info`;
CREATE TABLE `tb_class_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id,班级表',
  `class_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级编号',
  `class_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级名称',
  `num` int NOT NULL DEFAULT 0 COMMENT '班级人数',
  `teacher` int NULL DEFAULT NULL COMMENT '班主任',
  `remark` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '直接用来做为年级编号的划分了',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_class_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_class_task`;
CREATE TABLE `tb_class_task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id，即将要上课的，需要进行排课的',
  `semester` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学期',
  `grade_no` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '年级编号',
  `class_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级编号',
  `course_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `teacher_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教师编号',
  `realname` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教师姓名',
  `courseAttr` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程属性',
  `studentNum` int NOT NULL COMMENT '学生人数',
  `weeks_sum` int NOT NULL COMMENT '周数',
  `weeks_number` int NOT NULL COMMENT '周学时',
  `isFix` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否固定上课时间',
  `class_time` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '固定时间的话,2位为一个时间位置',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_classroom
-- ----------------------------
DROP TABLE IF EXISTS `tb_classroom`;
CREATE TABLE `tb_classroom`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '教室id',
  `classroom_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教室编号',
  `classroom_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `teachbuild_no` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '所在教学楼编号',
  `capacity` int NOT NULL COMMENT '教室人数容量',
  `attr` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教室属性',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除（默认0显示，1删除）',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_course_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_info`;
CREATE TABLE `tb_course_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `course_attr` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程属性',
  `publisher` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '课程状态',
  `piority` int NULL DEFAULT NULL COMMENT '优先级',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_course_plan
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_plan`;
CREATE TABLE `tb_course_plan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grade_no` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '年级编号',
  `class_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '班级编号',
  `course_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程编号',
  `teacher_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '讲师编号',
  `classroom_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教室编号',
  `class_time` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '上课时间',
  `weeks_sum` int NULL DEFAULT NULL COMMENT '周数',
  `semester` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学期',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_doc
-- ----------------------------
DROP TABLE IF EXISTS `tb_doc`;
CREATE TABLE `tb_doc`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'doc文件名',
  `file_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件实际名',
  `doc_url` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `to_class_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '目标班级',
  `from_user_id` int NULL DEFAULT NULL COMMENT '发布者id',
  `from_user_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发布者名字',
  `from_user_type` tinyint(1) NULL DEFAULT 2 COMMENT '来自的用户类型1:管理员。2：讲师',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `clicks` bigint NULL DEFAULT NULL COMMENT '阅读次数',
  `expire` int NULL DEFAULT NULL COMMENT '有效天数',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_exercise
-- ----------------------------
DROP TABLE IF EXISTS `tb_exercise`;
CREATE TABLE `tb_exercise`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_id` int NOT NULL COMMENT '题目类别id',
  `class_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '题目所属班级，编号',
  `exercise_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '题目名称',
  `multiselect` tinyint(1) NULL DEFAULT 0 COMMENT '是否多选，默认0单选，，1多选',
  `answer` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '选项',
  `option_a` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '选项A的值',
  `option_b` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_c` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_d` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_e` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_f` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fraction` int NULL DEFAULT NULL COMMENT '分值',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_exercise_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_exercise_category`;
CREATE TABLE `tb_exercise_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '题目类别名称',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_grade_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_grade_info`;
CREATE TABLE `tb_grade_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id,年级表',
  `grade_no` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级编号',
  `grade_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_location_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_location_info`;
CREATE TABLE `tb_location_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id,位置信息，高一在哪栋楼，高二在哪',
  `teachbuild_no` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教学楼编号,放教学楼表中编号',
  `grade_no` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级编号,放年级表中的id',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_online_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_online_category`;
CREATE TABLE `tb_online_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_no` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类别编号，01-99',
  `category_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '网课类别',
  `parent_id` int NULL DEFAULT 0 COMMENT '父级id，默认0为一级分类',
  `piority` int NULL DEFAULT NULL COMMENT '优先级',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_online_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_online_course`;
CREATE TABLE `tb_online_course`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `online_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '网课编号，100000，6位数',
  `online_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '网课课程名',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程介绍',
  `cover` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面图片地址',
  `online_category_id` int NULL DEFAULT NULL COMMENT '网课类型id',
  `online_category_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `piority` int NULL DEFAULT NULL COMMENT '优先级',
  `from_user_type` tinyint(1) NULL DEFAULT NULL COMMENT '发布者类型，1：管理员，2：讲师',
  `from_user_id` int NULL DEFAULT NULL COMMENT '发布者id',
  `from_user_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发布者名称',
  `clicks` bigint NULL DEFAULT NULL COMMENT '点击次数',
  `deleted` tinyint(1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_online_video
-- ----------------------------
DROP TABLE IF EXISTS `tb_online_video`;
CREATE TABLE `tb_online_video`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `online_course_id` int NULL DEFAULT NULL COMMENT '所属在线课程id',
  `video_no` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类似01-001',
  `video_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '视频名称',
  `video_url` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '视频路径',
  `cover` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '视频封面',
  `from_user_type` tinyint(1) NULL DEFAULT NULL COMMENT '上传用户类型，1管理员，2讲师',
  `from_user_id` int NULL DEFAULT NULL COMMENT '上传者id',
  `from_user_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传者名称',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `student_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号，可以用于登录',
  `username` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称，可以用于登录',
  `password` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '真实姓名',
  `user_type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '标记用户类型3',
  `grade` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级',
  `class_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所在班级',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '当前住址',
  `telephone` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '签名',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '账号状态,0为正常，1为封禁',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_study_logs
-- ----------------------------
DROP TABLE IF EXISTS `tb_study_logs`;
CREATE TABLE `tb_study_logs`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '学生学习记录表',
  `student_id` int NULL DEFAULT NULL COMMENT '学生id',
  `online_course_id` int NULL DEFAULT NULL COMMENT '网课id',
  `online_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '网课名称',
  `video_id` int NULL DEFAULT NULL COMMENT '看到哪个视频了',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_teach_build_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_teach_build_info`;
CREATE TABLE `tb_teach_build_info`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id,教学楼信息表',
  `teach_build_no` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教学楼编号',
  `teach_build_name` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教学楼名称',
  `teach_build_location` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教学楼位置',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id，讲师表',
  `teacher_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教师编号',
  `username` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称（用户名）',
  `password` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '真实姓名',
  `user_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '用户类型',
  `jobtitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职称',
  `grade_no` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属年级',
  `license` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '证件照(地址)',
  `teach` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教授科目',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `telephone` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述（签名）',
  `power` tinyint(1) NULL DEFAULT 1 COMMENT '操作权限',
  `piority` int NULL DEFAULT NULL COMMENT '优先级',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '账号状态',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
