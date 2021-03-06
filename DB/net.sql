/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : net

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-02-21 00:40:11
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
  `gavatar` varchar(100) DEFAULT '/assets/img/logo.png',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `group` tinyint(1) DEFAULT '2' COMMENT '1: Admin, 2: Moderator',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_admin
-- ----------------------------
INSERT INTO `net_admin` VALUES ('1', 'admin', '940e4ac554a0f7cd4b21a6dd9b481adb', '/assets/img/logo.png', 'Admin 123', 'MCenterNTW', 'admin@mcenterntw.com', '1', '1', '2016-01-15 15:18:53', '2016-01-15 08:19:33');

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
  `approved_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_channel
-- ----------------------------
INSERT INTO `net_channel` VALUES ('3', '2', 'x1lyuqe', 'thamhiemvn2014', 'thamhiemvn2014', 'ddddd23@gmail.com', '1', '1', '1', '2015-02-05 00:00:00', '2016-01-18 12:02:21', '2016-02-05 14:23:20');

-- ----------------------------
-- Table structure for net_channel_income
-- ----------------------------
DROP TABLE IF EXISTS `net_channel_income`;
CREATE TABLE `net_channel_income` (
  `user_id` bigint(20) unsigned NOT NULL,
  `daily_channel_id` varchar(100) NOT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `original_amount` double(15,2) DEFAULT NULL,
  `commission` double(5,2) DEFAULT NULL,
  `tax_from_daily` double(5,2) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1: income, 2: withdraw',
  `date` date NOT NULL,
  `action` tinyint(1) DEFAULT '1' COMMENT '1: system, 2: people',
  `reason` text,
  `status` tinyint(1) DEFAULT '1' COMMENT '1: Approved, 2: Suspended, 3: Pending, 4: Blocked',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`daily_channel_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_channel_income
-- ----------------------------
INSERT INTO `net_channel_income` VALUES ('2', 'x1lyuqe', '62.97', '83.74', '20.00', '6.00', '1', '2015-11-01', '1', null, '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_channel_income` VALUES ('2', 'x1lyuqe', '99.16', '131.86', '20.00', '6.00', '1', '2015-12-01', '1', null, '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_channel_income` VALUES ('2', 'x1lzmct', '0.54', '0.72', '20.00', '6.00', '1', '2015-11-01', '1', null, '3', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_channel_income` VALUES ('2', 'x1lzmct', '2.72', '3.62', '20.00', '6.00', '1', '2015-12-01', '1', null, '3', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_channel_income` VALUES ('2', 'x1ma1fh', '9.81', '13.04', '20.00', '6.00', '1', '2015-12-01', '1', null, '4', '2016-02-14 16:10:16', '2016-02-14 16:10:16');

-- ----------------------------
-- Table structure for net_configuration
-- ----------------------------
DROP TABLE IF EXISTS `net_configuration`;
CREATE TABLE `net_configuration` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text,
  `show` tinyint(1) DEFAULT '0' COMMENT '0: Hide, 1: Show',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_configuration
-- ----------------------------
INSERT INTO `net_configuration` VALUES ('1', 'daily', 'api_key', 'a634a114cb1c91dcef77', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('2', 'daily', 'url_add_channel', 'https://www.dailymotion.com/oauth/authorize?response_type=code&client_id={API_KEY}&redirect_uri={URL_CALLBACK}&scope=email+userinfo+manage_videos+manage_subscriptions', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('3', 'daily', 'api_secret', '41c8909cedb7b9a87ddfde60d002bcde48c908ad', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('4', 'daily', 'url_callback', '/dailymotion/register?', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('5', 'daily', 'get_token', 'https://api.dailymotion.com/oauth/token', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('6', 'social_ntw', 'fb', 'https://www.facebook.com/mcenterntw/', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('7', 'social_ntw', 'google', 'https://plus.google.com/u/2/114898032833350678488', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('8', 'social_ntw', 'twitter', '#', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('9', 'social_ntw', 'tumblr', '#', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('10', 'social_ntw', 'pinterest', 'https://www.pinterest.com/mediacenternetw/', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('11', 'social_ntw', 'dribbble', '#', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('12', 'site', 'contact_email', 'contact@mcenterntw.com', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('13', 'site', 'description', 'The Multi Channel Network on Dailymotion for people working at home with lots of convenience', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('14', 'site', 'keywords', 'dailymotion, dailymotion monetization, make money online, mmo, dailymotion network, media center network, mcn, mcn dailymotion', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('15', 'social_ntw', 'skype', 'https://join.skype.com/t5flexE0PVAH', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('16', 'site', 'salt', '!@12#$34', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('17', 'daily', 'url_join', 'https://www.dailymotion.com/oauth/authorize?response_type=code&client_id={API_KEY}&redirect_uri={URL_CALLBACK}&scope=email+userinfo', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('18', 'fb', 'api_key', '1701752836736380', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('19', 'fb', 'api_secret', 'd9a59f4497d3e630fc5ca15b1d94d635', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('20', 'fb', 'scope', 'email,public_profile', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('21', 'fb', 'url_callback', '/facebook/register', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('22', 'site', 'active_expire', '24', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('23', 'daily', 'url_callback_channel', '/dashboard/channels/dailymotion/add?', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('24', 'daily', 'api_key_channel', 'e26d630f8cce18292850', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('25', 'daily', 'api_secret_channel', 'fa8c66cbfe58995ce839dc8b93549453bf7b07af', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('26', 'daily', 'url_get_info', 'https://api.dailymotion.com/user/{USER_ID}?fields=id,username,email,country,avatar_120_url,first_name,last_name,fullname,screenname', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('27', 'google', 'api_key', 'AIzaSyA-ULa6KfLJRjT5WM_0Usd-Yk9QdIh1zYQ', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('28', 'google', 'client_secret', 'NJHJXVNh0YfgL1GLeRnX2me_', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('29', 'google', 'scope', 'https://www.googleapis.com/auth/userinfo.email,https://www.googleapis.com/auth/userinfo.profile', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('30', 'google', 'url_callback', '/google/register', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('31', 'google', 'client_id', '130556356834-2sivce7vq4etl3o844g89dfl2265rocs.apps.googleusercontent.com', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('32', 'site', 'contract_file', '/download/contract_MCN_-_updated_10_02_2016.pdf', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('33', 'site', 'pagination', '15', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('34', 'admin', 'salt', '!@12#$34@*&%', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('35', 'site', 'payment_notice', 'Please confirm all your information before submitting to us.', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('36', 'payment', 'minpay', '10', 'Min Pay', null, '1', '1');
INSERT INTO `net_configuration` VALUES ('37', 'payment', 'tax_from_daily', '6', 'Tax From Daily', null, '1', '1');
INSERT INTO `net_configuration` VALUES ('38', 'payment', 'commission', '20', 'Commission', null, '1', '1');
INSERT INTO `net_configuration` VALUES ('39', 'payment', 'currency', '21222', 'Currency', null, '1', '1');
INSERT INTO `net_configuration` VALUES ('40', 'payment', 'tax_pay_bank', '10000', 'Tax Pay from Bank', null, '1', '1');
INSERT INTO `net_configuration` VALUES ('41', 'daily', 'url_stats', 'http://dailymotion.com/stats/{channel_name}', null, null, '0', '1');
INSERT INTO `net_configuration` VALUES ('42', 'payment', 'lock', '0', 'Lock Updating Payment', '1: Lock - 0: Unlock', '1', '1');

-- ----------------------------
-- Table structure for net_earning_date
-- ----------------------------
DROP TABLE IF EXISTS `net_earning_date`;
CREATE TABLE `net_earning_date` (
  `daily_channel_id` varchar(100) NOT NULL,
  `daily_channel_username` varchar(100) NOT NULL,
  `parent_username` varchar(100) NOT NULL,
  `earning_date` date NOT NULL,
  `estimated_earnings` double(10,3) DEFAULT NULL,
  `impressions` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`daily_channel_id`,`earning_date`,`parent_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_earning_date
-- ----------------------------
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-02', '2.060', '548', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-03', '2.580', '863', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-04', '2.210', '775', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-05', '2.050', '737', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-06', '2.720', '851', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-07', '2.530', '853', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-08', '3.240', '1013', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-09', '2.640', '963', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-10', '2.570', '861', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-11', '3.450', '1124', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-12', '2.910', '996', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-13', '3.130', '1014', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-14', '3.630', '1084', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-15', '3.240', '1042', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-16', '3.000', '997', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-17', '3.570', '1027', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-18', '3.300', '726', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-19', '2.410', '714', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-20', '2.780', '848', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-21', '2.910', '878', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-22', '2.390', '821', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-23', '2.200', '665', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-24', '2.420', '670', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-25', '3.760', '1057', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-26', '3.020', '927', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-27', '3.180', '867', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-28', '3.780', '1002', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-29', '3.210', '838', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-11-30', '2.850', '671', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-01', '3.020', '820', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-02', '3.470', '974', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-03', '2.190', '683', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-04', '2.590', '659', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-05', '3.850', '957', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-06', '3.830', '990', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-07', '3.240', '820', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-08', '3.820', '890', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-09', '3.990', '908', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-10', '2.980', '679', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-11', '3.940', '1339', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-12', '11.010', '7000', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-13', '7.170', '3289', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-14', '3.570', '798', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-15', '2.180', '660', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-16', '4.170', '784', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-17', '3.740', '825', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-18', '4.940', '990', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-19', '5.410', '1094', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-20', '4.180', '905', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-21', '4.620', '974', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-22', '5.770', '1098', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-23', '5.520', '1071', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-24', '4.680', '940', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-25', '4.050', '806', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-26', '4.410', '895', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-27', '3.140', '796', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-28', '3.270', '788', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-29', '4.670', '1071', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-30', '4.970', '1200', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-31', '3.470', '893', '2016-02-14 16:10:15', '2016-02-14 16:10:15');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-01', '0.000', '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-02', '0.020', '5', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-03', '0.010', '3', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-04', '0.010', '5', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-05', '0.010', '4', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-06', '0.000', '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-07', '0.040', '16', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-08', '0.000', '3', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-09', '0.010', '6', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-10', '0.050', '15', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-11', '0.020', '6', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-12', '0.010', '5', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-13', '0.010', '7', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-14', '0.040', '7', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-15', '0.010', '7', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-16', '0.010', '4', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-17', '0.010', '2', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-18', '0.000', '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-19', '0.030', '10', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-20', '0.070', '15', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-21', '0.020', '4', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-22', '0.030', '10', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-23', '0.010', '4', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-24', '0.020', '6', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-25', '0.030', '9', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-26', '0.130', '41', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-27', '0.050', '22', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-28', '0.040', '8', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-29', '0.010', '3', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-11-30', '0.020', '18', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-01', '0.010', '4', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-02', '0.020', '14', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-03', '0.020', '17', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-04', '0.070', '26', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-05', '0.070', '25', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-06', '0.050', '22', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-07', '0.020', '16', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-08', '0.110', '23', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-09', '0.150', '39', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-10', '0.110', '32', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-11', '0.090', '31', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-12', '0.080', '24', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-13', '0.050', '15', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-14', '0.010', '15', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-15', '0.100', '17', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-16', '0.070', '24', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-17', '0.050', '18', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-18', '0.050', '11', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-19', '0.270', '55', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-20', '0.270', '76', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-21', '0.160', '47', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-22', '0.190', '70', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-23', '0.260', '60', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-24', '0.190', '44', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-25', '0.170', '42', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-26', '0.150', '57', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-27', '0.180', '77', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-28', '0.080', '33', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-29', '0.180', '52', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-30', '0.250', '57', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1lzmct', 'cartoon365', 'mcenterntw', '2015-12-31', '0.140', '32', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-23', '0.010', '5', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-24', '0.310', '76', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-25', '1.210', '285', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-26', '1.660', '397', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-27', '1.430', '386', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-28', '1.270', '278', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-29', '2.630', '502', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-30', '3.100', '946', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_earning_date` VALUES ('x1ma1fh', 'fvine', 'mcenterntw', '2015-12-31', '1.420', '429', '2016-02-14 16:10:16', '2016-02-14 16:10:16');

-- ----------------------------
-- Table structure for net_faq
-- ----------------------------
DROP TABLE IF EXISTS `net_faq`;
CREATE TABLE `net_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(5) DEFAULT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` text,
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: active; 0: deactive',
  PRIMARY KEY (`faq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_faq
-- ----------------------------
INSERT INTO `net_faq` VALUES ('1', '1', 'What is the criterion of application?', '•	You should upload 5 – 10 videos and gain some views to let MCN networks qualify your channel based on your channel performance. Your channel should have banner, logo and a specific name. You need to drop down some words in description.', '1');
INSERT INTO `net_faq` VALUES ('2', '2', 'How long can my channel join the MCN network?', '•	The time is around 5-7 working days.', '1');
INSERT INTO `net_faq` VALUES ('3', '3', 'Why does my application get denied?', '•	The network refuses any applications when violating one of these factors including sexual, nudity and violent contents. Furthermore, the network does not allow any channels having a signal of spamming.', '1');
INSERT INTO `net_faq` VALUES ('4', '4', 'Why does my channel unlink from the network?', '•	You may intentionally violate the network rules.', '1');
INSERT INTO `net_faq` VALUES ('5', '5', 'How long does my dashboard get updated?', '•	Your earning will frequently update in the 15th of each months.', '1');
INSERT INTO `net_faq` VALUES ('6', '6', 'What is the specific day that I get my earning?', '•	The payment day is between the days of 7 to 10 each month.', '1');
INSERT INTO `net_faq` VALUES ('7', '7', 'Why doesn’t my dashboard update the payment?', '•	You need to contact to our support to resolve this problem.', '1');
INSERT INTO `net_faq` VALUES ('8', '8', 'Can I change my payment method?', '•	Currently, the network offers only bank service. We are working out with others payment entities to open more payment services.', '1');
INSERT INTO `net_faq` VALUES ('9', '9', 'Can I get my earnings when my channel has a suspension?', '•	It means you seriously violate Dailymotion as well as the network rules. Therefore, Dailymotion will hold your earnings.', '1');

-- ----------------------------
-- Table structure for net_home
-- ----------------------------
DROP TABLE IF EXISTS `net_home`;
CREATE TABLE `net_home` (
  `home_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `value` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`home_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_home
-- ----------------------------
INSERT INTO `net_home` VALUES ('1', 'stats', 'gross_amount', '0', 'Gross Amount', '', '1', '2016-02-05 22:00:17', '2016-02-05 15:30:07');
INSERT INTO `net_home` VALUES ('2', 'stats', 'net_mount', '130.39', 'Net Amount', null, '1', '2016-02-05 22:00:17', '2016-02-14 16:13:04');
INSERT INTO `net_home` VALUES ('3', 'stats', 'pay_amount', '130.39', 'Will pay', null, '1', '2016-02-05 22:00:17', '2016-02-14 16:13:04');
INSERT INTO `net_home` VALUES ('4', 'stats', 'blocked_mount', '9.81', 'Blocked Amount', null, '1', '2016-02-05 22:00:17', '2016-02-14 16:01:45');
INSERT INTO `net_home` VALUES ('5', 'stats', 'hold_amount', '0', 'Hold Amount', 'Amount < 10$', '1', '2016-02-05 22:00:17', '2016-02-05 15:47:56');
INSERT INTO `net_home` VALUES ('6', 'stats', 'paid_amount', '25', 'Total Paid Amount', null, '1', '2016-02-05 22:00:17', '2016-02-14 16:13:04');
INSERT INTO `net_home` VALUES ('7', 'stats_show', 'total_sub', '23124', 'Total follower', null, '1', '2016-02-05 22:00:17', '2016-02-20 17:32:48');
INSERT INTO `net_home` VALUES ('8', 'stats_show', 'total_like', '13123123', 'Total liker', null, '1', '2016-02-05 22:00:17', '2016-02-20 17:32:48');
INSERT INTO `net_home` VALUES ('9', 'stats_show', 'total_view', '5435', 'Total views', null, '1', '2016-02-05 22:00:17', '2016-02-20 17:32:48');
INSERT INTO `net_home` VALUES ('10', 'stats_show', 'total_channels', '4324', 'Total channels', null, '1', '2016-02-05 22:00:17', '2016-02-20 17:32:48');

-- ----------------------------
-- Table structure for net_m_banks
-- ----------------------------
DROP TABLE IF EXISTS `net_m_banks`;
CREATE TABLE `net_m_banks` (
  `bank_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_m_banks
-- ----------------------------
INSERT INTO `net_m_banks` VALUES ('1', 'ACB', 'vn', '1');
INSERT INTO `net_m_banks` VALUES ('2', 'Agribank', 'vn', '1');
INSERT INTO `net_m_banks` VALUES ('3', 'BIDV', 'vn', '1');
INSERT INTO `net_m_banks` VALUES ('4', 'DAB', 'vn', '1');
INSERT INTO `net_m_banks` VALUES ('5', 'Techcombank', 'vn', '1');
INSERT INTO `net_m_banks` VALUES ('6', 'Vietcombank', 'vn', '1');
INSERT INTO `net_m_banks` VALUES ('7', 'Vietin', 'vn', '1');

-- ----------------------------
-- Table structure for net_payment
-- ----------------------------
DROP TABLE IF EXISTS `net_payment`;
CREATE TABLE `net_payment` (
  `user_id` bigint(20) unsigned NOT NULL,
  `bank_id` int(10) unsigned DEFAULT NULL,
  `id_number_bank` varchar(30) DEFAULT NULL COMMENT 'The ID number of BANK',
  `phone` varchar(15) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `mid_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `ward` varchar(250) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `payment_method` tinyint(1) DEFAULT '1' COMMENT '1: Sharemoney (Bank), 2: Paypal, 3: Other',
  `del_flg` tinyint(1) DEFAULT '1' COMMENT '1: activated, 2: deactivated',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_payment
-- ----------------------------
INSERT INTO `net_payment` VALUES ('2', '1', '34324542434', '01229036576', 'Le1', '', 'Khang1', '43/11', '1', 'Sa Dec', 'Dong Thap', 'nhacso002@gmail.com', 'nhacso002@gmail.com', '1', '1', '2016-02-02 07:18:43', '2016-02-04 18:38:47');

-- ----------------------------
-- Table structure for net_user
-- ----------------------------
DROP TABLE IF EXISTS `net_user`;
CREATE TABLE `net_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `refer` varchar(20) DEFAULT NULL,
  `from_refer` varchar(20) DEFAULT NULL,
  `daily_channel_id` varchar(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user
-- ----------------------------
INSERT INTO `net_user` VALUES ('1', '7y6seta0201jSKTH1', '', null, 'lmkhang', 'cc4a8fcc6823b2dfa8a5b198a30df279', 'KHANG MINH LE', 'Khang', 'Le', '/assets/img/logo.png', 'nhacso00212@gmail.com', 'nhacso00212@gmail.com', null, null, '499669', '1', null, '1', null, '', '1', '1', '2016-01-24 06:07:03', '2016-01-24 06:07:10');
INSERT INTO `net_user` VALUES ('2', '7y6seta0201jSKTH1', '', null, 'lmkhang1', 'cc4a8fcc6823b2dfa8a5b198a30df279', '', 'Khang', 'Le', '/assets/img/logo.png', 'nhacso0021@gmail.com', 'nhacso0023@gmail.com', '', '', '499669', '1', '/download/contract_mcn_28_12_2015.pdf', '1', 'ec4XCed46ad1e911c3f29a6b87a6eb373b96eaf2fbcd2574944e4e7b3e8cc94702584ifPHF', '', '1', '1', '2016-01-24 06:07:03', '2016-02-02 07:17:57');
INSERT INTO `net_user` VALUES ('3', 'dmFbKuKLaK1msqlB1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'lll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'bkMOL228150d4d1d537ea17e1162d4af71352bf91200b5b482b08bf7a3980b63198c19iUrZ', '1', '0', '2016-01-30 17:28:59', '2016-01-30 17:28:59');
INSERT INTO `net_user` VALUES ('4', '9iWvmssE7n1ltwn21', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, '7h48efd4eb6a284aeefc4f42b1e5e19a77834475cfaabee09c9291ff384be9477f7df9YTXB', '1', '0', '2016-01-30 17:30:18', '2016-01-30 17:30:18');
INSERT INTO `net_user` VALUES ('5', 'kOfN9g18XN1te1ky1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'c0MQZbee07b1e0d42822f0381e88803f727887086eb6ae38c1c0439d11f7fe88b1e14e2FdQ', '1', '0', '2016-01-30 17:30:38', '2016-01-30 17:30:38');
INSERT INTO `net_user` VALUES ('6', 'bkPEHwBOEM1oqfq91', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'g4xQL68cfba99b66e99b0d5f7b0a29c62f7413bc168be9dcb8f1a1794c2b08d18dc0ei6qdO', '1', '0', '2016-01-30 17:30:48', '2016-01-30 17:30:48');
INSERT INTO `net_user` VALUES ('7', 'bkRbOijgDG1iDzpq1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'foBVP5514ae4940ce3e0143e5ef707eead39bdeefe9e6558f54ce19114808b7614236c0OE5', '1', '0', '2016-01-30 17:31:47', '2016-01-30 17:31:47');
INSERT INTO `net_user` VALUES ('8', 'cH8MRcwE2r1cKbdy1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'e33HCaddba74950acb4d75d3fc27aa7c97ebcca823060d2701e55b52248f271813ab17ht8s', '1', '0', '2016-01-30 17:46:19', '2016-01-30 17:46:19');
INSERT INTO `net_user` VALUES ('9', 'gKTYhl9hHI1ijkmY1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, '9jlWy611dc1789d7d8de799e35cdc546b5750f471b7cd6faee3f041514a46cfcd9c167htzJ', '1', '0', '2016-01-30 17:46:36', '2016-01-30 17:46:36');
INSERT INTO `net_user` VALUES ('10', 'gKUeehxXhB1dWCOP1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'jsK3E023acfc0229a88b792c8f80568b8c5e3f1497ce8d2fdac396bd1cc5d1717253d8DoKs', '1', '0', '2016-01-30 17:46:46', '2016-01-30 17:46:46');
INSERT INTO `net_user` VALUES ('11', 'dnsXbtSKtS1bxNor1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'dnsXs725a54d0553d4245cd4e22fdf623fe67d5d07914eae28022007e06e239a7049cgLgeM', '1', '0', '2016-01-30 18:00:52', '2016-01-30 18:00:52');
INSERT INTO `net_user` VALUES ('12', 'dntyxvpuPO1bxNuo1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, '7XNTM38eb0d53fc2da1ed3c6657d6213fa398140fb94d3693135a58f945d3593ad39fcHw6e', '1', '0', '2016-01-30 18:01:15', '2016-01-30 18:01:15');
INSERT INTO `net_user` VALUES ('13', 'i7kjmsfg6U1pQn8r1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'fpuu70eb9bf58f5c703b4c5408a95bc3e9da18d3306198621d109384d00b00b59398ffpuu1', '1', '0', '2016-01-30 18:06:44', '2016-01-30 18:06:44');
INSERT INTO `net_user` VALUES ('14', 'k9dvPfAdPm1b6KE31', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'aFN7v2fb0cc33c95b5dc35dc34ea53e8326b3bb386f1632f54786b5e270dfbf5799ff7XXhU', '1', '0', '2016-01-30 18:07:16', '2016-01-30 18:07:16');
INSERT INTO `net_user` VALUES ('15', 'kPgcllAs6R1mMTB91', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'jtlhSa58ed30c6dd0924c04a7f6417c6b46a08286b7e71e44a88472fd18e9c90975217Y2w7', '1', '0', '2016-01-30 18:10:37', '2016-01-30 18:10:37');
INSERT INTO `net_user` VALUES ('16', 'c1NO5jvRZx1hSm911', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'hrtsA7bfe4a80cccef7d1ec57f82ec5e89642d7f66f373dfbb5c54d3ee70bac9f7c8bc1NOa', '1', '0', '2016-01-30 18:10:58', '2016-01-30 18:10:58');
INSERT INTO `net_user` VALUES ('17', '9ZVDXfttcC1tZyE91', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'eJDQdcf709c223773fef3c290b1ea984a6b43b40ea346575a09c5aaa4b34a968916d2blQyM', '1', '0', '2016-01-30 18:11:06', '2016-01-30 18:11:06');
INSERT INTO `net_user` VALUES ('18', '7i64UqIwZJ1fH0qk1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'gLwtqae8e2d0d96c61c847660cc9fe3e29f67fbee8210d8a3cdf728633ae63497ed56fpByH', '1', '0', '2016-01-30 18:11:16', '2016-01-30 18:11:16');
INSERT INTO `net_user` VALUES ('19', 'iNpjwfmHJl1uKVTs1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'k9ke060143e91d4344068d71798e6e97bc63844536c9a2a48619eae04bbda80c78554eJEzk', '1', '0', '2016-01-30 18:11:34', '2016-01-30 18:11:34');
INSERT INTO `net_user` VALUES ('20', '8E2q3kBycd1vQBWJ1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'dnKCq34f8fd3c6e1660573fe330f546c68e1bd39f87eacc25ad43c4344d51e40fc424k9lbC', '1', '0', '2016-01-30 18:12:11', '2016-01-30 18:12:11');
INSERT INTO `net_user` VALUES ('21', 'kPjqnqIxlP1uEaAh1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, '9k0EWc2996f0f8dda8b20204567d4c1c247e76e7245b1a8920a3a91418ae6e9e95fc67Y5Ke', '1', '0', '2016-01-30 18:12:41', '2016-01-30 18:12:41');
INSERT INTO `net_user` VALUES ('22', 'fpGTvqPjrB1jp7kY1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'c1TBC9ae96acd8eec8f024074606524b3acc22da30f95fa50c79d02a1f511091a15ba7Y8RI', '1', '0', '2016-01-30 18:14:41', '2016-01-30 18:14:41');
INSERT INTO `net_user` VALUES ('23', 'do32ptFj7A1piBwO1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, '9kiio227291a4f320fee8fd96eb4f039728a16cf0d306073e7e4d1b3b1f5e22f7ea03kPB3M', '1', '0', '2016-01-30 18:23:59', '2016-01-30 18:23:59');
INSERT INTO `net_user` VALUES ('24', 'e41aLrnbQn1dbpaw1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'do3Ica584e8738fab9ccc64713ce8fa668f3484849c2de2b2ea1c81d683ba7eb6c40bfpW5c', '1', '0', '2016-01-30 18:24:25', '2016-01-30 18:24:25');
INSERT INTO `net_user` VALUES ('25', 'a16K6cjoTa1p5cTC1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'cIWzz57a44306eddae31e3e92525472f63333bd87d6bef6a25e04ac238abf5ce182c6eKOWu', '1', '0', '2016-01-30 18:57:56', '2016-01-30 18:57:56');
INSERT INTO `net_user` VALUES ('26', 'cIXhfvQNzS1pXlJ91', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'g6Kyz2f2edcd4a3990b5ab74320ccff001e183c3516ada5f5d20efede27ea2df6ebf57jhCx', '1', '0', '2016-01-30 18:58:23', '2016-01-30 18:58:23');
INSERT INTO `net_user` VALUES ('27', 'eKRuGcDI4l1dJnY11', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'bn4d51551178993c8a29d2d6a0d900b4ec0f9061a8e68e83d5290643769fa0c00df7eg6Mp9', '1', '0', '2016-01-30 18:59:34', '2016-01-30 18:59:34');
INSERT INTO `net_user` VALUES ('28', 'eL1DAnM1RJ1jiyGs1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, '7Zr4jdff7593b2baa1dcb3e93ff9632d8061f9e8a3ce89f9514092d570e2df9867a8afqZ5W', '1', '0', '2016-01-30 19:06:04', '2016-01-30 19:06:04');
INSERT INTO `net_user` VALUES ('29', 'i8PcOe3Iq21iDXbU1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, '8FoOrbdd54e43e6d34b40621d89edfd893c2b2796fed4545bf9ff5cd90317fde9e5a1eL1Vt', '1', '0', '2016-01-30 19:06:15', '2016-01-30 19:06:15');
INSERT INTO `net_user` VALUES ('30', 'a1k2suEo7x1kIxrN1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, '8Fp7W2184f4344bd02b43d70bf99f9349f650d9251a93e03ad48ea7a7569f1f09cdc3g6X9h', '1', '0', '2016-01-30 19:06:27', '2016-01-30 19:06:27');
INSERT INTO `net_user` VALUES ('31', '9lmUXmfhL91nrJfq1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, '9lmV9fcd7a86ab4191ac94cf873d2fd911168172c14e8b91fa6f3c593ff3ae622a432eL2zD', '1', '0', '2016-01-30 19:06:40', '2016-01-30 19:06:40');
INSERT INTO `net_user` VALUES ('32', 'fr1IRe3INs1dQbCl1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'kaJV181149225b21a635761c61690c3a73f4dc5b60339424653681e82fadf636fbddec3er6', '1', '0', '2016-01-30 19:07:45', '2016-01-30 19:07:45');
INSERT INTO `net_user` VALUES ('33', 'juYYtkBOcH1bERQ41', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'freeIe9b0cc6250af601d9eca6f723d26eed9cbecfffb280a0feef3e860bb5863a75biP1w7', '1', '0', '2016-01-30 19:15:46', '2016-01-30 19:15:46');
INSERT INTO `net_user` VALUES ('34', 'kQXBWnl0y31pQF781', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'iP5eVb7af3a6666323430cff47b235c9586e8bf1228051b257077cfbd05b68359f4047jMtm', '1', '0', '2016-01-30 19:18:09', '2016-01-30 19:18:09');
INSERT INTO `net_user` VALUES ('35', 'a1CFieIn0O1wvu9r1', '', null, 'lmkhang5', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'kkkk', 'llll', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '250b86', '0', null, '1', null, 'htaGX611e172e3716d8853389fc1af0bd27baf9d2d8e7b6097f062e0f1d18e480759eg7fM8', '1', '0', '2016-01-30 19:18:23', '2016-01-30 19:18:23');
INSERT INTO `net_user` VALUES ('36', 'ksyyiofYOB1ljfTf1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'sss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '499669', '0', null, '1', null, '9Ddf384b1185890fd633f8e014ebb9f7796e40b4d8b004f37007a7c4d0b81e8f356e4j6DDr', '1', '0', '2016-02-15 08:02:07', '2016-02-15 08:02:07');
INSERT INTO `net_user` VALUES ('37', 'bF9KtfK7tF1umYvN1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'aZchZb7f6a592ac1b11f1f8053d043c5b014bcac92774617cfbf0b41fe3923dd8df78h4PoY', '1', '0', '2016-02-15 08:04:46', '2016-02-15 08:04:46');
INSERT INTO `net_user` VALUES ('38', 'cl7PCoNPx41nOVdV1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'en0cs769c20bd0fdc391d0bd985aacd9a0ad1afbb5e00939f6865c931738375499f8df2XEK', '1', '0', '2016-02-15 08:05:10', '2016-02-15 08:05:10');
INSERT INTO `net_user` VALUES ('39', 'd167pjeGAn1iGQDy1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'ksE8V079245d2d7ffad850608b2f2c4911166f228a85badccfab6172fbf3ac5dd56ecksE8V', '1', '0', '2016-02-15 08:05:42', '2016-02-15 08:05:42');
INSERT INTO `net_user` VALUES ('40', 'ajgMKlKlep1ljgS91', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, '8hopNcbc9968e2d2b036184f5b9cdeab01f9c9796a8d93128f96b1c6ab8f7dae5c49djMHbi', '1', '0', '2016-02-15 08:06:01', '2016-02-15 08:06:01');
INSERT INTO `net_user` VALUES ('41', '8hoXDlXSv01qESRq1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'ksFbp4ddb468ee3ff24bdf42f21182dccb644a4a5d789e30c3d422dfac3e343c929c4jMHJh', '1', '0', '2016-02-15 08:06:22', '2016-02-15 08:06:22');
INSERT INTO `net_user` VALUES ('42', 'hKPIOkxTTg1jeGOr1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, '8hpkja2ca1baa2b717f1bc177959df88d63a206a1f352537024d6aa5858338daa28ef7BrS1', '1', '0', '2016-02-15 08:06:36', '2016-02-15 08:06:36');
INSERT INTO `net_user` VALUES ('43', 'dH5lttaxxM1g4qLA1', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, 'df5e21', '0', null, '1', null, 'en2NA880ec7793c360b2994d52e3a7bc97b19b25a29fc678dfb956702eda49b90a604iqNxy', '1', '0', '2016-02-15 08:06:50', '2016-02-15 08:06:50');
INSERT INTO `net_user` VALUES ('44', '8Xu96qEU6I1nh6P41', '', null, 'lmkhang2', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'aa', 'ssss', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '7a0885', '0', null, '1', null, 'iqUxuf276aaad9c5d9f2e6fde1a2fb6ac216be9ab7600cf500dbd6637f33c775debf4ajp3D', '1', '0', '2016-02-15 08:11:19', '2016-02-15 08:11:19');
INSERT INTO `net_user` VALUES ('45', 'dm9RXrmSPU1joQMt1', '', null, 'leeminhkhang', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'asdsd', 'ddddd', '/assets/img/logo.png', 'dangthanhphong@gmail.com', null, null, null, '330399', '0', null, '1', null, 'fo2f0f6dd7b1ce24f13839b8bf4e768ded7797d56b2247a655a47522f0ebb189a831b9YmA8', '1', '0', '2016-02-20 13:08:56', '2016-02-20 13:08:56');

-- ----------------------------
-- Table structure for net_user_income_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `net_user_income_expenditure`;
CREATE TABLE `net_user_income_expenditure` (
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` double(15,2) DEFAULT NULL COMMENT 'After minus all fee',
  `tax_from_daily` double(5,2) DEFAULT NULL COMMENT 'For IMPORT from CSV',
  `commission` double(5,2) DEFAULT NULL COMMENT 'For IMPORT from CSV',
  `currency` double(15,2) DEFAULT NULL COMMENT 'For Payment',
  `tax_pay_bank` double(15,2) DEFAULT NULL COMMENT 'For Payment',
  `payment_method` tinyint(1) DEFAULT '1' COMMENT '1: Sharemoney (Bank), 2: Paypal, 3: Other -- For Payment',
  `original_amount` double(15,2) DEFAULT NULL COMMENT 'For Import from CSV or Payment before Fee',
  `currency_string` varchar(5) DEFAULT '' COMMENT '$ or VND',
  `is_payment` tinyint(1) DEFAULT '2' COMMENT '1: Payment, 2: Not',
  `type` tinyint(1) DEFAULT '1' COMMENT '1: +, 2: -',
  `date` datetime NOT NULL,
  `action` tinyint(1) DEFAULT '1' COMMENT '1: system, 2: people',
  `reason` text,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: Valid, 2: Invalid ( Blocked )',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`date`,`created_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user_income_expenditure
-- ----------------------------
INSERT INTO `net_user_income_expenditure` VALUES ('2', '63.51', '6.00', '20.00', '0.00', '0.00', '0', '84.46', '$', '2', '1', '2015-11-01 00:00:00', '1', 'Processed by System', '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_user_income_expenditure` VALUES ('2', '101.88', '6.00', '20.00', '0.00', '0.00', '0', '135.48', '$', '2', '1', '2015-12-01 00:00:00', '1', 'Processed by System', '1', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_user_income_expenditure` VALUES ('2', '9.81', '6.00', '20.00', '0.00', '0.00', '0', '13.04', '$', '2', '1', '2015-12-01 00:00:00', '1', 'Processed by System', '2', '2016-02-14 16:10:16', '2016-02-14 16:10:16');
INSERT INTO `net_user_income_expenditure` VALUES ('2', '10.00', '0.00', '0.00', '21222.00', '10000.00', '1', '10.00', '$', '1', '2', '2016-02-14 00:00:00', '2', 'Payment for February 2016 (Dailymotion)', '1', '2016-02-14 16:10:32', '2016-02-14 16:10:32');
INSERT INTO `net_user_income_expenditure` VALUES ('2', '10.00', '0.00', '0.00', '0.00', '0.00', '0', '10.00', '$', '2', '2', '2016-02-14 00:00:00', '2', '', '1', '2016-02-14 16:10:36', '2016-02-14 16:10:36');
INSERT INTO `net_user_income_expenditure` VALUES ('2', '15.00', '0.00', '0.00', '21222.00', '10000.00', '1', '15.00', '$', '1', '2', '2016-02-14 00:00:00', '2', 'Payment for February 2016 (Dailymotion)', '1', '2016-02-14 16:11:06', '2016-02-14 16:11:06');

-- ----------------------------
-- Table structure for net_user_stats
-- ----------------------------
DROP TABLE IF EXISTS `net_user_stats`;
CREATE TABLE `net_user_stats` (
  `user_id` bigint(20) unsigned NOT NULL,
  `total` double(15,2) DEFAULT NULL,
  `loss_total` double(15,2) DEFAULT '0.00' COMMENT 'Money from Blocked Channels',
  `status` tinyint(1) DEFAULT '1' COMMENT '1: Good, 2: Bad',
  `del_flg` tinyint(1) DEFAULT '0' COMMENT '0: not confirmed,1: activated, 2: deactivated',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user_stats
-- ----------------------------
INSERT INTO `net_user_stats` VALUES ('1', '0.00', '0.00', '1', '1', '2016-01-24 06:07:03', '2016-02-02 10:36:42');
INSERT INTO `net_user_stats` VALUES ('2', '130.39', '9.81', '1', '1', '2016-01-24 06:07:03', '2016-02-14 16:11:06');
INSERT INTO `net_user_stats` VALUES ('36', '0.00', '0.00', '1', '0', '2016-02-15 08:02:07', '2016-02-15 08:02:07');
INSERT INTO `net_user_stats` VALUES ('37', '0.00', '0.00', '1', '0', '2016-02-15 08:04:46', '2016-02-15 08:04:46');
INSERT INTO `net_user_stats` VALUES ('38', '0.00', '0.00', '1', '0', '2016-02-15 08:05:10', '2016-02-15 08:05:10');
INSERT INTO `net_user_stats` VALUES ('39', '0.00', '0.00', '1', '0', '2016-02-15 08:05:42', '2016-02-15 08:05:42');
INSERT INTO `net_user_stats` VALUES ('40', '0.00', '0.00', '1', '0', '2016-02-15 08:06:01', '2016-02-15 08:06:01');
INSERT INTO `net_user_stats` VALUES ('41', '0.00', '0.00', '1', '0', '2016-02-15 08:06:22', '2016-02-15 08:06:22');
INSERT INTO `net_user_stats` VALUES ('42', '0.00', '0.00', '1', '0', '2016-02-15 08:06:36', '2016-02-15 08:06:36');
INSERT INTO `net_user_stats` VALUES ('43', '0.00', '0.00', '1', '0', '2016-02-15 08:06:50', '2016-02-15 08:06:50');
INSERT INTO `net_user_stats` VALUES ('44', '0.00', '0.00', '1', '0', '2016-02-15 08:11:19', '2016-02-15 08:11:19');
INSERT INTO `net_user_stats` VALUES ('45', '0.00', '0.00', '1', '0', '2016-02-20 13:08:56', '2016-02-20 13:08:56');
