/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : net

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-01-15 04:34:32
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
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
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
  `channel_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `daily_channel_id` varchar(100) DEFAULT NULL,
  `daily_channel_username` varchar(100) DEFAULT NULL,
  `daily_channel_name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT 'for future',
  `status` tinyint(1) DEFAULT '3' COMMENT '1: Approved, 2: Suspended, 3: Pending, 4: Blocked',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`channel_id`)
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
  `prefix` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_configuration
-- ----------------------------
INSERT INTO `net_configuration` VALUES ('1', 'daily', 'api_key', 'a634a114cb1c91dcef77', '1');
INSERT INTO `net_configuration` VALUES ('2', 'daily', 'url_add_channel', 'https://www.dailymotion.com/oauth/authorize?response_type=code&client_id={API_KEY}&redirect_uri={URL_CALLBACK}&scope=email+userinfo+manage_videos+manage_subscriptions', '1');
INSERT INTO `net_configuration` VALUES ('3', 'daily', 'api_secret', '41c8909cedb7b9a87ddfde60d002bcde48c908ad', '1');
INSERT INTO `net_configuration` VALUES ('4', 'daily', 'url_callback', '/dailymotion/register?', '1');
INSERT INTO `net_configuration` VALUES ('5', 'daily', 'get_token', 'https://api.dailymotion.com/oauth/token', '1');
INSERT INTO `net_configuration` VALUES ('6', 'social_ntw', 'fb', 'https://www.facebook.com/mcenterntw/', '1');
INSERT INTO `net_configuration` VALUES ('7', 'social_ntw', 'google', 'https://plus.google.com/u/2/114898032833350678488', '1');
INSERT INTO `net_configuration` VALUES ('8', 'social_ntw', 'twitter', '#', '1');
INSERT INTO `net_configuration` VALUES ('9', 'social_ntw', 'tumblr', '#', '1');
INSERT INTO `net_configuration` VALUES ('10', 'social_ntw', 'pinterest', 'https://www.pinterest.com/mediacenternetw/', '1');
INSERT INTO `net_configuration` VALUES ('11', 'social_ntw', 'dribbble', '#', '1');
INSERT INTO `net_configuration` VALUES ('12', 'site', 'contact_email', 'contact@mcenterntw.com', '1');
INSERT INTO `net_configuration` VALUES ('13', 'site', 'description', 'The Multi Channel Network on Dailymotion for people working at home with lots of convenience', '1');
INSERT INTO `net_configuration` VALUES ('14', 'site', 'keywords', 'dailymotion, dailymotion monetization, make money online, mmo, dailymotion network, media center network, mcn, mcn dailymotion', '1');
INSERT INTO `net_configuration` VALUES ('15', 'social_ntw', 'skype', 'https://join.skype.com/t5flexE0PVAH', '1');
INSERT INTO `net_configuration` VALUES ('16', 'site', 'salt', '!@12#$34', '1');
INSERT INTO `net_configuration` VALUES ('17', 'daily', 'url_join', 'https://www.dailymotion.com/oauth/authorize?response_type=code&client_id={API_KEY}&redirect_uri={URL_CALLBACK}&scope=email+userinfo', '1');
INSERT INTO `net_configuration` VALUES ('18', 'fb', 'api_key', '1701752836736380', '1');
INSERT INTO `net_configuration` VALUES ('19', 'fb', 'api_secret', 'd9a59f4497d3e630fc5ca15b1d94d635', '1');
INSERT INTO `net_configuration` VALUES ('20', 'fb', 'scope', 'email,public_profile', '1');
INSERT INTO `net_configuration` VALUES ('21', 'fb', 'url_callback', '/facebook/register', '1');
INSERT INTO `net_configuration` VALUES ('22', 'site', 'active_expire', '24', '1');
INSERT INTO `net_configuration` VALUES ('23', 'daily', 'url_callback_channel', '/dashboard/channels/dailymotion/add?', '1');
INSERT INTO `net_configuration` VALUES ('24', 'daily', 'api_key_channel', 'e26d630f8cce18292850', '1');
INSERT INTO `net_configuration` VALUES ('25', 'daily', 'api_secret_channel', 'fa8c66cbfe58995ce839dc8b93549453bf7b07af', '1');
INSERT INTO `net_configuration` VALUES ('26', 'daily', 'url_get_info', 'https://api.dailymotion.com/user/{USER_ID}?fields=id,username,email,country,avatar_120_url,first_name,last_name,fullname,screenname', '1');
INSERT INTO `net_configuration` VALUES ('27', 'google', 'api_key', 'AIzaSyA-ULa6KfLJRjT5WM_0Usd-Yk9QdIh1zYQ', '1');
INSERT INTO `net_configuration` VALUES ('28', 'google', 'client_secret', 'NJHJXVNh0YfgL1GLeRnX2me_', '1');
INSERT INTO `net_configuration` VALUES ('29', 'google', 'scope', 'https://www.googleapis.com/auth/userinfo.email,https://www.googleapis.com/auth/userinfo.profile', '1');
INSERT INTO `net_configuration` VALUES ('30', 'google', 'url_callback', '/google/register', '1');
INSERT INTO `net_configuration` VALUES ('31', 'google', 'client_id', '130556356834-2sivce7vq4etl3o844g89dfl2265rocs.apps.googleusercontent.com', '1');
INSERT INTO `net_configuration` VALUES ('32', 'site', 'contract_file', '/download/contract_mcn_28_12_2015.pdf', '1');
INSERT INTO `net_configuration` VALUES ('33', 'site', 'pagination', '15', '1');

-- ----------------------------
-- Table structure for net_user
-- ----------------------------
DROP TABLE IF EXISTS `net_user`;
CREATE TABLE `net_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `refer` varchar(20) DEFAULT NULL,
  `from_refer` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gavatar` varchar(200) DEFAULT '/assets/img/logo.png',
  `email` varchar(100) DEFAULT NULL,
  `payment_email` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `about` text,
  `pin_code` varchar(6) DEFAULT NULL,
  `sign_contract` tinyint(1) DEFAULT '0' COMMENT '0: unsign, 1: signed',
  `contract_file` varchar(100) DEFAULT NULL,
  `registration_system` tinyint(1) DEFAULT '1' COMMENT '1: site, 2: dailymotion, 3: facebook, 4: google',
  `confirm_payment_code` varchar(100) DEFAULT NULL,
  `active_code` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1: Good, 2: Bad',
  `del_flg` tinyint(1) DEFAULT '0' COMMENT '0: not confirmed,1: activated, 2: deactivated',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user
-- ----------------------------
