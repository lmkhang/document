/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : net

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-12-24 14:35:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for net_admin
-- ----------------------------
DROP TABLE IF EXISTS `net_admin`;
CREATE TABLE `net_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `group` tinyint(1) DEFAULT '2' COMMENT '1: Admin, 2: Moderator',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_admin
-- ----------------------------

-- ----------------------------
-- Table structure for net_bank
-- ----------------------------
DROP TABLE IF EXISTS `net_bank`;
CREATE TABLE `net_bank` (
  `bank_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `id_of_bank` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_bank
-- ----------------------------

-- ----------------------------
-- Table structure for net_channel
-- ----------------------------
DROP TABLE IF EXISTS `net_channel`;
CREATE TABLE `net_channel` (
  `user_id` bigint(20) unsigned NOT NULL,
  `channel_id` varchar(100) NOT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '2' COMMENT '1: Main(Login), 2: child',
  `status` tinyint(1) DEFAULT '1' COMMENT '1: Good, 2: Bad',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  `create_date` datetime DEFAULT NULL,
  `updat_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_channel
-- ----------------------------

-- ----------------------------
-- Table structure for net_configuration
-- ----------------------------
DROP TABLE IF EXISTS `net_configuration`;
CREATE TABLE `net_configuration` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for net_user
-- ----------------------------
DROP TABLE IF EXISTS `net_user`;
CREATE TABLE `net_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1: Good, 2: Bad',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user
-- ----------------------------
