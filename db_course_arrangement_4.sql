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

 Date: 13/06/2025 23:14:47
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
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, '10011', 'admin', '123456789', '吴彦祖', 1, '教务处主任', NULL, NULL, NULL, 'admin@guet.com', NULL, NULL, '', '认真对待工作', '务实', NULL, NULL, NULL, 0, 0, '2024-11-14 23:31:17', '2025-06-06 08:37:56');
INSERT INTO `tb_admin` VALUES (2, '10012', '123', '123456', '张三丰', 1, '教务处副主任', NULL, NULL, NULL, 'admin@guet.com', NULL, NULL, NULL, '无私奉献', '亲切', NULL, NULL, NULL, 0, 0, '2025-06-03 21:24:57', NULL);
INSERT INTO `tb_admin` VALUES (3, '10013', 'admin1', '123456', '王五', 1, '教务处副主任', NULL, NULL, NULL, 'admin@guet.com', NULL, NULL, NULL, '加油每一天', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);

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
-- Records of tb_banner
-- ----------------------------

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
-- Records of tb_class_info
-- ----------------------------
INSERT INTO `tb_class_info` VALUES (1, '20250101', '25年大一1班', 0, 1, '01', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (2, '20250102', '25年大一2班', 0, 1, '01', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (3, '20250103', '25年大一3班', 0, 3, '01', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (4, '20250104', '25年大一4班', 0, 5, '01', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (5, '20250105', '25年大一5班', 0, 5, '01', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (6, '20250201', '25年大二1班', 0, 6, '02', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (7, '20250202', '25年大二2班', 0, 7, '02', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (8, '20250203', '25年大二3班', 0, 8, '02', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (9, '20250204', '25年大二4班', 0, 9, '02', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (10, '20250205', '25年大二5班', 0, 10, '02', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (11, '20250301', '25年大三1班', 0, 11, '03', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (12, '20250302', '25年大三2班', 0, 12, '03', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (13, '20250303', '25年大三3班', 0, 13, '03', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (14, '20250304', '25年大三4班', 0, 14, '03', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (15, '20250305', '25年大三5班', 0, 15, '03', 0, NULL, '2025-05-20 16:23:22');
INSERT INTO `tb_class_info` VALUES (24, '20250106', '大一6班-测试班级', 0, 41, '01', 0, '2025-03-06 08:43:07', NULL);

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
-- Records of tb_class_task
-- ----------------------------
INSERT INTO `tb_class_task` VALUES (1, '2024-2025-1', '01', '20250101', '100001', '大一语文', '10010', '梁晓明', '01', 42, 20, 6, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (2, '2024-2025-1', '01', '20250101', '100033', '大一数学', '10012', '李雪雪', '01', 37, 20, 6, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (3, '2024-2025-1', '01', '20250101', '100056', '大一英语', '10013', '王小芳', '01', 39, 20, 6, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (4, '2024-2025-1', '01', '20250101', '100004', '大一物理', '10025', '张德良', '02', 42, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (5, '2024-2025-1', '01', '20250101', '100014', '大一化学', '10033', '韩云', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (6, '2024-2025-1', '01', '20250101', '100041', '大一思想政治', '10045', '江大波', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (7, '2024-2025-1', '01', '20250101', '100021', '大一历史', '10044', '吴天盛', '02', 40, 20, 4, '1', NULL, 1, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (8, '2024-2025-1', '01', '20250101', '100007', '大一地理', '10043', '王杰', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (9, '2024-2025-1', '01', '20250101', '100027', '大一生物', '10042', '谭咏麟', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (10, '2024-2025-1', '01', '20250101', '100051', '体育课', '10041', '张杰', '04', 40, 20, 2, '2', '14', 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (11, '2024-2025-1', '01', '20250101', '100066', '物理实验', '10025', '张德良', '03', 40, 20, 2, '2', '04', 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (12, '2024-2025-1', '01', '20250101', '100067', '化学实验', '10023', '张靓颖', '03', 40, 20, 2, '2', '15', 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (13, '2024-2025-1', '01', '20250102', '100001', '大一语文', '10010', '梁晓明', '01', 42, 20, 6, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (14, '2024-2025-1', '01', '20250102', '100033', '大一数学', '10012', '李雪雪', '01', 37, 20, 6, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (15, '2024-2025-1', '01', '20250102', '100056', '大一英语', '10013', '王小芳', '01', 39, 20, 6, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (16, '2024-2025-1', '01', '20250102', '100004', '大一物理', '10025', '张德良', '02', 42, 20, 2, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (17, '2024-2025-1', '01', '20250102', '100014', '大一化学', '10033', '韩云', '02', 40, 20, 2, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (18, '2024-2025-1', '01', '20250102', '100041', '大一思想政治', '10045', '江大波', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (19, '2024-2025-1', '01', '20250102', '100021', '大一历史', '10044', '吴天盛', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (20, '2024-2025-1', '01', '20250102', '100007', '大一地理', '10043', '王杰', '02', 40, 20, 4, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (21, '2024-2025-1', '01', '20250102', '100027', '大一生物', '10042', '谭咏麟', '02', 40, 20, 2, '1', NULL, 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (22, '2024-2025-1', '01', '20250102', '100051', '体育课', '10041', '张杰', '04', 40, 20, 2, '2', '19', 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (23, '2019-2020-1', '01', '20250102', '100066', '物理实验', '10025', '张德良', '03', 40, 20, 2, '2', '09', 1, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (24, '2024-2025-1', '01', '20250102', '100067', '化学实验', '10023', '张靓颖', '03', 40, 20, 2, '2', '20', 0, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (34, '2024-2025-1', '01', '20250103', '100062', '信息系统', '10039', '江晓东', '03', 45, 20, 2, '1', NULL, 1, '2025-03-07 10:25:35', NULL);
INSERT INTO `tb_class_task` VALUES (73, '2024-2025-1', '01', '20250201', '10007', '大一地理', '10019', '汪莉莉', '01', 40, 8, 12, '1', '09', 1, '2025-06-13 19:27:09', NULL);
INSERT INTO `tb_class_task` VALUES (74, '2024-2025-1', '01', '20250101', '100007', '大一地理', '10019', '汪莉莉', '01', 40, 8, 14, '1', '08', 0, '2025-06-13 19:29:43', NULL);
INSERT INTO `tb_class_task` VALUES (75, '2024-2025-1', '01', '20250104', '100003', '大一数学', '10014', '孙晓明', '02', 60, 10, 8, '2', '14', 1, '2025-06-13 21:09:54', NULL);
INSERT INTO `tb_class_task` VALUES (76, '2024-2025-1', '01', '20250104', '100003', '大一数学', '10014', '孙晓明', '01', 60, 8, 8, '2', '15', 1, '2025-06-13 21:14:52', NULL);
INSERT INTO `tb_class_task` VALUES (77, '2024-2025-1', '01', '20250104', '100003', '大一数学', '10014', '孙晓明', '01', 60, 8, 8, '1', '15', 0, '2025-06-13 21:15:07', NULL);

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
-- Records of tb_classroom
-- ----------------------------
INSERT INTO `tb_classroom` VALUES (1, '01-101', '01-101', '01', 50, '01', '备注', 0, NULL, '2022-07-01 14:21:48');
INSERT INTO `tb_classroom` VALUES (2, '01-102', '01-102', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (3, '01-103', '01-103', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (4, '01-104', '01-104', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (5, '01-105', '01-105', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (6, '01-201', '01-201', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (7, '01-202', '01-202', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (8, '01-203', '01-203', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (9, '01-204', '01-204', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (10, '01-205', '01-205', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (11, '01-301', '01-301', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (12, '01-302', '01-302', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (13, '01-303', '01-303', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (14, '01-304', '01-304', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (15, '01-305', '01-305', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (16, '01-401', '01-401', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (17, '01-402', '01-402', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (18, '01-403', '01-403', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (19, '01-404', '01-404', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (20, '01-405', '01-405', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (21, '01-501', '01-501', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (22, '01-502', '01-502', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (23, '01-503', '01-503', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (24, '01-504', '01-504', '01', 50, '01', NULL, 0, '2020-03-19 12:32:18', '2020-11-26 12:32:21');
INSERT INTO `tb_classroom` VALUES (25, '01-505', '01-505', '01', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (26, '02-101', '02-101', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (27, '02-102', '02-102', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (28, '02-103', '02-103', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (29, '02-104', '02-104', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (30, '02-105', '02-105', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (31, '02-201', '02-202', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (32, '02-202', '02-202', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (33, '02-203', '02-203', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (34, '02-204', '02-204', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (35, '02-205', '02-205', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (36, '02-301', '02-301', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (37, '02-302', '02-302', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (38, '02-303', '02-303', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (39, '02-304', '02-304', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (40, '02-305', '02-305', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (41, '02-401', '02-401', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (42, '02-402', '02-402', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (43, '02-403', '02-403', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (44, '02-404', '02-404', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (45, '02-405', '02-405', '02', 60, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (46, '03-101', '03-101', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (47, '03-102', '03-102', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (48, '03-103', '03-103', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (49, '03-104', '03-104', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (50, '03-105', '03-105', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (51, '03-201', '03-201', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (52, '03-202', '03-202', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (53, '03-203', '03-203', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (54, '03-204', '03-204', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (55, '03-205', '03-205', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (56, '03-301', '03-301', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (57, '03-302', '03-302', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (58, '03-303', '03-303', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (59, '03-304', '03-304', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (60, '03-305', '03-305', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (61, '03-401', '03-401', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (62, '03-402', '03-402', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (63, '03-403', '03-403', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (64, '03-404', '03-404', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (65, '03-405', '03-405', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (66, '03-501', '03-501', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (67, '03-502', '03-502', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (68, '03-503', '03-503', '03', 50, '01', '', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (69, '03-504', '03-504', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (70, '03-505', '03-505', '03', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (71, '04-101', '04-101', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (72, '04-102', '04-102', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (73, '04-103', '04-103', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (74, '04-104', '04-104', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (75, '04-105', '04-105', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (76, '04-201', '04-201', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (77, '04-202', '04-202', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (78, '04-203', '04-203', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (79, '04-204', '04-204', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (80, '04-205', '04-205', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (81, '04-301', '04-301', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (82, '04-302', '04-302', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (83, '04-303', '04-303', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (84, '04-304', '04-304', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (85, '04-305', '04-305', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (86, '04-401', '04-401', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (87, '04-402', '04-402', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (88, '04-403', '04-403', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (99, '04-404', '04-404', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (100, '04-405', '04-405', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (101, '04-501', '04-501', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (102, '04-502', '04-502', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (103, '04-503', '04-503', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (104, '04-504', '04-504', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (105, '04-505', '04-505', '04', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (106, '05-101', '05-101', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (107, '05-102', '05-102', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (108, '05-103', '05-103', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (109, '05-104', '05-104', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (110, '05-105', '05-105', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (111, '05-201', '05-201', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (112, '05-202', '05-202', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (113, '05-203', '05-203', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (114, '05-204', '05-204', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (115, '05-205', '05-205', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (116, '05-301', '05-301', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (117, '05-302', '05-302', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (118, '05-303', '05-303', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (119, '05-304', '05-304', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (120, '05-305', '05-305', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (121, '05-401', '05-401', '05', 50, '01', '', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (122, '05-402', '05-402', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (123, '05-403', '05-403', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (124, '05-404', '05-404', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (125, '05-405', '05-405', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (126, '05-501', '05-501', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (127, '05-502', '05-502', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (128, '05-503', '05-503', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (129, '05-504', '05-504', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (130, '05-505', '05-505', '05', 50, '01', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (133, '12-101', '12-101', '12', 120, '04', '体育楼', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (134, '12-102', '12-102', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (135, '12-103', '12-103', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (136, '12-104', '12-104', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (137, '12-201', '12-201', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (138, '12-202', '12-202', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (139, '12-203', '12-203', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (140, '12-204', '12-204', '12', 120, '04', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (141, '08-101', '08-101', '08', 50, '03', '实验楼', 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (142, '08-102', '08-102', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (143, '08-103', '08-103', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (144, '08-104', '08-104', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (145, '08-105', '08-105', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (146, '08-201', '08-201', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (147, '08-202', '08-202', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (148, '08-203', '08-203', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (149, '08-204', '08-204', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (150, '08-205', '08-205', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (151, '08-301', '08-301', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (152, '08-302', '08-302', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (153, '08-303', '08-303', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (154, '08-304', '08-304', '08', 50, '03', NULL, 0, NULL, NULL);
INSERT INTO `tb_classroom` VALUES (155, '08-305', '08-305', '08', 50, '03', NULL, 0, NULL, NULL);

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
-- Records of tb_course_info
-- ----------------------------
INSERT INTO `tb_course_info` VALUES (1, '100001', '大一语文', '01', '桂电出版社', NULL, NULL, '测试添加', 0, NULL, '2025-02-19 20:59:58');
INSERT INTO `tb_course_info` VALUES (2, '100002', '大二语文', '01', '清华大学出版社', NULL, NULL, '清华大学使用教材', 0, NULL, '2025-02-19 20:59:58');
INSERT INTO `tb_course_info` VALUES (3, '100003', '大一数学', '01', '北京大学出版社', NULL, NULL, '谭老师授课', 0, NULL, '2025-02-19 20:59:58');
INSERT INTO `tb_course_info` VALUES (4, '100004', '大一物理', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (5, '100005', '大二哲学', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (7, '100007', '大一地理', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (8, '100008', '大一地理信息', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (9, '100009', '大二遥感', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (14, '100014', '大一化学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (15, '100015', '大一化工', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (21, '100021', '大一历史', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (22, '100022', '大一党史', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (23, '100023', '大二全球史', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (27, '100027', '大一生物', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (28, '100028', '大一医学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (29, '100029', '大二生物学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (33, '100033', '大一工科数学', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (41, '100041', '大一政治', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (42, '100042', '大一思想道德', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (51, '100051', '体育课', '04', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (53, '100053', '音乐课1', '05', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (55, '100055', '舞蹈课1', '05', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (57, '100057', '大一英语1', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (62, '100062', '信息与技术1', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (63, '100063', '信息与技术2', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (66, '100066', '物理实验', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (67, '100067', '化学实验', '03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (68, '100069', '测试课程', '02', '测试测试', NULL, NULL, '测试添加', 0, '2025-02-18 21:51:14', NULL);
INSERT INTO `tb_course_info` VALUES (69, '100070', '语文', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (70, '100071', '数学', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (71, '100072', '英语', '01', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (72, '100073', '化学', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (73, '100074', '政治', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (74, '100075', '地理', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `tb_course_info` VALUES (75, '100076', '生物', '02', NULL, NULL, NULL, NULL, 0, NULL, NULL);

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
-- Records of tb_course_plan
-- ----------------------------
INSERT INTO `tb_course_plan` VALUES (864, '01', '20250101', '100051', '10041', '12-201', '14', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (865, '01', '20250101', '100066', '10025', '08-205', '04', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (866, '01', '20250101', '100067', '10023', '08-302', '15', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (867, '01', '20250101', '100001', '10010', '01-204', '20', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (868, '01', '20250101', '100001', '10010', '01-104', '18', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (869, '01', '20250101', '100001', '10010', '01-302', '07', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (870, '01', '20250101', '100033', '10012', '01-504', '01', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (871, '01', '20250101', '100033', '10012', '01-103', '17', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (872, '01', '20250101', '100033', '10012', '01-401', '23', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (873, '01', '20250101', '100056', '10013', '01-501', '06', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (874, '01', '20250101', '100056', '10013', '01-105', '05', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (875, '01', '20250101', '100056', '10013', '01-304', '01', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (876, '01', '20250101', '100004', '10025', '01-503', '04', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (877, '01', '20250101', '100004', '10025', '01-202', '14', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (878, '01', '20250101', '100014', '10033', '01-405', '25', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (879, '01', '20250101', '100014', '10033', '01-204', '09', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (880, '01', '20250101', '100041', '10045', '01-103', '10', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (881, '01', '20250101', '100041', '10045', '01-302', '03', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (882, '01', '20250101', '100007', '10043', '01-103', '06', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (883, '01', '20250101', '100007', '10043', '01-205', '09', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (884, '01', '20250101', '100027', '10042', '01-201', '23', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (885, '01', '20250101', '100027', '10042', '01-204', '14', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (886, '01', '20250101', '100007', '10019', '01-102', '11', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (887, '01', '20250101', '100007', '10019', '01-404', '04', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (888, '01', '20250101', '100007', '10019', '01-504', '14', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (889, '01', '20250101', '100007', '10019', '01-102', '06', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (890, '01', '20250101', '100007', '10019', '01-503', '24', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (891, '01', '20250101', '100007', '10019', '01-204', '21', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (892, '01', '20250101', '100007', '10019', '01-401', '07', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (893, '01', '20250102', '100051', '10041', '12-103', '19', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (894, '01', '20250102', '100067', '10023', '08-203', '20', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (895, '01', '20250102', '100001', '10010', '01-205', '03', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (896, '01', '20250102', '100001', '10010', '01-104', '04', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (897, '01', '20250102', '100001', '10010', '01-302', '11', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (898, '01', '20250102', '100033', '10012', '01-503', '03', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (899, '01', '20250102', '100033', '10012', '01-101', '25', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (900, '01', '20250102', '100033', '10012', '01-403', '12', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (901, '01', '20250102', '100056', '10013', '01-303', '16', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (902, '01', '20250102', '100056', '10013', '01-302', '02', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (903, '01', '20250102', '100056', '10013', '01-505', '12', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (904, '01', '20250102', '100004', '10025', '01-205', '10', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (905, '01', '20250102', '100014', '10033', '01-403', '19', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (906, '01', '20250102', '100041', '10045', '01-401', '19', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (907, '01', '20250102', '100041', '10045', '01-501', '23', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (908, '01', '20250102', '100021', '10044', '01-103', '20', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (909, '01', '20250102', '100021', '10044', '01-303', '10', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (910, '01', '20250102', '100007', '10043', '01-502', '23', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (911, '01', '20250102', '100007', '10043', '01-101', '20', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (912, '01', '20250102', '100027', '10042', '01-404', '20', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (913, '01', '20250104', '100003', '10014', '01-404', '01', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (914, '01', '20250104', '100003', '10014', '01-401', '06', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (915, '01', '20250104', '100003', '10014', '01-205', '21', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);
INSERT INTO `tb_course_plan` VALUES (916, '01', '20250104', '100003', '10014', '01-502', '25', NULL, '2024-2025-1', 0, '2025-06-13 23:13:12', NULL);

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
-- Records of tb_doc
-- ----------------------------
INSERT INTO `tb_doc` VALUES (7, '一寸照.jpg', '一寸照', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/一寸照.jpg', '照片参考样例', '20250101', 1, '梁主任', 1, NULL, NULL, 0, 0, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (9, '3、软件需求说明书（GB856T——88）.doc', '需求说明', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/3、软件需求说明书（GB856T——88）.doc', '分析书', '20250201', 1, '梁主任', 1, NULL, NULL, 0, 0, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (10, '进度计划表参考.docx', '进度计划参考表', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/进度计划表参考.docx', '进度计划的参考表格', '20250103', 1, '梁主任', 1, NULL, NULL, 0, 0, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (11, '毕业设计独创性承诺书.docx', '独创性承诺', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/毕业设计独创性承诺书.docx', '测试文件', '20250105', 1, '梁主任', 1, NULL, NULL, 0, 0, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (12, '20200519161528.jpg', '123', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/20200519161528.jpg', '123', '123', 1, '梁主任', 1, NULL, NULL, 123123, 0, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (13, '467345634.docx', '123', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/467345634.docx', '3123', '12312', 1, '梁主任', 1, NULL, NULL, 123123, 1, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (14, '翻译文献未定格式.docx', '参考文献', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/翻译文献未定格式.docx', '英文翻译示例', '20250101', 1, '梁主任', 1, NULL, NULL, 0, 0, '2024-10-01 22:27:57', NULL);
INSERT INTO `tb_doc` VALUES (15, '科技大学毕业设计（论文）任务书.docx', '任务书', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/桂林电子科技大学毕业设计（论文）任务书.docx', '排课系统任务书', '20250101', 1, '梁晓明', 2, NULL, NULL, 0, 0, '2020-06-10 21:48:23', NULL);

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
-- Records of tb_exercise
-- ----------------------------
INSERT INTO `tb_exercise` VALUES (1, 1, '20250101', 'Java语言具有许多优点和特点，下列选项中，哪个反映了Java程序并行机制的特点？', 0, 'B', '安全性', '多线程', '跨平台', '可移植', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (2, 1, '20250101', '下面哪个不是JAVA关键字', 0, 'A', 'integer', 'double', 'float', 'default', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (3, 1, '20250101', '构造函数何时被调用( )', 0, 'B', '类定义时', '创建对象时', '调用对象方法时', '使用对象的变量时', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (4, 1, '20250101', '这样的语句会产生什么样的输出?  System.out.println(4&amp;7);', 0, 'A', '4', '5', '6', '7', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (5, 1, '20250101', 'JDBC中，用于表示数据库连接的对象是:', 0, 'B', 'Statement', 'Connection', 'DriverManager', 'PreparedStatement', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (6, 1, '20250101', '编写一个Filter，需要', 0, 'B', '继承Filter 类', '实现Filter 接口', '继承HttpFilter 类', '实现HttpFilter接口', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (7, 1, '20250101', '在配置tomcat虚拟目录时，需要打开哪个文件？', 0, 'B', 'index.jsp', 'web.xml', 'server.xml', '以上都不是', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (8, 1, '20250101', '在J2EE中属于Web层的组件有:', 0, 'A', 'Servlet', 'EJB', 'Applet', 'HTML', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (9, 1, '20250101', '每个使用Swing构件的程序必须有一个(   )', 0, 'D', '按钮', '标签', '菜单', '容器', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (10, 3, '20250202', '1+1=?', 0, 'A', '2', '5', '4', '3', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (11, 3, '20250202', 'z=x+y=5,x=1,y=?', 0, 'B', '3', '4', '5', '6', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (12, 3, '20250202', 'z=x+y=5,x=2,y=?', 0, 'A', '3', '4', '5', '6', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (13, 3, '20250202', '1+3=？', 0, 'D', '1', '2', '3', '4', NULL, NULL, 5, 0, NULL, NULL);
INSERT INTO `tb_exercise` VALUES (16, 1, '00000000', 'JAVA只是点', 0, 'A', 'AAAA', 'BBBB', 'CCCC', 'DDDD', '', '', 10, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (17, 15, '00000000', '常见的非关系型数据库有', 0, 'C', 'Redis', 'MonGoDb', 'MySQL', ' MemCache', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (18, 14, '00000000', '台式计算机中的CPU是指（   ）。', 0, 'A', '中央处理器', '控制器', '存储器', '输出设备', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (19, 14, '00000000', '十六进制数30转换成二进制数是（）', 0, 'A', '110000', '100000', '111000', '101000', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (20, 13, '00000000', '采用资源的有序分配法解决死锁问题的原理是破坏了（） 条件。', 0, 'A', '不可剥夺', '互斥', '环路', '部分分配', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (21, 4, '00000000', 'exercise的意思有', 1, 'ABCD', '运动', '测试', '使用', '运用', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (22, 2, '00000000', '选出下列加点字注音全对的一项（ ）', 0, 'C', '折本（shé） 干瘪（biě) 谬种(miù) 沸反盈天(fèi)', '吮吸(shǔn) 涎皮（yán） 敕造（chì） 百无聊赖(lài)', '蹙缩（cù） 驯熟(xùn) 两靥（yàn） 鸡豚狗彘（zhì）', '讪讪(shàn) 庠序（xiáng） 俨然(yǎn) 少不更事(jīng)', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (23, 1, '00000000', 'JAVA所定义的版本中不包括：（）', 0, 'D', 'JAVA2 EE', 'JAVA2 Card', 'JAVA2 ME', ' JAVA2 HE', 'JAVA2 SE', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (24, 1, '00000000', '下列说法正确的是（）', 0, 'A', 'JAVA程序的main方法必须写在类里面', 'JAVA程序中可以有多个main方法', 'JAVA程序中类名必须与文件名一样', 'JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来', NULL, NULL, NULL, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (25, 1, '00000000', '变量命名规范说法正确的是（）', 0, 'B', '变量由字母、下划线、数字、$符号随意组成；', '变量不能以数字作为开头；', 'A和a在java中是同一个变量；', '不同类型的变量，可以起相同的名字；', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (26, 1, '00000000', '下列javaDoc注释正确的是（）', 0, 'C', '/*我爱北京天安门*/', '//我爱北京天安门*/', '/**我爱北京天安门*/', ' /*我爱北京天安门**/', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (27, 1, '00000000', '为一个boolean类型变量赋值时，可以使用()方式', 0, 'B', 'boolean = 1;', 'boolean a = (9 >= 10);', 'boolean a=\"真\";', 'boolean a = = false;', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (28, 1, '00000000', '以下()不是合法的标识符', 0, 'C', 'STRING', 'x3x', 'void', 'de$f', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (29, 1, '00000000', '表达式(11+3*8)/4%3的值是()', 0, 'D', '31', '0', '1', '2', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (30, 1, '00000000', '（）表达式不可以作为循环条件', 0, 'A', 'i++;', 'i>5;', 'bEqual = str.equals(\"q\");', 'count = = i;', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (31, 1, '00000000', '运算符优先级别排序正确的是（）', 0, 'A', '由高向低分别是：()、!、算术运算符、关系运算符、逻辑运算符、赋值运算符', '由高向低分别是：()、关系运算符、算术运算符、赋值运算符、!、逻辑运算符；', '由高向低分别是：()、算术运算符、逻辑运算符、关系运算符、!、赋值运算符；', '由高向低分别是：()、!、关系运算符、赋值运算符、算术运算符、逻辑运算符', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (32, 1, '00000000', '下面有关for循环的描述正确的是（）', 0, 'A', 'for循环体语句中，可以包含多条语句，但要用大括号括起来', 'for循环只能用于循环次数已经确定的情况', '在for循环中，不能使用break语句跳出循环', 'for循环是先执行循环体语句，后进行条件判断', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (33, 1, '00000000', '对象的特征在类中表示为变量，称为类的（）', 0, 'A', '属性', '对象', '方法', '数据类型', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (34, 1, '00000000', '在java中下列关于自动类型转换说法正确的是（）', 0, 'A', '基本数据类型和String相加结果一定是字符串型', 'char类型和int类型相加结果一定是字符', 'double类型可以自动转换为int', 'char + int + double +\"\" 结果一定是double；', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (35, 1, '00000000', '以下（）代码，能够对数组正确初始化（或者是默认初始化）', 0, 'D', 'int[] a', 'a = {1, 2, 3, 4, 5}', 'int[] a = new int[5]{1, 2, 3, 4, 5}', 'int[] a = new int[5];', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (36, 1, '00000000', '在Java中,关于构造方法，下列说法错误的是( )', 0, 'C', '构造方法的名称必须与类名相同', '构造方法可以带参数', '构造方法不可以重载', '构造方法绝对不能有返回值', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (37, 1, '00000000', '下面（）不是String类提供的合法的方法。', 0, 'C', 'equals(String)', 'trim()', 'append()', 'indexOf()', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (38, 1, '00000000', '在JAVA中，以下（ ）类的对象以键-值的方式存储对象', 0, 'C', 'java.util.List', ' java.util.ArrayList', 'java.util.HashMap', 'java.util.LinkedList', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (39, 1, '00000000', '在Java语言中，下列关于类的继承的描述，正确的是（）', 0, 'B', '一个类可以继承多个父类', '一个类可以具有多个子类', '子类可以使用父类的所有方法', '子类一定比父类有更多的成员方法', NULL, NULL, 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (40, 1, '00000000', '下列选项中关于Java中super关键字的说法正确的是（）', 0, 'A', 'super关键字是在子类对象内部指代其父类对象的引用', 'super关键字不仅可以指代子类的直接父类，还可以指代父类的父类', '子类通过super关键字只能调用父类的方法，而不能调用父类的属性', '子类通过super关键字只能调用父类的属性，而不能调用父类的方法', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (41, 1, '00000000', '在JAVA的异常处理模型中，能单独和finally语句一起使用的块是（）', 0, 'A', 'try', 'catch', 'throws', 'throw', '', '', 5, 0, '2025-05-20 22:26:01', NULL);
INSERT INTO `tb_exercise` VALUES (42, 1, '00000000', '下列选项中关于Java中封装的说法错误的是（）。', 0, 'D', '封装就是将属性私有化，提供共有的方法访问私有属性', '属性的访问方法包括setter方法和getter方法', 'setter方法用于赋值，getter方法用于取值', '包含属性的类都必须封装属性，否则无法通过编译', '', '', 5, 0, '2020-06-02 11:46:58', NULL);

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
-- Records of tb_exercise_category
-- ----------------------------
INSERT INTO `tb_exercise_category` VALUES (1, 'Java知识点', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (2, '语文试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (3, '数学试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (4, '英语试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (5, '物理试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (6, '化学试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (7, '生物试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (8, '政治试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (9, '历史试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (10, '地理试题', 0, NULL, NULL);
INSERT INTO `tb_exercise_category` VALUES (11, '心理学', 0, '2025-05-21 20:41:37', NULL);
INSERT INTO `tb_exercise_category` VALUES (12, '数据结构', 0, '2025-05-21 20:41:37', NULL);
INSERT INTO `tb_exercise_category` VALUES (13, '操作系统', 0, '2025-05-21 20:41:37', NULL);
INSERT INTO `tb_exercise_category` VALUES (14, '计算机组成原理', 0, '2025-05-21 20:41:37', NULL);
INSERT INTO `tb_exercise_category` VALUES (15, '数据库', 0, '2025-05-21 20:41:37', NULL);
INSERT INTO `tb_exercise_category` VALUES (16, '性格测试', 0, '2025-05-21 20:41:37', NULL);
INSERT INTO `tb_exercise_category` VALUES (17, '测试类型', 0, '2020-06-05 21:33:27', NULL);

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
-- Records of tb_grade_info
-- ----------------------------
INSERT INTO `tb_grade_info` VALUES (1, '01', '大一');
INSERT INTO `tb_grade_info` VALUES (2, '02', '大二');
INSERT INTO `tb_grade_info` VALUES (3, '03', '大三');

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
-- Records of tb_location_info
-- ----------------------------
INSERT INTO `tb_location_info` VALUES (1, '01', '01', 0, NULL, NULL);
INSERT INTO `tb_location_info` VALUES (2, '02', '02', 0, NULL, NULL);
INSERT INTO `tb_location_info` VALUES (15, '03', '03', 1, '2025-06-01 23:31:44', NULL);
INSERT INTO `tb_location_info` VALUES (16, '03', '03', 1, '2025-06-01 23:31:44', NULL);
INSERT INTO `tb_location_info` VALUES (17, '03', '03', 0, '2025-06-01 23:31:44', NULL);

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
-- Records of tb_online_category
-- ----------------------------
INSERT INTO `tb_online_category` VALUES (1, '01', '语文', 0, NULL, '语文类别', 0, NULL, NULL);
INSERT INTO `tb_online_category` VALUES (2, '02', '数学', 0, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (3, '03', '英语', 0, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (4, '04', '物理', 0, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (5, '05', '化学', 0, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (6, '07', '生物', 0, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (9, '08', '大一语文', 1, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (10, '09', '大一数学', 2, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (11, '10', '大二语文', 1, NULL, NULL, 0, '2025-06-07 23:13:36', NULL);
INSERT INTO `tb_online_category` VALUES (12, '10', '大一英语', 3, NULL, NULL, 0, '2020-06-10 22:06:47', NULL);

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
-- Records of tb_online_course
-- ----------------------------
INSERT INTO `tb_online_course` VALUES (1, '100000', '大一语文', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/thread_6386220_20200520072309_s_1664172_w_316_h_163_16397.gif', 9, '语文', NULL, 1, 1, '梁主任', NULL, NULL, NULL, NULL);
INSERT INTO `tb_online_course` VALUES (2, '1000001', '语文1', '1', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/thread_6386220_20200520072309_s_1664172_w_316_h_163_16397.gif', 9, '大一语文', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-08 10:02:18', NULL);
INSERT INTO `tb_online_course` VALUES (3, '10000011', '大一英语语法', '带学生一起学习英语语法', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/psc.jfif', 12, '大一英语', NULL, 2, 1, '梁晓明', NULL, NULL, '2020-06-10 22:07:55', NULL);

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
-- Records of tb_online_video
-- ----------------------------
INSERT INTO `tb_online_video` VALUES (3, 2, '1-2', '1-1 课程导学.mp4', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/1-1 课程导学【瑞客论坛 www.ruike1.com】.mp4', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/thread_6386220_20200520072309_s_1664172_w_316_h_163_16397.gif', NULL, 1, '梁主任', 0, '2025-06-08 13:26:17', NULL);
INSERT INTO `tb_online_video` VALUES (4, 2, '1-3', '1-2 上课准备.mp4', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/1-2 开发准备【瑞客论坛 www.ruike1.com】.mp4', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/thread_6386220_20200520072309_s_1664172_w_316_h_163_16397.gif', NULL, 1, '梁主任', 0, '2025-06-08 13:26:17', NULL);
INSERT INTO `tb_online_video` VALUES (6, 3, '10.2', 'BLACKPINK.flv', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/BLACKPINK镜面版 -AS IF IT\'S YOUR LAST.flv', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/5555.jpg', NULL, 1, '梁晓明', 0, '2025-06-08 13:26:17', NULL);

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
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES (1, '2025011234', 'lequal', '123456', '梁同学', 3, '高三', '20250101', 18, '广西桂林市桂林电子科技大学附属中学', '13677731236', 'course@guet.com', NULL, '按时上课', 0, 0, '2025-06-06 10:24:58', '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (2, '2024021541', 'litongxue', '123456', '李同学', 3, '高二', '20250203', 22, '广西桂林市', '15177989514', 'course@guet.com', NULL, '好好学习', 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (3, '2025031235', 'gantongxue', '123456', '甘同学', 3, '高三', '20250302', 19, '湖北省武汉市', '17007891233', 'course@guet.com', NULL, '天天向上', 0, 1, '2023-06-01 20:52:17', NULL);
INSERT INTO `tb_student` VALUES (4, '2025012589', 'xitongxue', '123456', '喜同学', 3, '高一', '20250103', 21, '广东省珠海市', '13677731456', 'course@guet.com', NULL, '找工作中', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (5, '2025017895', 'huangtongxue', '123456', '黄同学', 3, '高一', '20250101', 20, '广西钦州市', '17689541452', 'course@guet.com', NULL, '技术强才是真的强', 0, 1, NULL, NULL);
INSERT INTO `tb_student` VALUES (6, '2025017836', 'caitongxue', '123456', '蔡同学', 3, '高一', '20250104', 18, '广西玉林', '18574562587', 'course@guet.com', NULL, '是时候好好学习了', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (7, '2025021936', 'suntongxue', '123456', '孙同学', 3, '高二', '20250201', 17, '湖南长沙', '18648983826', 'course@guet.com', NULL, '加油咯', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (8, '2025031245', 'hutongxue', '123456', '胡同学', 3, '高三', '20250301', 19, '湖北十堰', '17505127841', 'course@guet.com', NULL, '嘿嘿', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (9, '2025031278', 'litongxue2', '123456', '黎同学', 3, '高三', '20250302', 17, '安徽省', '13412596654', 'course@guet.com', NULL, '做喜欢做的事', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (10, '2025014596', 'shitongxue', '123456', '史同学', 3, '高一', '20250103', 18, '广西贵港', '13644527789', 'course@guet.com', NULL, '大一的同学', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (11, '2025024567', 'xiaotongxue', '123456', '萧同学', 3, '高二', '20250202', 17, '广东珠海', '13677735445', 'course@guet.com', NULL, '大二', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (12, '2025021456', 'student', '123456', '谭同学', 3, '高二', '20250204', 19, '广东汕头', '13677735559', 'course@guet.com', NULL, '大二', 0, 0, NULL, NULL);
INSERT INTO `tb_student` VALUES (13, '2025034123', 'studens', '123456', '王同学', 3, '高三', '20250302', 22, '广东深圳', '17007895623', 'course@guet.com', NULL, NULL, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (14, '2025035468', 'liangyike', '123456', '梁同学', 3, '高三', '20250301', 20, '广西桂林市', '13677731235', 'course@guet.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (15, '2025016788', 'xiewutong', '123456', '谢童鞋', 3, '高一', '20250104', 16, '湖南省衡阳市', '15177959816', 'course@guet.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (16, '2025024182', 'qintongxue', '123456', '覃同学', 3, '高二', '20250203', 17, '广西桂平市', '18565412563', 'course@guet.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (17, '2025028242', 'lian', '123456', '梁先生', 3, '高二', '20250201', 17, '广东中山', '17585968745', 'course@guet.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (19, '2025027623', 'ganxiansheng', '123456', '甘先生', 3, '高二', '20250205', 17, '广西百色', '17015789654', 'course@guet.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (20, '2025027807', '2020027623', '123456', '王总', 3, '高二', '20250205', 17, '上海市', '15678415241', 'course@guet.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (21, '2025022351', '小幸运', '123456', '陈奕迅', 3, '高二', '20250101', 18, '广东省珠海市金湾区', '15177959814', NULL, NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (22, '2025035084', '马同学', '123456', '马东良', 3, '高三', '20250301', 19, '广西贵港市', '15177959814', 'ma.dl@qq.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_student` VALUES (23, '2025011062', '黄华斌', 'aizai2015', '黄华', 3, '高一', NULL, NULL, '广西贵港市', '15678675545', NULL, NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (24, '2025021158', '梁丙光', 'aizai2015', '梁丙光', 3, '高二', NULL, NULL, '广西', '15177959814', '1576070851@qq.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (25, '2025014949', 'registerTest', '123456', '我是测试用户', 3, '高一', NULL, NULL, '桂电', '13677731234', 'test@qq.com', NULL, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_student` VALUES (26, '2025018591', '饮血剑', '123456', '印薛江', 3, '大一', '20250101', NULL, '四方坪', '15544448868', '31564948@qq.com', NULL, NULL, 0, 0, '2025-06-13 18:41:27', '2025-06-13 23:08:04');
INSERT INTO `tb_student` VALUES (27, '2025031980', '汪汪队', '123456', '汪同浩', 3, '大三', '20250102', NULL, '长沙', '156489498498', '1561561@qq.com', NULL, NULL, 0, 0, '2025-06-13 18:45:19', '2025-06-13 23:10:39');
INSERT INTO `tb_student` VALUES (28, '2025026898', '大翔子', '123456', '张翔', 3, '大二', NULL, NULL, '北京', '1561454984', 'dasda@qq.com', NULL, NULL, 0, 0, '2025-06-13 19:21:57', NULL);

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
-- Records of tb_study_logs
-- ----------------------------

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
-- Records of tb_teach_build_info
-- ----------------------------
INSERT INTO `tb_teach_build_info` VALUES (1, '01', '第1教学楼', '东校区', 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teach_build_info` VALUES (2, '02', '2号教学楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (3, '03', '3号教学楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (4, '04', '4号教学楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (5, '05', '5号教学楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (6, '06', '音乐楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (7, '07', '美术楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (8, '08', '实验楼1', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (9, '09', '实验楼2', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (10, '10', '逸夫楼1', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (11, '11', '逸夫楼2', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (12, '12', '体育楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (13, '13', '化生楼', '1校区', 0, NULL, NULL);
INSERT INTO `tb_teach_build_info` VALUES (14, '14', '14号教学楼', '2校区', 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_teach_build_info` VALUES (15, '20', '测试楼', '花江校区', 0, '2025-05-28 20:51:26', NULL);

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

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES (1, '10010', 'lequal(梁老师)', 'aizai2015', '梁晓明', 2, '教务处副主任', '01', NULL, '物理', 32, '13677731235', 'teacher@guet.com', '广西', NULL, '以身作则，教育好学生。', 1, 1, 0, 0, '2025-05-28 20:51:26', '2020-03-06 15:30:30');
INSERT INTO `tb_teacher` VALUES (3, '10012', 'msLi', 'lixuexue', '李雪雪', 2, '高级讲师', '01', NULL, '语文', 29, '13677731235', 'teacher@guet.com', '广西桂林市桂林电子科技大学', NULL, '做人民的好教师', 1, 2, 0, 0, '2025-05-28 20:51:26', '2020-03-06 23:39:39');
INSERT INTO `tb_teacher` VALUES (5, '10013', 'mswang', '123456', '王小芳', 2, '初级讲师', '01', NULL, '英语', 25, '13677731235', 'teacher@guet.com', '湖南省', NULL, '过好每一天', 1, 3, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (6, '10014', 'mssun', '123456', '孙晓明', 2, '中级讲师', '01', NULL, '数学', 28, '13677731235', 'teacher@guet.com', '湖北省', NULL, '加油', 1, 2, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (7, '10015', 'msming', '123456', '孙振东', 2, '实习生', '01', NULL, '化学', 22, '13677731235', 'teacher@guet.com', '江苏省', NULL, 'welcome', 1, 4, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (8, '10016', 'mstan', '123456', '谭老师', 2, '初级讲师', '01', NULL, '英语', 23, '13677731235', 'teacher@guet.com', '广西', NULL, 'come on', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (9, '10017', 'msliang', '123456', '梁老师', 2, '高级讲师', '01', NULL, '语文', 32, '13677731235', 'teacher@guet.com', '河北', NULL, '做更好的自己', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (10, '10018', 'mrliang', '123456', '梁忠诚', 2, '高级讲师', '01', NULL, '数学', 35, '13677731235', 'teacher@guet.com', '湖北', NULL, '数学好', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (11, '10019', 'mrwang', '123456', '汪莉莉', 2, '中级讲师', '01', NULL, '地理', 33, '13677731235', 'teacher@guet.com', '河北', NULL, '地理好', 1, 2, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (12, '10020', 'mshu', '123456', '胡冬梅', 2, '中级讲师', '01', NULL, '化学', 46, '13677731235', 'teacher@guet.com', '搜索', NULL, '是', 1, 2, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (13, '10021', 'mrlin', '123456', '林俊杰', 2, '初级讲师', '01', NULL, '生物', 41, '13677731235', 'teacher@guet.com', '试试', NULL, '就', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (14, '10022', 'mrzhou', '123456', '周杰伦', 2, '高级讲师', '01', NULL, '生物', 39, '13677731235', 'teacher@guet.com', '看看', NULL, '看', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (15, '10023', 'mrwang', '123456', '张靓颖', 2, '初级讲师', '01', NULL, '历史', 33, '13677731235', 'teacher@guet.com', '55', NULL, '555', 1, 3, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (16, '10024', 'mrhou', '123456', '侯德南', 2, '高级讲师', '01', NULL, '政治', 37, '13677731235', 'teacher@guet.com', '54546', NULL, '8878878', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (17, '10025', 'mrzhang', '123456', '张德良', 2, '高级讲师', '01', NULL, '物理', 34, '13677731235', 'teacher@guet.com', '78788', '', '878755', 1, 1, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (18, '10026', 'mrzhang', '123456', '张勇', 2, '中级讲师', '02', NULL, '数学', 45, '13677731235', 'teacher@guet.com', '湖南', NULL, '565675', 1, 2, 0, 0, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (19, '10027', '马老师', '123456', '马晓东', 2, '初级讲师', '02', NULL, '语文', 28, '13677731235', 'teacher@guet.com', '海南', NULL, '78688787', 1, 3, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (20, '10028', '马老师', '123456', '马芸', 2, '中级讲师', '02', NULL, '英语', 29, '13677731235', 'teacher@guet.com', '河北省邢台市', NULL, '5654', 1, 2, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (21, '10029', '郑老师', '123456', '郑小红', 2, '高级讲师', '02', NULL, '生物', 32, '13677731235', 'teacher@guet.com', '河南', NULL, '768567', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (22, '10030', '韦老师', '123456', '韦小龙', 2, '中级讲师', '02', NULL, '物理', 33, '13677731235', 'teacher@guet.com', '江苏', NULL, '6875675', 1, 2, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (23, '10031', '张老师', '123456', '张小龙', 2, '高级讲师', '02', NULL, '化学', 35, '13677731235', 'teacher@guet.com', '福建', NULL, '6785675', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (24, '10032', '谭老师', '123456', '谭晓江', 2, '高级讲师', '02', NULL, '历史', 33, '13677731235', 'teacher@guet.com', '贵州', NULL, '78678', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (25, '10033', '韩老师', '123456', '韩云', 2, '高级讲师', '02', NULL, '政治', 32, '13677731235', 'teacher@guet.com', '新疆', NULL, '67767', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (26, '10034', '韦老师', '123456', '韦雪琪', 2, '中级讲师', '02', NULL, '历史', 28, '13677731235', 'teacher@guet.com', '贵州省贵阳市', NULL, NULL, 1, NULL, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (27, '10046', '黄老师', '123456', '黄继光', 2, '高级讲师', '02', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg.jfif', '地理', 31, '13677731235', 'huang@guet.com', '西藏', NULL, '6756', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (28, '10035', '张老师', '123456', '张三封', 2, '高级讲师', '03', NULL, '语文', 33, '13677731235', 'teacher@guet.com', '甘肃', NULL, '7567', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (29, '10036', '胡老师', '123456', '胡小小', 2, '高级讲师', '03', NULL, '数学', 33, '13677731235', 'teacher@guet.com', '广西', NULL, '5675467', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (30, '10037', '莫老师', '123456', '莫小新', 2, '高级讲师', '03', NULL, '英语', 33, '13677731235', 'teacher@guet.com', '河北石家庄市', NULL, '7867', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (31, '10038', '甘老师', '123456', '甘楠', 2, '高级讲师', '03', NULL, '物理', 33, '13677731235', 'teacher@guet.com', '北京', NULL, '5644', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (32, '10039', '江老师', '123456', '江晓东', 2, '高级讲师', '03', NULL, '化学', 40, '13677731235', 'teacher@guet.com', '广东省中山市', NULL, '22222', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (33, '10040', '夏老师', '123456', '夏紫若', 2, '高级讲师', '03', NULL, '生物', 33, '13677731235', 'teacher@guet.com', '广东省深圳市', NULL, '6758', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (34, '10041', '张老师', '123456', '张杰', 2, '高级讲师', '03', NULL, '政治', 31, '13677731235', 'teacher@guet.com', '上海', NULL, '999999', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (35, '10042', '谭老师', '123456', '谭咏麟', 2, '高级讲师', '03', NULL, '历史', 32, '13677731235', 'teacher@guet.com', '天津', NULL, '5353', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (36, '10043', '王老师', '123456', '王杰', 2, '高级讲师', '03', NULL, '地理', 33, '13677731235', 'teacher@guet.com', '湖北省武汉市', NULL, '543453', 1, 1, 0, 0, NULL, '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (38, '10044', '吴老师', '123456', '吴天盛', 2, '高级讲师', '03', NULL, '物理', 32, '13677731235', 'teacher@guet.com', '福建省福州市', NULL, NULL, 1, NULL, 0, 0, '2025-05-28 20:51:26', NULL);
INSERT INTO `tb_teacher` VALUES (39, '10045', '江老师', '123456', '江小陆', 2, '中级讲师', '03', 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg.gif', '数学', 37, '13677731235', 'teacher@guet.com', '甘肃省兰州市', NULL, NULL, 1, NULL, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (40, '10047', '马东锡', '123456', '马东锡', 2, '高级讲师', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg.gif', '物理', 35, '13677731234', 'madx@guet.com', '广西河池市', NULL, NULL, 1, NULL, 0, 0, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (41, '10048', '黄讲师', '123456', '黄桐', 2, '初级讲师', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg (2).jfif', '数学', 32, '13677731235', 'tong@qq.com', '广西贵港市', NULL, NULL, 1, NULL, 0, 1, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (42, '10049', '王刚', '123456', '王刚', 2, '高级讲师', NULL, 'https://arrange.oss-cn-shenzhen.aliyuncs.com/timg (1).jfif', '化学', 36, '18890786676', 'gang.w@qq.com', '广西壮族自治区贺州市', NULL, NULL, 1, NULL, 0, 1, '2025-05-28 20:51:26', '2025-05-28 20:51:26');
INSERT INTO `tb_teacher` VALUES (43, '10050', '黄三毛', '123456', '黄三毛', 2, '高级讲师', NULL, NULL, '化学', 34, '15876765634', 'huang@guet.com', '广东省汕头市', NULL, NULL, 1, NULL, 0, 1, NULL, NULL);
INSERT INTO `tb_teacher` VALUES (44, '10051', '燕双赢', '123456', '燕双鹰', 2, '中级讲师', NULL, NULL, '数学', 29, '13454349878', 'yan@guet.com', '山东省青岛市', NULL, NULL, 1, NULL, 0, 0, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
