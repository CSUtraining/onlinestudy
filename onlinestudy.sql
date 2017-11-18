/*
Navicat MySQL Data Transfer

Source Server         : Local-MySQL
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : onlinestudy

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-11-18 13:55:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_user`;
CREATE TABLE `t_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `header` varchar(128) NOT NULL DEFAULT '' COMMENT '头像',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号码',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '状态：待审核（0），有效（1），无效（3）',
  `birthday` date NOT NULL DEFAULT '1900-01-01',
  `education` varchar(20) NOT NULL DEFAULT '' COMMENT '学历：大专、本科、硕士、博士、博士后',
  `college_code` varchar(50) NOT NULL DEFAULT '' COMMENT '大学编码',
  `college_name` varchar(100) NOT NULL DEFAULT '' COMMENT '大学名称',
  `cert_no` varchar(50) NOT NULL DEFAULT '' COMMENT '资格证书编号',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '头衔',
  `sign` varchar(500) NOT NULL DEFAULT '' COMMENT '签名',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'qq号',
  `login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登录时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后一次登录IP',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '所在省份',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '所在城市',
  `district` varchar(16) NOT NULL DEFAULT '' COMMENT '所在地区',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `T_AUTH_USER_USERNAME_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_consts_classify
-- ----------------------------
DROP TABLE IF EXISTS `t_consts_classify`;
CREATE TABLE `t_consts_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(50) NOT NULL DEFAULT '',
  `parent_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '父级别code',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='课程类别表';

-- ----------------------------
-- Records of t_consts_classify
-- ----------------------------
INSERT INTO `t_consts_classify` VALUES ('1', '计算机', 'cs', '0', '1', '0000-00-00 00:00:00', 'system', '2017-11-09 19:32:23', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('2', '设计', 'ui', '0', '2', '0000-00-00 00:00:00', 'system', '2017-11-09 19:36:32', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('3', '经管', 'fm', '0', '3', '0000-00-00 00:00:00', 'system', '2017-11-09 19:35:03', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('4', '社科', 'ss', '0', '4', '0000-00-00 00:00:00', 'system', '2017-11-09 19:35:07', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('5', '文学', 'cn', '0', '5', '0000-00-00 00:00:00', 'system', '2017-11-09 19:35:17', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('6', 'Java', 'java', 'cs', '1', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:27', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('7', 'Python', 'python', 'cs', '3', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:29', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('8', 'C#', 'csharp', 'cs', '2', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:32', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('9', '分布式', 'ds', 'cs', '5', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:32', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('10', 'Linux', 'linux', 'cs', '3', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:34', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('11', '法学', 'faxue', 'ss', '1', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:36', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('12', '经济学', 'jingjixue', 'ss', '3', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:37', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('13', '政治学', 'zhengzhixue', 'ss', '4', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:38', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('14', '历史学', 'lishixue', 'ss', '1', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:39', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('15', '西方经济学', 'xfjjx', 'fm', '2', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:41', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('16', '会计学', 'kjx', 'fm', '1', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:43', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('17', '管理学', 'glx', 'fm', '2', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:45', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('18', '语言学', 'yyx', 'cn', '3', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:46', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('19', '文学史', 'wxs', 'cn', '4', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:48', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('20', '动画特效', 'dhtx', 'ui', '1', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:50', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('21', 'APPUI设计', 'appui', 'ui', '2', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:52', 'system', '0');
INSERT INTO `t_consts_classify` VALUES ('22', '设计工具', 'tools', 'ui', '3', '0000-00-00 00:00:00', 'system', '2017-11-13 20:57:53', 'system', '0');

-- ----------------------------
-- Table structure for t_consts_college
-- ----------------------------
DROP TABLE IF EXISTS `t_consts_college`;
CREATE TABLE `t_consts_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '编码',
  `picture` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='高校表结构';

-- ----------------------------
-- Records of t_consts_college
-- ----------------------------

-- ----------------------------
-- Table structure for t_consts_site_carousel
-- ----------------------------
DROP TABLE IF EXISTS `t_consts_site_carousel`;
CREATE TABLE `t_consts_site_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `picture` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '链接',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='首页轮播表';

-- ----------------------------
-- Records of t_consts_site_carousel
-- ----------------------------
INSERT INTO `t_consts_site_carousel` VALUES ('1', '不谈恋爱，去学习', '', 'http://zhihu.com', '1', '1', '0000-00-00 00:00:00', 'system', '2017-11-18 13:53:42', 'system', '0');
INSERT INTO `t_consts_site_carousel` VALUES ('2', '走进物理学', '', 'http://zhihu.com', '4', '1', '0000-00-00 00:00:00', 'system', '2017-11-18 13:53:44', 'system', '0');
INSERT INTO `t_consts_site_carousel` VALUES ('3', '清华大学本科生特等奖学金答辩', '', 'http://zhihu.com', '3', '1', '0000-00-00 00:00:00', 'system', '2017-11-18 13:53:46', 'system', '0');
INSERT INTO `t_consts_site_carousel` VALUES ('4', '人工智能课堂', '', 'http://zhihu.com', '2', '1', '0000-00-00 00:00:00', 'system', '2017-11-18 13:53:49', 'system', '0');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '课程名称',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '课程类型',
  `classify` varchar(50) NOT NULL DEFAULT '' COMMENT '课程分类',
  `classify_name` varchar(100) NOT NULL DEFAULT '',
  `sub_classify` varchar(50) NOT NULL DEFAULT '' COMMENT '课程二级分类',
  `sub_classify_name` varchar(100) NOT NULL DEFAULT '',
  `direction` varchar(20) NOT NULL DEFAULT '' COMMENT '课程方向',
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '归属人',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '课程级别：1-初级，2-中级，3-高级',
  `free` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否免费：0-否，1-是',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '时长',
  `onsale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '未上架（0）、上架（1）',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `brief` text COMMENT '课程描述',
  `recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '未推荐（0）、推荐（1）',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `study_count` int(11) NOT NULL DEFAULT '0' COMMENT '学习人数',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', 'Java从入门到会写', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '1', '1', '0.00', '2小时25分', '1', '', '半天教你Java从入门到会写', '0', '10', '9999', '0000-00-00 00:00:00', 'system', '2017-11-13 20:15:42', 'system', '0');
INSERT INTO `t_course` VALUES ('2', 'Java高级程序设计', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '2', '0', '299.00', '2小时25分', '1', '', '介绍Java程序设计常见的设计模式与Java高级特性', '0', '9', '8888', '0000-00-00 00:00:00', 'system', '2017-11-13 20:21:58', 'system', '0');
INSERT INTO `t_course` VALUES ('3', 'C#从入门到精通', '', 'cs', '计算机', 'csharp', 'C#', '', 'Sunny', '2', '1', '0.00', '2小时25分', '1', '', '带你C#从入门到精通', '0', '3', '1452', '0000-00-00 00:00:00', 'system', '2017-11-13 20:27:58', 'system', '0');
INSERT INTO `t_course` VALUES ('4', 'Python程序设计', '', 'cs', '计算机', 'python', 'Python', '', 'Sunny', '1', '1', '0.00', '2小时25分', '1', '', 'Python程序设计', '0', '5', '1452', '0000-00-00 00:00:00', 'system', '2017-11-13 20:55:58', 'system', '0');
INSERT INTO `t_course` VALUES ('5', 'Java Web高级开发', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '3', '0', '399.00', '2小时25分', '1', '', '介绍Java Web的常用框架的整合与开发', '0', '6', '6666', '0000-00-00 00:00:00', 'system', '2017-11-13 20:55:59', 'system', '0');
INSERT INTO `t_course` VALUES ('6', '二手交易平台开发', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '3', '0', '399.00', '2小时25分', '1', '', '带你开发校园二手交易平台', '0', '1', '6000', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:01', 'system', '0');
INSERT INTO `t_course` VALUES ('7', 'Linux常用命令介绍', '', 'cs', '计算机', 'linux', 'Linux', '', 'Sunny', '1', '1', '0.00', '2小时25分', '1', '', '教你入门Linux的常用命令', '0', '8', '1452', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:02', 'system', '0');
INSERT INTO `t_course` VALUES ('8', 'Linux高级开发与运维', '', 'cs', '计算机', 'linux', 'Linux', '', 'Sunny', '2', '0', '299.00', '2小时25分', '1', '', 'Shell脚本开发与自动化运维', '0', '5', '1300', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:03', 'system', '0');
INSERT INTO `t_course` VALUES ('9', 'Hadoop入门', '', 'cs', '计算机', 'ds', '分布式', '', 'Sunny', '1', '1', '0.00', '2小时25分', '1', '', '介绍Hadoop的安装与使用', '0', '5', '1452', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:05', 'system', '0');
INSERT INTO `t_course` VALUES ('11', '在CentOS下搭建Java Web环境', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '2', '1', '0.00', '2小时25分', '1', '', '教你在CentOS服务器上搭建Java Web生产环境', '0', '5', '5000', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:08', 'system', '0');
INSERT INTO `t_course` VALUES ('12', 'Java 9 新特性讲解', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '3', '1', '0.00', '2小时25分', '1', '', '介绍Java 8和Java 9的新特性', '0', '8', '3000', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:09', 'system', '0');
INSERT INTO `t_course` VALUES ('13', 'Java中间件介绍', '', 'cs', '计算机', 'java', 'Java', '', 'Sunny', '3', '0', '399.00', '2小时25分', '1', '', '介绍Java中间件技术', '0', '3', '2000', '0000-00-00 00:00:00', 'system', '2017-11-13 20:56:24', 'system', '0');
INSERT INTO `t_course` VALUES ('14', 'Docker容器技术解析', '', 'cs', '计算机', 'linux', 'Linux', '', 'Sunny', '3', '0', '399.00', '', '1', '', '由浅入深介绍Docker容器技术', '0', '3', '0', '0000-00-00 00:00:00', 'system', '2017-11-18 13:54:10', 'system', '0');

-- ----------------------------
-- Table structure for t_course_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_course_comment`;
CREATE TABLE `t_course_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '用户username',
  `to_username` varchar(200) NOT NULL DEFAULT '' COMMENT '评论对象username',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `section_id` int(11) NOT NULL DEFAULT '0' COMMENT '章节id',
  `section_title` varchar(200) NOT NULL DEFAULT '0' COMMENT '章节标题',
  `content` varchar(255) NOT NULL DEFAULT '0' COMMENT '评论内容',
  `ref_id` int(11) NOT NULL DEFAULT '0' COMMENT '引用id',
  `ref_content` varchar(255) NOT NULL DEFAULT '' COMMENT '引用内容',
  `type` tinyint(11) NOT NULL DEFAULT '0' COMMENT '类型：0-评论；1-答疑QA',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程评论&答疑';

-- ----------------------------
-- Records of t_course_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_course_section
-- ----------------------------
DROP TABLE IF EXISTS `t_course_section`;
CREATE TABLE `t_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '归属课程id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父章节id，（只有2级）',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '章节名称',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '时长',
  `onsale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '未上架（0）、上架（1）',
  `video_url` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='课程章节表';

-- ----------------------------
-- Records of t_course_section
-- ----------------------------
INSERT INTO `t_course_section` VALUES ('1', '1', '0', '章节001', '1', '05:38', '1', '', '0000-00-00 00:00:00', 'system', '2017-11-12 17:10:59', 'system', '0');
INSERT INTO `t_course_section` VALUES ('2', '1', '1', '1-1 走进Java的世界', '1', '02:49', '1', '', '0000-00-00 00:00:00', 'system', '2017-11-18 13:54:20', 'system', '0');
INSERT INTO `t_course_section` VALUES ('3', '1', '1', '1-2 类和对象', '1', '02:49', '1', '', '0000-00-00 00:00:00', 'system', '2017-11-18 13:54:25', 'system', '0');
INSERT INTO `t_course_section` VALUES ('4', '1', '0', '章节002', '1', '10:00', '1', '', '0000-00-00 00:00:00', 'system', '2017-11-18 13:54:27', 'system', '0');
INSERT INTO `t_course_section` VALUES ('5', '1', '4', '2-1 继承', '1', '05:00', '1', '', '0000-00-00 00:00:00', 'system', '2017-11-18 13:54:29', 'system', '0');
INSERT INTO `t_course_section` VALUES ('6', '1', '4', '2-2 多态', '1', '05:00', '1', '', '0000-00-00 00:00:00', 'system', '2017-11-18 13:54:31', 'system', '0');

-- ----------------------------
-- Table structure for t_user_collections
-- ----------------------------
DROP TABLE IF EXISTS `t_user_collections`;
CREATE TABLE `t_user_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `classify` int(11) NOT NULL DEFAULT '0' COMMENT '用户收藏分类',
  `object_id` int(11) NOT NULL DEFAULT '0' COMMENT '收藏内容id',
  `tips` varchar(100) NOT NULL DEFAULT '' COMMENT '用户收藏备注',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户收藏';

-- ----------------------------
-- Records of t_user_collections
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_course_section
-- ----------------------------
DROP TABLE IF EXISTS `t_user_course_section`;
CREATE TABLE `t_user_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `section_id` int(11) NOT NULL DEFAULT '0' COMMENT '章节id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0-学习中；1-学习结束',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户学习章节表';

-- ----------------------------
-- Records of t_user_course_section
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_follows
-- ----------------------------
DROP TABLE IF EXISTS `t_user_follows`;
CREATE TABLE `t_user_follows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `follow_id` int(11) NOT NULL DEFAULT '0' COMMENT '关注的用户id',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(32) NOT NULL DEFAULT 'system',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(32) NOT NULL DEFAULT 'system',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户关注';

-- ----------------------------
-- Records of t_user_follows
-- ----------------------------
