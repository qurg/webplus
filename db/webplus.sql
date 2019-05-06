/*
Navicat MySQL Data Transfer

Source Server         : mycon
Source Server Version : 50162
Source Host           : 127.0.0.1:3306
Source Database       : webplus

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2019-02-28 15:05:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ih_school`
-- ----------------------------
DROP TABLE IF EXISTS `ih_school`;
CREATE TABLE `ih_school` (
  `school_id` varchar(50) NOT NULL,
  `street` varchar(10) DEFAULT NULL COMMENT '所属街镇',
  `school_name` varchar(100) DEFAULT NULL COMMENT '学校名称',
  `places` int(10) DEFAULT NULL COMMENT '名额',
  `school_address` varchar(200) DEFAULT NULL COMMENT '学校地址',
  `school_type` varchar(10) DEFAULT NULL COMMENT '学校类型',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校信息表';

-- ----------------------------
-- Records of ih_school
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` varchar(50) NOT NULL COMMENT '流水号',
  `cascade_id` varchar(255) NOT NULL COMMENT '节点语义ID',
  `dept_name` varchar(100) NOT NULL COMMENT '组织名称',
  `parent_id` varchar(50) NOT NULL COMMENT '父节点流水号',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '机构代码',
  `manager` varchar(50) DEFAULT NULL COMMENT '主要负责人',
  `phone` varchar(50) DEFAULT NULL COMMENT '部门电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `is_auto_expand` varchar(10) DEFAULT NULL COMMENT '是否自动展开',
  `icon_name` varchar(50) DEFAULT NULL COMMENT '节点图标文件名称',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `is_del` varchar(10) DEFAULT '0' COMMENT '是否已删除 0有效 1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('0', '0', '组织机构', '-1', '', '', '', '', '', '1', 'dept_config', '1', '', '0', '2018-09-23 09:40:39', null, '2019-02-02 21:51:39', null);
INSERT INTO `sys_dept` VALUES ('0310d7c44ea346638ebfeaa919b8616d', '0.0001', '广州研发中心', '0', '0120', '陈骑元', '13802907704', '', '', '1', null, '1', '', '0', '2018-09-23 10:01:08', null, '2019-02-02 21:31:32', null);
INSERT INTO `sys_dept` VALUES ('65dba6d5063c447ba83cb267e1f4a9d7', '0.0001.0005', '2321', '0310d7c44ea346638ebfeaa919b8616d', '23', '', '', '', '', '1', null, '1', '', '1', '2019-01-28 16:16:38', null, '2019-01-28 16:46:42', null);
INSERT INTO `sys_dept` VALUES ('661f24d8599548daad1300639226e502', '0.0001.0003', '322', '0310d7c44ea346638ebfeaa919b8616d', '234', '', '', '', '', '1', null, '1', '', '1', '2019-01-28 15:29:06', null, '2019-01-28 16:46:47', null);
INSERT INTO `sys_dept` VALUES ('96086bf7ae1c4de4835673873b682242', '0.0001.0008', '北京研发中心', '0310d7c44ea346638ebfeaa919b8616d', '', '', '', '', '', '1', null, '2', '', '0', '2018-09-23 10:01:25', null, '2019-02-02 21:31:34', null);
INSERT INTO `sys_dept` VALUES ('a2032e817bd142ac93293b66d9d62462', '0.0001.0006', '234345433', '0310d7c44ea346638ebfeaa919b8616d', '4324', '', '', '', '', '1', null, '1', '', '1', '2019-01-28 16:18:22', null, '2019-01-28 16:46:55', null);
INSERT INTO `sys_dept` VALUES ('b3e7e87fb2074d7390587f45bf87acb5', '0.0001.0002.0001', '天河区', 'bc546ac8c05b4ed8b6073b2a169a64a4', '', '', '', '', '', '1', null, '1', '', '0', '2018-09-23 10:01:43', null, '2019-02-02 21:31:34', null);
INSERT INTO `sys_dept` VALUES ('bc546ac8c05b4ed8b6073b2a169a64a4', '0.0001.0002', '天河办事处', '0310d7c44ea346638ebfeaa919b8616d', '', '陈骑元', '13802907704', '', '天河区小新塘', '1', null, '1', '', '0', '2019-01-28 15:00:36', null, '2019-02-02 21:26:35', null);
INSERT INTO `sys_dept` VALUES ('c422157564e44d8e89b9e975a1ff1308', '0.0001.0004', '2342', '0310d7c44ea346638ebfeaa919b8616d', '2342', '2', '', '', '', '1', null, '1', '', '1', '2019-01-28 15:30:51', null, '2019-01-28 16:04:26', null);
INSERT INTO `sys_dept` VALUES ('ed06c91df4d24aadbc7f5dff9eb399e8', '0.0001.0007', '海淀区', '0310d7c44ea346638ebfeaa919b8616d', '', '', '', '', '12312', '1', null, '1', '', '0', '2018-09-23 10:01:53', null, '2019-02-02 21:31:33', null);

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` varchar(50) NOT NULL COMMENT '字典编号',
  `dict_index_id` varchar(255) DEFAULT NULL COMMENT '所属字典流水号',
  `dict_code` varchar(100) DEFAULT NULL COMMENT '字典对照码',
  `dict_value` varchar(100) DEFAULT NULL COMMENT '字典对照值',
  `show_color` varchar(50) DEFAULT NULL COMMENT '显示颜色',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('08d76c1845ab425498810e716a8621e6', 'a9f98697527e452eaa4540e60ae98dc6', '0', '未发送', null, '1', '1', '1', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('11b823f3b2e14e76bf94347a4a5e578e', 'c48507ef391d4e3d8d9b7720efe4841b', '0', '停用', null, '1', '0', '1', '2017-05-03 12:44:22', null, '2017-05-03 12:44:22', null);
INSERT INTO `sys_dict` VALUES ('1c3537c22d2b4f72a59d4fcc14940c1c', 'a9f98697527e452eaa4540e60ae98dc6', '1', '已发送', null, '1', '1', '2', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('207863e69948408799c3ffd54f5ed9ec', 'ab3b313083d446e7b2707064b05e7ab9', '2', '普通用户', null, '1', '1', '1', '2019-02-11 19:54:35', null, '2019-02-11 19:54:35', null);
INSERT INTO `sys_dict` VALUES ('28c2fab82ca1433fa22d665caaf881f6', '1d7ff4e822f54d5884ba043aab0b4e17', '3', '按钮', null, '1', '1', '3', '2019-01-31 14:30:25', null, '2019-01-31 14:30:25', null);
INSERT INTO `sys_dict` VALUES ('293adbde400f457a8d947ff5c6341b04', '992a7d6dbe7f4009b30cbae97c3b64a9', '2', '锁定', '#FFA500', '1', '1', '2', '2017-05-03 12:44:22', null, '2019-01-29 10:24:15', null);
INSERT INTO `sys_dict` VALUES ('2bfc90a6917545cd87d73fb491292e2b', 'aaec0092a25b485f90c20898e9d6765d', '1', '缺省', null, '1', '1', '1', '2017-05-03 12:44:22', null, '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('3010501d2d47432ab63c8ac40a9a5c0c', 'a1a2e8d035934d978e44bbd965db743e', '0', '全区', null, '1', '0', '1', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2019-02-20 00:40:55', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('3cf6af08f48e4cec913d09f67a0b3b43', '992a7d6dbe7f4009b30cbae97c3b64a9', '1', '正常', null, '1', '1', '1', '2017-05-03 12:44:22', null, '2017-05-03 12:44:22', null);
INSERT INTO `sys_dict` VALUES ('54caa61a5d354c678bb7858023ff3e6c', '97ec40cfa09f4531ad1c8485885fe57b', '2', '验证邮件', null, '1', '1', '2', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:22', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('58e5b925760e4893a05728f69211cee5', '1d7ff4e822f54d5884ba043aab0b4e17', '1', '父菜单', null, '1', '1', '1', '2019-01-31 14:29:56', null, '2019-01-31 14:29:56', null);
INSERT INTO `sys_dict` VALUES ('5bab085587df4cfd9ed9896bc83adae0', '305966b8892244f99b56af75f91f3622', '2', '业务 ', '', '1', '1', '2', '2018-05-13 09:46:36', null, '2018-05-13 13:11:14', null);
INSERT INTO `sys_dict` VALUES ('7dbcfc7297ba40b7b89854a831ad7815', '40d05c7c99f24d768981a3c192e5c143', '0', '否', null, '1', '1', '1', '2019-01-31 14:39:44', null, '2019-01-31 14:39:44', null);
INSERT INTO `sys_dict` VALUES ('82cc31f2f1d7402a8c60b2be81c67229', '1d7ff4e822f54d5884ba043aab0b4e17', '2', '子菜单', null, '1', '1', '2', '2019-01-31 14:30:07', null, '2019-01-31 14:30:07', null);
INSERT INTO `sys_dict` VALUES ('8dfd45e6ccf94460b1b979c21d1b1806', '99fd0f3f2d1a49c1acd97ea22415e4a8', '1', '系统菜单', '', '1', '1', '1', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2019-01-31 14:31:19', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('913ca1b4b49a434fb9591f6df0a52af8', 'c6f8b99b95c844b89dc86c143e04a294', '0', '否', null, '1', '0', '1', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('93e4051729ac4586979a52bd5617740f', '97ec40cfa09f4531ad1c8485885fe57b', '4', '定时邮件', null, '1', '1', '4', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('948aef72716c48bbac2e3234a7470618', '40569802279947f8a807fbaa2852be19', '1', '系统', '', '1', '1', '1', '2018-05-13 23:00:42', null, '2018-05-13 23:00:42', null);
INSERT INTO `sys_dict` VALUES ('9c63657b98c444e3bfd8a0a75128de2b', '7a7faf68a5ec4f3cb9f45d89c119b26b', '0', '只读', null, '1', '0', '1', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('9daf8f79e6684c2281f53a05c3b21c6e', '305966b8892244f99b56af75f91f3622', '1', '系统', '', '1', '0', '1', '2018-05-12 23:46:29', null, '2019-01-29 10:25:06', null);
INSERT INTO `sys_dict` VALUES ('a96dfb72b7b54e1989569a2b3c5f90ac', 'c48507ef391d4e3d8d9b7720efe4841b', '1', '启用', null, '1', '0', '1', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('ae623964bbb8431d8f62d2adf7784b28', '97ec40cfa09f4531ad1c8485885fe57b', '3', '业务邮件', null, '1', '1', '3', '2017-05-03 12:44:19', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:19', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('afc719397e394d858c6207c480a0759f', '40569802279947f8a807fbaa2852be19', '2', '业务', '', '1', '1', '2', '2018-05-13 23:00:57', null, '2018-05-13 23:00:57', null);
INSERT INTO `sys_dict` VALUES ('b98e939f0c1a4a658bce8cbcf5c0dbaa', 'a1a2e8d035934d978e44bbd965db743e', '3', '花城街', null, '1', '1', '4', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('c15b3e8b29a0406c81a4318d7bfaba39', 'a1a2e8d035934d978e44bbd965db743e', '1', '新华街', null, '1', '0', '2', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2019-02-20 00:48:01', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('ca40ef37acef49f8930fcf22356ba50e', 'c6f8b99b95c844b89dc86c143e04a294', '1', '是', null, '1', '0', '2', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('d404e540aab945df84a26e3d30b2dd47', '820d2a68425b4d8d9b423b81d6a0eec1', '2', '女', null, '1', '1', '2', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('d6a1be71349a46d7a15d2b2d8c164a45', '99fd0f3f2d1a49c1acd97ea22415e4a8', '2', 'APP菜单', null, '1', '1', '2', '2019-01-31 17:39:02', null, '2019-01-31 17:39:02', null);
INSERT INTO `sys_dict` VALUES ('d7f0c4a5480d4dc4b3e6e4c5b405d9cb', '820d2a68425b4d8d9b423b81d6a0eec1', '1', '男', null, '1', '1', '1', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('d8642fc74f5e4824b1254705285f1264', '97ec40cfa09f4531ad1c8485885fe57b', '1', '普通邮件', null, '1', '1', '1', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:23', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('d87e5581b2674f73a5ff5d90e44bd0a5', '820d2a68425b4d8d9b423b81d6a0eec1', '3', '未知', null, '1', '1', '3', '2019-01-29 10:27:47', null, '2019-01-29 10:27:47', null);
INSERT INTO `sys_dict` VALUES ('e09ca90fa3544725921d92a8478169d7', 'ab3b313083d446e7b2707064b05e7ab9', '1', '管理用户', null, '1', '1', '1', '2019-02-11 19:54:08', null, '2019-02-11 19:54:08', null);
INSERT INTO `sys_dict` VALUES ('e52092d6659c4eca8d9641efe265a7fe', '40d05c7c99f24d768981a3c192e5c143', '1', '是', null, '1', '1', '2', '2019-01-31 14:39:53', null, '2019-01-31 14:39:58', null);
INSERT INTO `sys_dict` VALUES ('e664bd31823a4384ac3f3ce5938094cd', 'a1a2e8d035934d978e44bbd965db743e', '4', '秀全街', null, '1', '1', '5', '2017-05-03 12:44:20', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:44:20', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict` VALUES ('f1c0ae8844504f96836b904ce81ac1bc', '7a7faf68a5ec4f3cb9f45d89c119b26b', '1', '可编辑', null, '1', '0', '2', '2017-05-03 12:44:23', null, '2017-05-03 12:44:23', null);
INSERT INTO `sys_dict` VALUES ('f4309055e8dd450489a85d37b2a4003f', 'a1a2e8d035934d978e44bbd965db743e', '2', '新雅街', null, '0', '1', '3', '2017-05-03 12:44:21', 'cb33c25f5c664058a111a9b876152317', '2019-02-20 00:48:04', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for `sys_dict_index`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_index`;
CREATE TABLE `sys_dict_index` (
  `dict_index_id` varchar(50) NOT NULL COMMENT '流水号',
  `dict_key` varchar(50) DEFAULT NULL COMMENT '字典标识',
  `dict_name` varchar(100) DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(10) DEFAULT '1' COMMENT '字典分类 1系统2业务',
  `dict_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`dict_index_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典索引表';

-- ----------------------------
-- Records of sys_dict_index
-- ----------------------------
INSERT INTO `sys_dict_index` VALUES ('1d7ff4e822f54d5884ba043aab0b4e17', 'module_type', '菜单模块类型', '1', '', '2019-01-31 14:29:39', null, '2019-01-31 14:29:39', null);
INSERT INTO `sys_dict_index` VALUES ('305966b8892244f99b56af75f91f3622', 'dict_type', '字典分类', '1', '', '2018-05-12 23:16:40', null, '2018-05-13 13:10:35', null);
INSERT INTO `sys_dict_index` VALUES ('40569802279947f8a807fbaa2852be19', 'param_type', '参数分类', '1', '', '2018-05-13 23:00:28', null, '2018-05-13 23:00:28', null);
INSERT INTO `sys_dict_index` VALUES ('40d05c7c99f24d768981a3c192e5c143', 'whether_type', '是否类型', '1', '', '2019-01-31 14:39:24', null, '2019-01-31 14:39:24', null);
INSERT INTO `sys_dict_index` VALUES ('7a7faf68a5ec4f3cb9f45d89c119b26b', 'edit_mode', '编辑模式', '1', null, '2017-05-03 12:32:40', null, '2017-05-03 12:32:40', null);
INSERT INTO `sys_dict_index` VALUES ('820d2a68425b4d8d9b423b81d6a0eec1', 'sex', '性别', '1', null, '2017-05-03 12:32:40', null, null, null);
INSERT INTO `sys_dict_index` VALUES ('97ec40cfa09f4531ad1c8485885fe57b', 'email_type', '邮件类型', '1', null, '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('992a7d6dbe7f4009b30cbae97c3b64a9', 'user_status', '用户状态', '1', null, '2017-05-03 12:32:40', null, null, null);
INSERT INTO `sys_dict_index` VALUES ('99fd0f3f2d1a49c1acd97ea22415e4a8', 'menu_type', '菜单类型', '1', null, '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('a1a2e8d035934d978e44bbd965db743e', 'street_type', '街镇', '1', null, '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('a9f98697527e452eaa4540e60ae98dc6', 'is_send', '是否发送', '1', null, '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317', '2017-05-03 12:32:40', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_dict_index` VALUES ('aaec0092a25b485f90c20898e9d6765d', 'role_type', '角色类型', '1', null, '2017-05-03 12:32:40', null, null, null);
INSERT INTO `sys_dict_index` VALUES ('ab3b313083d446e7b2707064b05e7ab9', 'user_type', '用户类型', '1', '', '2019-02-11 19:52:22', null, '2019-02-11 19:52:22', null);
INSERT INTO `sys_dict_index` VALUES ('c48507ef391d4e3d8d9b7720efe4841b', 'status', '当前状态', '1', null, '2017-05-03 12:32:40', null, '2017-05-03 12:32:40', null);
INSERT INTO `sys_dict_index` VALUES ('c6f8b99b95c844b89dc86c143e04a294', 'is_auto_expand', '是否自动展开', '1', null, '2017-05-03 12:32:40', null, '2017-05-03 12:32:40', null);

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单编号',
  `cascade_id` varchar(500) DEFAULT NULL COMMENT '分类科目语义ID',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_code` varchar(100) DEFAULT NULL COMMENT '菜单编码',
  `menu_type` varchar(10) DEFAULT '1' COMMENT '菜单类型 1父级菜单2子菜单3按钮',
  `module_type` varchar(10) DEFAULT '' COMMENT '模块类型 1父菜单2子菜单3按钮',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '菜单父级编号',
  `icon_name` varchar(50) DEFAULT NULL COMMENT '图标名称',
  `is_auto_expand` varchar(10) DEFAULT '0' COMMENT '是否自动展开',
  `url` varchar(100) DEFAULT NULL COMMENT 'url地址',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `sort_no` int(10) DEFAULT NULL COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单配置';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2d30a733e2e547a183cc641aefb4c37c', '0.0001.0004.0003', '删除', 'remove', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('359cccc6baf547318aa3d4efdf16aee6', '0.0001.0006.0001', '新增', 'add', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('384e3012cf2348f3b755910716eefcee', '0.0001.0005.0003', '删除', 'remove', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4658a2e1f5ea470095da273b6385cef1', '0.0001.0004.0004', '刷新缓存', 'refreshCache', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('517efa755e0b44eb9174cdfb09c30463', '0.0001.0005.0001', '新增', 'add', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('5398d0bc967a407a8e38e89c690040f1', '0.0001.0003.0004', '授权用户', 'roleUser', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('53f9c3b246774e309bdae78ce53b0e44', '0.0001.0006.0004', '删除', 'remove', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('5505d09ebaa34841b3bd3ad3510f59ad', '0.0001.0001.0003', '移动', 'move', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '3', null, null, '2019-02-19 00:58:06', null);
INSERT INTO `sys_menu` VALUES ('5a288b3b6128445ba3f70f52a01b7954', '0.0001.0001.0004', '删除', 'remove', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '4', null, null, '2019-02-19 00:58:09', null);
INSERT INTO `sys_menu` VALUES ('60dc6ce8b85e44a481278b54b7cba4eb', '0.0001.0001.0002', '编辑', 'edit', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '2', null, null, '2019-02-19 00:58:04', null);
INSERT INTO `sys_menu` VALUES ('65af532127b14aaea8ef056fe6326f7e', '0.0001.0003.0001', '新增', 'add', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('69c73a3c4c10415dab6282eb138271ec', '0.0001.0001', '组织机构', 'dept', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-sitemap', '1', 'system/dept/init', '', '1', '1', '1', '2018-10-07 18:14:43', null, '2019-02-19 00:58:15', null);
INSERT INTO `sys_menu` VALUES ('79287cfd120a4b578f2ccd11156693ba', '0.0001.0003.0005', '刷新缓存', 'refreshCache', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '5', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7a09b4ea8f384332bb1c1dad71bb84e8', '0.0001.0003', '角色管理', 'role', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-paw', '1', 'system/role/init', '', '1', '1', '3', '2018-10-07 18:16:24', null, '2018-10-07 22:24:11', null);
INSERT INTO `sys_menu` VALUES ('7e1c85d513c24d87a8863abbf8a2ed61', '0.0001.0001.0001', '新增', 'add', '1', '3', '69c73a3c4c10415dab6282eb138271ec', '', '1', '', '', '1', '1', '1', null, null, '2019-02-19 00:58:19', null);
INSERT INTO `sys_menu` VALUES ('803e9557efe4475c8739d3c321258def', '0.0001', '系统管理', 'system', '1', '1', '0', 'fa fa-desktop', '1', '', '', '1', '0', '1', '2018-09-28 18:30:41', null, '2019-02-19 16:16:23', null);
INSERT INTO `sys_menu` VALUES ('87a39899da184b8abb976434859d4463', '0.0002', '门禁管理', 'mjsys', '1', '1', '0', 'fa fa-adjust', '1', '', '', '1', '1', '1', null, null, '2019-02-01 16:56:29', null);
INSERT INTO `sys_menu` VALUES ('8a0e884bbcf64a8dbd3b6df7305e420e', '0.0001.0004.0002', '编辑', 'edit', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('8d547ab3616f4b3ab70d709f20c8a7f1', '0.0001.0003.0006', '删除', 'remove', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '6', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('8dfd18a564ac42839d2c8ebab8b1ed12', '0.0001.0006.0002', '编辑', 'edit', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('90169e3dee13473785ae4bb8c2a39ef6', '0.0002.0001.0002', '编辑', 'edit', '1', '3', 'b37a83ac4a924d9389f5812074feb937', null, '0', null, null, '1', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('96884042cc614ebaa2b12be6577e5d85', '0.0001.0002.0005', '移动用户', 'move', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '4', null, null, '2019-02-02 21:39:06', null);
INSERT INTO `sys_menu` VALUES ('9ff4cf64d2bc418badbcaae0519bbfc5', '0.0001.0003.0003', '授权菜单', 'roleMenu', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('a1086818a33c4242baf75e94a9ec1b20', '0.0001.0002.0006', '删除', 'remove', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '5', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('a654d4e9a5354bbe82f59834d17a862f', '0.0001.0002.0003', '重置密码', 'resetPassword', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '3', null, null, '2019-02-02 21:42:12', null);
INSERT INTO `sys_menu` VALUES ('a9dc3dbb947b4d628c25bf2a06f48dd3', '0.0001.0004.0001', '新增', 'add', '1', '3', 'cacda1579dcb49eb972eed5256715b78', '', '1', '', '', '1', '1', '1', null, null, '2019-02-02 19:04:55', null);
INSERT INTO `sys_menu` VALUES ('acb483393285432494e5a5f1524822ee', '0.0001.0002', '用户管理', 'user', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-user', '1', 'system/user/init', '', '1', '1', '2', '2018-10-07 18:15:19', null, '2018-10-07 22:23:49', null);
INSERT INTO `sys_menu` VALUES ('b27f57e1361e49259f596fa773d34198', '0.0001.0005', '通用字典', 'dict', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-book', '1', 'system/dict/init', '', '1', '1', '5', '2018-10-07 18:17:41', null, '2018-10-07 22:21:28', null);
INSERT INTO `sys_menu` VALUES ('b37a83ac4a924d9389f5812074feb937', '0.0002.0001', '设备管理', 'sbgl', '1', '2', '87a39899da184b8abb976434859d4463', 'fa fa-calendar', '1', '', '', '1', '1', '1', null, null, '2019-02-01 16:56:40', null);
INSERT INTO `sys_menu` VALUES ('bd65f38321f942948300ade911335c7e', '0.0001.0003.0002', '编辑', 'edit', '1', '3', '7a09b4ea8f384332bb1c1dad71bb84e8', '', '1', '', '', '1', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('c7d8c56e03f04cc5b6b99f27d130e940', '0.0001.0005.0002', '编辑', 'edit', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('cacda1579dcb49eb972eed5256715b78', '0.0001.0004', '菜单管理', 'menu', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-navicon', '1', 'system/menu/init', '', '1', '1', '4', '2018-10-07 18:16:56', null, '2018-10-07 22:22:50', null);
INSERT INTO `sys_menu` VALUES ('cae18585cbec48018042a506beda1ef9', '0.0001.0006', '键值参数', 'param', '1', '2', '803e9557efe4475c8739d3c321258def', 'fa fa-leaf', '1', 'system/param/init', '', '1', '1', '6', '2018-10-07 18:18:25', null, '2018-10-07 22:24:58', null);
INSERT INTO `sys_menu` VALUES ('dbdc07137ac24d169df7cad28b1f1ab4', '0.0001.0002.0001', '新增', 'add', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('e90318b9d0ad49e6bcab7461bec940d5', '0.0001.0006.0003', '刷新缓存', 'refreshCache', '1', '3', 'cae18585cbec48018042a506beda1ef9', '', '1', '', '', '1', '1', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('e92b4059eaec403985ee339b85647244', '0.0002.0001.0001', '新增', 'add', '1', '3', 'b37a83ac4a924d9389f5812074feb937', null, '0', null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('eb8172ac167d490a8e40e125a664d949', '0.0001.0005.0004', '刷新缓存', 'refreshCache', '1', '3', 'b27f57e1361e49259f596fa773d34198', '', '1', '', '', '1', '1', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('ee6395600f22499a9c059eed4c2ea6fa', '0.0001.0002.0002', '编辑', 'edit', '1', '3', 'acb483393285432494e5a5f1524822ee', '', '1', '', '', '1', '1', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('f6f1a4d4df2d4eaf80c77ce0945af17c', '0.0002.0001.0003', '删除', 'delete', '1', '3', 'b37a83ac4a924d9389f5812074feb937', null, '0', null, null, '1', '1', '3', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `param_id` varchar(50) NOT NULL DEFAULT '' COMMENT '参数编号',
  `param_name` varchar(100) DEFAULT NULL COMMENT '参数名称',
  `param_key` varchar(50) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(500) DEFAULT NULL COMMENT '参数键值',
  `param_remark` varchar(200) DEFAULT NULL COMMENT '参数备注',
  `param_type` varchar(10) DEFAULT '0' COMMENT '参数类型0:缺省;1:系统2:业务',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态(0:停用;1:启用)',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='键值参数';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('4c8d5cfe75ae4ed5a87895f2237a1e2f', '订单IP地址', 'order_ip', '127.0.0.1', '订单产生IP地址', '', '1', '0', '2017-06-04 10:50:30', 'cb33c25f5c664058a111a9b876152317', '2019-02-18 00:42:46', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('6010b7ea9a7f4bc7a908c02612e0ac9f', '自动回复信息', 'response_msg', '欢迎关注黄埔区来穗人员服务管理局', '', '', '1', '0', '2017-06-16 00:49:22', 'cb33c25f5c664058a111a9b876152317', '2019-02-18 00:25:56', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('674b1071d90e42f4adc8e0ca011d78c1', '预约通知模板编号', 'subscribe_message_key', '1H0RB_Ti5Re_lGvZI0Oan49u42ym6FYrSLjRCkAj7JE', '', '1', '1', '0', '2017-06-20 01:46:27', 'cb33c25f5c664058a111a9b876152317', '2019-02-18 00:25:47', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('6a66db3230884d0bad1e46cabf2148ec', '可取消预定时间', 'cancel_time', '60', null, '', '1', '0', '2017-05-11 22:47:57', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:06:29', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('6cd477c4b2bc405c864b482d4e73dca8', '每两小时预约上限', 'every_two_limit', '1', null, '', '1', '1', '2017-05-11 22:47:57', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:10:59', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('73a3eeafd93e48a186b47ca2f233e6b5', '预约定金', 'subscribe_deposit', '0.01', null, '', '1', '0', '2017-05-11 22:47:57', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:10:58', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('79d2aef92bb848fc9e810d7c6617cf1c', '取消按钮2', 'cancel_btn', 'on', null, '0', '1', '1', null, null, null, null);
INSERT INTO `sys_param` VALUES ('919bfc40932e45018f8aa319187ae35f', '微信支付开关', 'wechat_pay', 'off', '微信支付开关 on 打开在填写opendid,off在测试', '', '1', '0', '2017-06-04 10:49:47', 'cb33c25f5c664058a111a9b876152317', '2019-02-18 00:10:00', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('9bbeacb155174ea88fe6b6f113ce0457', '短信网关', 'sms_url', 'http://gw.api.taobao.com/router/rest', null, '', '1', '0', '2017-05-11 22:44:34', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:11:06', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('aedaf6f528014f8cbc158b07e9a8bf07', '短信模板的键', 'template_key', 'name', null, '', '1', '0', '2017-05-13 00:55:12', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:06:28', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('b4c234d0873f44efa1f6d231f8a69d30', '商家端系统标题', 'shop_sys_title', '美容管理商家端平台', null, '', '1', '0', '2017-05-06 15:19:49', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:56:33', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('bc11f098150c46a694ba44aac0282a52', '验证码模板键', 'check_code_key', 'checkCode', null, '', '1', '1', '2017-05-21 00:02:46', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:15:09', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('bc663ec2277e487280d547d79f1def9c', '验证码短信模板', 'check_sms_code', 'SMS_71295405', '使用同一个签名，对同一个手机号码发送短信验证码，支持1条/分钟，5条/小时，10条/天。一个手机号码通过阿里大于平台只能收到40条/天', '', '1', '1', '2017-05-20 23:49:10', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:15:13', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('d517cdc7b49f4cc8b93f4ca07c332bc2', '美研币过期时间', 'beauty_overtime', '20', null, '', '1', '0', '2017-04-26 23:18:32', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:56:45', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('d5c2f39ab78e4b0eae83497db6eefed1', '短信AppKey', 'sms_app_key', '23812181', null, '', '1', '1', '2017-05-11 22:44:34', 'cb33c25f5c664058a111a9b876152317', '2019-02-11 20:47:13', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('e0a180760b4b46f7ae12f09edf8f4514', '系统访问地址', 'request_url', 'http://toonan.ngrok.xiaomiqiu.cn/BMS', '', '', '1', '0', '2017-05-20 00:32:28', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:06:27', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('f19c714cc52c4113aab468cb90d0158a', '人民币兑换', 'exchange_beauty', '1', '一元人民币兑换多少个美研币', '', '1', '0', '2017-04-26 23:17:49', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:58:03', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('f36a07b39af64aa4a14bd3176b18191f', '短信AppSecret', 'sms_app_secret', 'e0c94368229a2383f0723ac381e1d895', null, '', '1', '1', '2017-05-11 22:44:34', 'cb33c25f5c664058a111a9b876152317', '2019-02-17 13:57:42', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_param` VALUES ('ff0fa340423e4eee8dd04457873a402a', '短信模板编号', 'sms_template_code', 'SMS_66795136', null, '', '1', '1', '2017-05-11 22:44:35', 'cb33c25f5c664058a111a9b876152317', '2019-02-18 00:09:49', 'cb33c25f5c664058a111a9b876152317');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(50) NOT NULL COMMENT ' 流水号',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `status` varchar(10) DEFAULT '1' COMMENT '当前状态 1启用 0禁用',
  `role_type` varchar(10) DEFAULT '1' COMMENT '角色类型',
  `role_remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `edit_mode` varchar(10) DEFAULT '1' COMMENT '编辑模式(0:只读;1:可编辑)',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('83abaf5c82f443d895345c9b23e03938', '管理员角色', '1', '1', '', '0', 'cb33c25f5c664058a111a9b876152317', '2018-07-14 07:31:13', 'cb33c25f5c664058a111a9b876152317', '2019-02-19 00:17:11');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_menu_id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色与菜单关联编号',
  `role_id` varchar(50) NOT NULL COMMENT ' 角色流水号',
  `menu_id` varchar(50) NOT NULL COMMENT '功能模块流水号',
  `grant_type` varchar(10) DEFAULT NULL COMMENT '权限类型 1 经办权限 2管理权限',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单模块-角色关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('0a8dfd7822974368b97c41d331d0fea4', '83abaf5c82f443d895345c9b23e03938', '87a39899da184b8abb976434859d4463', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('0f9da003959f4cc68a4533d2aa42f705', '83abaf5c82f443d895345c9b23e03938', 'eb8172ac167d490a8e40e125a664d949', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('17aa31524c0848f0a6c6b47408bb3641', '83abaf5c82f443d895345c9b23e03938', 'cae18585cbec48018042a506beda1ef9', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('2bed5dbc20134f09a0331f61c1efa119', '83abaf5c82f443d895345c9b23e03938', 'a1086818a33c4242baf75e94a9ec1b20', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('2c3beb412a9240ec8a2ab5305244400a', '83abaf5c82f443d895345c9b23e03938', '79287cfd120a4b578f2ccd11156693ba', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('2cb8fb0889d24ad689d5e0dad9a7768c', '83abaf5c82f443d895345c9b23e03938', 'ee6395600f22499a9c059eed4c2ea6fa', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('3499230ddada432ea7cac6321318eb55', '83abaf5c82f443d895345c9b23e03938', '8d547ab3616f4b3ab70d709f20c8a7f1', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('3961f8b2f23f4f77b4e22dbc92019ad5', '83abaf5c82f443d895345c9b23e03938', '5a288b3b6128445ba3f70f52a01b7954', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('3ee88380b3ac4affaff6da79124e7707', '83abaf5c82f443d895345c9b23e03938', 'c7d8c56e03f04cc5b6b99f27d130e940', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('52f909e788db49398c3b1f4860924f16', '83abaf5c82f443d895345c9b23e03938', 'b37a83ac4a924d9389f5812074feb937', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('5687789dd1884fe792647fca5137f3ee', '83abaf5c82f443d895345c9b23e03938', '69c73a3c4c10415dab6282eb138271ec', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('5712688d3c7e4a5a8b7a792b313d2d51', '83abaf5c82f443d895345c9b23e03938', '359cccc6baf547318aa3d4efdf16aee6', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('5b32de4befdc4d60bcea72534fe18026', '83abaf5c82f443d895345c9b23e03938', '8dfd18a564ac42839d2c8ebab8b1ed12', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('605ee3f5e7564e1ba5fc9d73f9c531bc', '', '69c73a3c4c10415dab6282eb138271ec', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('60a5cfcb94284691b8ef0f11e11b6f68', '83abaf5c82f443d895345c9b23e03938', 'cacda1579dcb49eb972eed5256715b78', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('61839cf37ae8440289109eae26b8d145', '83abaf5c82f443d895345c9b23e03938', 'a9dc3dbb947b4d628c25bf2a06f48dd3', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('6cabf01d32974f79af036795abe6f038', '83abaf5c82f443d895345c9b23e03938', '7a09b4ea8f384332bb1c1dad71bb84e8', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('6ebcd4e7070748d4bd61082d9330a81b', '83abaf5c82f443d895345c9b23e03938', '4658a2e1f5ea470095da273b6385cef1', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('70379ddf1135452f81342a87dc036664', '83abaf5c82f443d895345c9b23e03938', 'dbdc07137ac24d169df7cad28b1f1ab4', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('791c633dbdf7432b8b5b7bb8d21711bc', '83abaf5c82f443d895345c9b23e03938', '384e3012cf2348f3b755910716eefcee', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('7d77b0d019324c4f8c856559421ac5fa', '83abaf5c82f443d895345c9b23e03938', '60dc6ce8b85e44a481278b54b7cba4eb', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('834b0fdb56974685b113747361f5816a', '83abaf5c82f443d895345c9b23e03938', 'bd65f38321f942948300ade911335c7e', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('85eb80465c5b4fa4b6bd84c42817b86e', '', '803e9557efe4475c8739d3c321258def', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('87b8fe3ec75b4102a2bb028f5996ede8', '83abaf5c82f443d895345c9b23e03938', 'a654d4e9a5354bbe82f59834d17a862f', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('8c3a22a841a549a392b0e3207c9c9f66', '83abaf5c82f443d895345c9b23e03938', '5505d09ebaa34841b3bd3ad3510f59ad', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('8ea9be27191a4dad9a5739b2e69830a4', '83abaf5c82f443d895345c9b23e03938', '53f9c3b246774e309bdae78ce53b0e44', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('8f98c47dae8a4446bccce4d5b8318394', '83abaf5c82f443d895345c9b23e03938', 'acb483393285432494e5a5f1524822ee', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('92ee73de08ef4629928e17ab0480ea05', '', 'acb483393285432494e5a5f1524822ee', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('9d90ebe10a1e450e80385bae51f0b8e6', '', 'cacda1579dcb49eb972eed5256715b78', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('a7c52ff560ab42afb79b73d0772d4cee', '83abaf5c82f443d895345c9b23e03938', '96884042cc614ebaa2b12be6577e5d85', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('a87002fe59ba40449d16ec902007dc0b', '', 'b27f57e1361e49259f596fa773d34198', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('b37457342d924275ac80bb9fad1343a9', '83abaf5c82f443d895345c9b23e03938', '803e9557efe4475c8739d3c321258def', null, null, '2019-02-18 01:01:34');
INSERT INTO `sys_role_menu` VALUES ('b4404b258b2947da88dd19e764065cbb', '83abaf5c82f443d895345c9b23e03938', '8a0e884bbcf64a8dbd3b6df7305e420e', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('cec7d9cd50644d058e673c8beeccbf7c', '83abaf5c82f443d895345c9b23e03938', 'b27f57e1361e49259f596fa773d34198', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('d8e05968b0d84185b4fad59bea710cf6', '', '7a09b4ea8f384332bb1c1dad71bb84e8', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('dd5ae3268391433ebdb37f6f457a5742', '83abaf5c82f443d895345c9b23e03938', '9ff4cf64d2bc418badbcaae0519bbfc5', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('e506fa2c95084f9cadfb3f9e5c426807', '', 'cae18585cbec48018042a506beda1ef9', null, null, '2019-02-01 16:41:30');
INSERT INTO `sys_role_menu` VALUES ('ef93da85658140bda95911c8955d1f2a', '83abaf5c82f443d895345c9b23e03938', '2d30a733e2e547a183cc641aefb4c37c', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('f32837a7e0534c869de27745e13ddbba', '83abaf5c82f443d895345c9b23e03938', '517efa755e0b44eb9174cdfb09c30463', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('f4d872c810bf46ba9c95d6e309bdf596', '83abaf5c82f443d895345c9b23e03938', 'e90318b9d0ad49e6bcab7461bec940d5', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('f863bb339037427a982d980402cd5073', '83abaf5c82f443d895345c9b23e03938', '65af532127b14aaea8ef056fe6326f7e', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('fdee41cf04024d79af626205e0b2d84c', '83abaf5c82f443d895345c9b23e03938', '7e1c85d513c24d87a8863abbf8a2ed61', null, null, '2019-02-18 01:01:35');
INSERT INTO `sys_role_menu` VALUES ('ffb70b3e1264412bbee89745bca2fc26', '83abaf5c82f443d895345c9b23e03938', '5398d0bc967a407a8e38e89c690040f1', null, null, '2019-02-18 01:01:35');

-- ----------------------------
-- Table structure for `sys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `role_user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '角色与用户编号',
  `role_id` varchar(50) NOT NULL COMMENT '角色编号',
  `user_id` varchar(50) NOT NULL COMMENT '用户编号',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建用户编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与用户关联';

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('5ffc49892f74495985ccd8cd0f2fc49e', '83abaf5c82f443d895345c9b23e03938', '21948e6d7cdf404fb0a5a320a86c3144', null, '2019-02-11 19:57:28');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(50) NOT NULL COMMENT '用户编号',
  `account` varchar(50) NOT NULL COMMENT '用户登录帐号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `username` varchar(50) NOT NULL COMMENT '用户姓名',
  `lock_num` int(10) DEFAULT '5' COMMENT '锁定次数 默认5次',
  `error_num` int(10) DEFAULT '0' COMMENT '密码错误次数  如果等于锁定次数就自动锁定用户',
  `sex` varchar(10) DEFAULT '3' COMMENT '性别  1:男2:女3:未知',
  `status` varchar(10) DEFAULT '1' COMMENT '用户状态 1:正常2:停用 3:锁定',
  `user_type` varchar(10) DEFAULT '1' COMMENT '用户类型',
  `dept_id` varchar(50) DEFAULT NULL COMMENT '所属部门流水号',
  `mobile` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ号码',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `idno` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `style` varchar(10) DEFAULT '1' COMMENT '界面风格',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `is_del` varchar(10) DEFAULT '0' COMMENT '是否已删除 0有效 1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改用户编号',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1addfa4c51ef4b12bf1061ce9d20523c', 'test1', 'zXE7E4Tqd5k=', 'tet1', '5', '0', '3', '1', '1', '0', '', '', '', '', '', '1', '', '', '1', '2018-09-28 14:14:50', null, '2018-09-28 14:16:43', null);
INSERT INTO `sys_user` VALUES ('21948e6d7cdf404fb0a5a320a86c3144', 'system', '54b53072540eeeb8f8e9343e71f28176', '超级管理员', '7', '0', '1', '1', '1', '96086bf7ae1c4de4835673873b682242', '13802907704', '240823329', '', '240823329@qq.com', '450981198407303917', '1', '广州市', '', '0', '2018-09-28 13:24:10', null, '2019-02-20 00:32:05', '21948e6d7cdf404fb0a5a320a86c3144');
INSERT INTO `sys_user` VALUES ('b3086957a7c747d19790032c00d32483', 'super232', 'e10adc3949ba59abbe56e057f20f883e', '223', '5', '0', '2', '1', '1', 'ed06c91df4d24aadbc7f5dff9eb399e8', '13802907702', '', '', '', '', '1', '', '', '1', '2019-02-02 21:47:34', null, '2019-02-02 21:47:49', null);
INSERT INTO `sys_user` VALUES ('cb33c25f5c664058a111a9b876152317', 'super', '17c4520f6cfd1ab53d8745e84681eb49', '超级用户', '3', '0', '1', '1', '2', '96086bf7ae1c4de4835673873b682242', '13802907704', '240823329', '', '240823329@qq.com', '', '1', '', '', '0', '2017-01-15 09:47:46', null, '2019-02-27 16:37:12', 'cb33c25f5c664058a111a9b876152317');
INSERT INTO `sys_user` VALUES ('edbf22ceaab743cebad380ab89d12551', 'test2', 'zXE7E4Tqd5k=', 'test2', '5', '0', '3', '1', '1', '0', '', '', '', '', '', '1', '', '', '1', '2018-09-28 14:15:12', null, '2018-09-28 14:16:43', null);
