/*
 Navicat Premium Data Transfer

 Source Server         : 249
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 120.55.14.249:3306
 Source Schema         : shunba

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 07/02/2021 12:39:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bd_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `bd_serial_number`;
CREATE TABLE `bd_serial_number`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serial_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列号',
  `device_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `car_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号码',
  `is_used` tinyint(4) NULL DEFAULT 0 COMMENT '是否试用',
  `used_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '是否失效',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `serial_number`(`serial_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_app_version
-- ----------------------------
DROP TABLE IF EXISTS `sb_app_version`;
CREATE TABLE `sb_app_version`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '版本创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '版本更新时间',
  `use_date` datetime(0) NULL DEFAULT NULL COMMENT '版本使用时间, 即点击pad管理页面的一键升级功能后下发最新版本的时间',
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `ver_main` int(11) NULL DEFAULT NULL COMMENT '主版本号',
  `ver_sub` int(11) NULL DEFAULT NULL COMMENT '子版本号',
  `ver_third` int(11) NULL DEFAULT NULL COMMENT '副版本号',
  `md5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MD5',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `is_urgent` int(11) NULL DEFAULT 0 COMMENT '紧急',
  `is_uploaded` int(11) NULL DEFAULT 0 COMMENT '是否已上传',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `version`(`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_device
-- ----------------------------
DROP TABLE IF EXISTS `sb_device`;
CREATE TABLE `sb_device`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `os_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统版本号',
  `app_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用版本号',
  `space` bigint(20) NULL DEFAULT NULL COMMENT '可用空间',
  `last_logon_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_logoff_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登出时间',
  `is_online` int(11) NULL DEFAULT NULL COMMENT '是否在线',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `line_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `shift_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前班次. 该字段在使用顺吧发送的首发车指令后填充或者清除',
  `last_seq` int(11) NULL DEFAULT NULL COMMENT '生效时间',
  `serial_number_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列号ID',
  `last_get_member_time` datetime(0) NULL DEFAULT NULL COMMENT '最后获取用户信息的时间',
  `last_get_ticket_time` datetime(0) NULL DEFAULT NULL COMMENT '最后获取票据信息的时间',
  `last_post_ticket_time` datetime(0) NULL DEFAULT NULL COMMENT '最后上传票据信息的时间',
  `car_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管练的车牌号',
  `driver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shift_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `device_id`(`device_id`) USING BTREE,
  INDEX `line_id`(`line_id`) USING BTREE,
  INDEX `shift_id`(`shift_no`) USING BTREE,
  INDEX `serial_number_id`(`serial_number_id`) USING BTREE,
  CONSTRAINT `FK19rw7ucg8a7regv672a0pkywc` FOREIGN KEY (`serial_number_id`) REFERENCES `bd_serial_number` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_device_log
-- ----------------------------
DROP TABLE IF EXISTS `sb_device_log`;
CREATE TABLE `sb_device_log`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `device_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `os_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统版本',
  `app_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app版本',
  `data` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_driver_clock_record
-- ----------------------------
DROP TABLE IF EXISTS `sb_driver_clock_record`;
CREATE TABLE `sb_driver_clock_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `device_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `driver_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机ID',
  `temperature` double(10, 1) NULL DEFAULT NULL COMMENT '体温',
  `clock_time` datetime(0) NULL DEFAULT NULL COMMENT '打卡时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_driver_dispatch_record
-- ----------------------------
DROP TABLE IF EXISTS `sb_driver_dispatch_record`;
CREATE TABLE `sb_driver_dispatch_record`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shift_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次编号',
  `device_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的设备id',
  `operate` int(1) NULL DEFAULT NULL COMMENT '操作（0-发车 1-收车）',
  `dispatch_time` datetime(0) NULL DEFAULT NULL COMMENT '收到收发车信号的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_line
-- ----------------------------
DROP TABLE IF EXISTS `sb_line`;
CREATE TABLE `sb_line`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `line_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路名称',
  `seq` int(11) NULL DEFAULT NULL COMMENT '线路有效时间',
  `next_seq` int(11) NULL DEFAULT NULL COMMENT '下次线路有效时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `line_id`(`line_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_member
-- ----------------------------
DROP TABLE IF EXISTS `sb_member`;
CREATE TABLE `sb_member`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员ID',
  `member_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `member_type` int(11) NOT NULL DEFAULT 1 COMMENT '会员类型. 1: 乘客, 2: 司机',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '人脸特征值',
  `face_probability` double NULL DEFAULT NULL COMMENT '人脸置信度',
  `has_image` tinyint(11) NULL DEFAULT 0 COMMENT '是否上传人脸图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_shift
-- ----------------------------
DROP TABLE IF EXISTS `sb_shift`;
CREATE TABLE `sb_shift`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `shift_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `seq` int(11) NULL DEFAULT NULL COMMENT '时间',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次名称',
  `line_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `start_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `car_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌',
  `driver_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机ID',
  `driver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `driver_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机手机',
  `car_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schedule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shift_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_time_date` datetime(6) NULL DEFAULT NULL,
  `start_time_date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sb_ticket
-- ----------------------------
DROP TABLE IF EXISTS `sb_ticket`;
CREATE TABLE `sb_ticket`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `ticket_no` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '票据ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `seq` int(11) NULL DEFAULT NULL COMMENT '时间',
  `line_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路ID',
  `shift_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班次ID',
  `member_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '是否有效',
  `is_check` int(11) NULL DEFAULT NULL COMMENT '是否核销',
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销设备',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '核销时间',
  `check_type` int(11) NULL DEFAULT NULL COMMENT '核销方式（1二维码，2人脸）',
  `temperature` double(20, 1) NULL DEFAULT NULL COMMENT '温度',
  `sync_flag` int(11) NULL DEFAULT 0 COMMENT '同步标记',
  `sync_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步信息',
  `face_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shift_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ticket_id`(`ticket_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `jian` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `zhi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`jian`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_base_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_base_user`;
CREATE TABLE `t_s_base_user`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `activitiSync` smallint(6) NULL DEFAULT NULL,
  `browser` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `signature` blob NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `userkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `departid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `is_show_mob` int(20) NULL DEFAULT NULL,
  `last_modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改密码时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_data_log
-- ----------------------------
DROP TABLE IF EXISTS `t_s_data_log`;
CREATE TABLE `t_s_data_log`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属公司',
  `table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据ID',
  `data_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据内容',
  `version_number` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sindex`(`table_name`, `data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_s_depart`;
CREATE TABLE `t_s_depart`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `departname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_functional` tinyint(4) NOT NULL COMMENT '职能部门标记',
  `parentdepartid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `org_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `store_id` int(20) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `ignore_health_cert` tinyint(4) NULL DEFAULT NULL COMMENT '此部门是否检查健康证',
  `no_entry` tinyint(4) NULL DEFAULT NULL COMMENT '不可入职',
  `staffing` int(11) NULL DEFAULT NULL COMMENT '人员标配',
  `contact_employee_id` int(20) NULL DEFAULT NULL COMMENT '接口人',
  `head_employee_id` int(20) NULL DEFAULT NULL COMMENT '负责人',
  `cleaner_staffing` int(11) NULL DEFAULT NULL COMMENT '保洁标配',
  `partner_staffing` int(11) NULL DEFAULT NULL COMMENT '伙伴标配',
  `security_staffing` int(11) NULL DEFAULT NULL COMMENT '保安标配',
  `kingdee_org_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '金蝶组织机构编码',
  `acct_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '账套编码',
  `check_dept_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '核算部门编码',
  `zjb_yy_leader_id` int(20) NULL DEFAULT NULL COMMENT '总经办运营分管负责人',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  `AREA` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROVINCE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CITY` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_knnm3wb0bembwvm0il7tf6686`(`parentdepartid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_function
-- ----------------------------
DROP TABLE IF EXISTS `t_s_function`;
CREATE TABLE `t_s_function`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `functioniframe` smallint(6) NULL DEFAULT NULL,
  `functionlevel` smallint(6) NULL DEFAULT NULL,
  `functionname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `functionorder` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `functionurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `parentfunctionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `iconid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `desk_iconid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `functiontype` smallint(6) NULL DEFAULT NULL,
  `wikiurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_BI` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_brd7b3keorj8pmxcv8bpahnxp`(`parentfunctionid`) USING BTREE,
  INDEX `FK_q5tqo3v4ltsp1pehdxd59rccx`(`iconid`) USING BTREE,
  INDEX `FK_gbdacaoju6d5u53rp4jo4rbs9`(`desk_iconid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_log
-- ----------------------------
DROP TABLE IF EXISTS `t_s_log`;
CREATE TABLE `t_s_log`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `broswer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logcontent` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loglevel` smallint(6) NULL DEFAULT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `operatetime` datetime(0) NOT NULL,
  `operatetype` smallint(6) NULL DEFAULT NULL,
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rolecode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `rolename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人id',
  `childcodes` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `control_name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_role_function
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_function`;
CREATE TABLE `t_s_role_function`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `operation` varchar(10000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `functionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `roleid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `datarule` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `roldid_idx_of_role_function`(`roleid`) USING BTREE,
  INDEX `funcid_idx_of_role_function`(`functionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_role_org
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_org`;
CREATE TABLE `t_s_role_org`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_user`;
CREATE TABLE `t_s_role_user`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `roleid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `userid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_n2ucxeorvpjy7qhnmuem01kbx`(`roleid`) USING BTREE,
  INDEX `FK_d4qb5xld2pfb0bkjx9iwtolda`(`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_type
-- ----------------------------
DROP TABLE IF EXISTS `t_s_type`;
CREATE TABLE `t_s_type`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `typecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `typepid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `typegroupid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `order_num` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_nw2b22gy7plh7pqows186odmq`(`typepid`) USING BTREE,
  INDEX `FK_3q40mr4ebtd0cvx79matl39x1`(`typegroupid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_typegroup
-- ----------------------------
DROP TABLE IF EXISTS `t_s_typegroup`;
CREATE TABLE `t_s_typegroup`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `typegroupcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `typegroupname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE `t_s_user`  (
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `mobilePhone` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `officePhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `signatureFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人id',
  `employee_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '员工ID',
  `id_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `entry_date` datetime(0) NULL DEFAULT NULL COMMENT '入职日期',
  `leave_date` datetime(0) NULL DEFAULT NULL COMMENT '离职日期',
  `authoritystore` int(11) NULL DEFAULT NULL COMMENT '授权所有门店权限',
  `authoritysupplier` int(11) NULL DEFAULT NULL COMMENT '授权所有供应商权限',
  `authorityrepo` int(11) NULL DEFAULT NULL COMMENT '授权所有仓库权限',
  `secondary_authority` tinyint(4) NULL DEFAULT NULL,
  `authoritydept` tinyint(4) NULL DEFAULT NULL,
  `dpt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `allow_mob_pos` int(11) NULL DEFAULT NULL,
  `authority_dept` int(11) NULL DEFAULT NULL,
  `authority_repo` int(11) NULL DEFAULT NULL,
  `authority_store` int(11) NULL DEFAULT NULL,
  `authority_supplier` int(11) NULL DEFAULT NULL,
  `mob_pos_store_id` int(11) NULL DEFAULT NULL,
  `mob_pos_store_is_close` int(11) NULL DEFAULT NULL,
  `mob_pos_store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `mobile_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `office_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `signature_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_s_user_org
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_org`;
CREATE TABLE `t_s_user_org`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `org_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for sb_shift_custom
-- ----------------------------
DROP VIEW IF EXISTS `sb_shift_custom`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `sb_shift_custom` AS select str_to_date(concat(`sb_shift`.`seq`,' ',`sb_shift`.`start_time`),'%Y%m%d %H:%i') AS `start_time_date`,str_to_date(concat(`sb_shift`.`seq`,' ',`sb_shift`.`end_time`),'%Y%m%d %H:%i') AS `end_time_date`,`sb_shift`.`id` AS `id`,`sb_shift`.`shift_no` AS `shift_no`,`sb_shift`.`create_date` AS `create_date`,`sb_shift`.`update_date` AS `update_date`,`sb_shift`.`seq` AS `seq`,`sb_shift`.`name` AS `name`,`sb_shift`.`line_id` AS `line_id`,`sb_shift`.`start_time` AS `start_time`,`sb_shift`.`end_time` AS `end_time`,`sb_shift`.`car_no` AS `car_no`,`sb_shift`.`driver_id` AS `driver_id`,`sb_shift`.`driver_name` AS `driver_name`,`sb_shift`.`driver_phone` AS `driver_phone` from `sb_shift`;

SET FOREIGN_KEY_CHECKS = 1;
