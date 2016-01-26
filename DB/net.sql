/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : net

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-01-26 15:54:31
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
INSERT INTO `net_channel` VALUES ('1', '2', 'x1p336p', 'WTWS', 'WTWS', 'ddddd@gmail.com', '1', '1', '1', '2016-01-19 00:00:00', '2016-01-16 21:53:36', '2016-01-19 18:13:04');
INSERT INTO `net_channel` VALUES ('2', '2', 'x1m0ytg', 'surememberher', 'surememberher', 'ddddd2@gmail.com', '1', '1', '1', '2016-01-18 12:02:21', '2016-01-16 21:53:36', '2016-01-18 12:02:21');
INSERT INTO `net_channel` VALUES ('3', '2', 'x1lyuqe', 'thamhiemvn2014', 'thamhiemvn2014', 'ddddd23@gmail.com', '1', '1', '1', '2016-01-18 12:02:21', '2016-01-18 12:02:21', '2016-01-18 12:02:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `net_configuration` VALUES ('34', 'admin', 'salt', '!@12#$34@*&%', '1');
INSERT INTO `net_configuration` VALUES ('35', 'site', 'payment_notice', 'Please confirm all your information before submitting to us.', '1');

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
  PRIMARY KEY (`daily_channel_id`,`daily_channel_username`,`earning_date`,`parent_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_earning_date
-- ----------------------------
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-01', '3.020', '820', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-02', '3.470', '974', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-03', '2.190', '683', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-04', '2.590', '659', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-05', '3.850', '957', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-06', '3.830', '990', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-07', '3.240', '820', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-08', '3.820', '890', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-09', '3.990', '908', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-10', '2.980', '679', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-11', '3.940', '1339', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-12', '11.010', '7000', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-13', '7.170', '3289', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-14', '3.570', '798', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-15', '2.180', '660', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-16', '4.170', '784', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-17', '3.740', '825', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-18', '4.940', '990', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-19', '5.410', '1094', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-20', '4.180', '905', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-21', '4.620', '974', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-22', '5.770', '1098', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-23', '5.520', '1071', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-24', '4.680', '940', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-25', '4.050', '806', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-26', '4.410', '895', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-27', '3.140', '796', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-28', '3.270', '788', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-29', '4.670', '1071', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-30', '4.970', '1200', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1lyuqe', 'thamhiemvn2014', 'mcenterntw', '2015-12-31', '3.470', '893', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-18', '0.020', '4', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-20', '0.010', '2', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-21', '0.000', '2', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-22', '0.000', '2', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-23', '0.000', '1', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-25', '0.010', '3', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-26', '0.010', '5', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-27', '0.000', '2', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-28', '0.010', '2', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-29', '0.010', '1', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1m0ytg', 'surememberher', 'mcenterntw', '2015-12-31', '0.010', '2', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-22', '0.670', '117', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-23', '0.440', '54', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-24', '1.020', '163', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-25', '0.630', '78', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-26', '0.090', '18', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-27', '1.010', '169', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-28', '0.240', '38', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-29', '0.790', '141', '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_earning_date` VALUES ('x1p336p', 'WTWS', 'mcenterntw', '2015-01-30', '0.420', '74', '2016-01-26 06:46:25', '2016-01-26 06:46:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user
-- ----------------------------
INSERT INTO `net_user` VALUES ('1', '7y6seta0201jSKTH1', '', 'lmkhang', 'cc4a8fcc6823b2dfa8a5b198a30df279', null, 'Khang', 'Le', '/assets/img/logo.png', 'nhacso002@gmail.com', null, null, null, '499669', '1', null, '1', null, '', '1', '1', '2016-01-24 06:07:03', '2016-01-24 06:07:10');
INSERT INTO `net_user` VALUES ('2', '7y6seta0201jSKTH1', '', 'lmkhang1', 'cc4a8fcc6823b2dfa8a5b198a30df279', '', 'Khang', 'Le', '/assets/img/logo.png', 'nhacso0021@gmail.com', '', '', '', '499669', '1', '', '1', '', '', '1', '1', '2016-01-24 06:07:03', '2016-01-24 06:07:10');

-- ----------------------------
-- Table structure for net_user_income_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `net_user_income_expenditure`;
CREATE TABLE `net_user_income_expenditure` (
  `user_id` bigint(20) unsigned NOT NULL,
  `daily_channel_id` varchar(100) NOT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1: income, 2: withdraw',
  `date` date NOT NULL,
  `action` tinyint(1) DEFAULT '1' COMMENT '1: system, 2: people',
  `reason` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`daily_channel_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user_income_expenditure
-- ----------------------------
INSERT INTO `net_user_income_expenditure` VALUES ('2', 'x1lyuqe', '131.86', '1', '2015-12-13', '2', 'Adwards from Event', '2016-01-26 06:46:46', '2016-01-26 06:46:46');
INSERT INTO `net_user_income_expenditure` VALUES ('2', 'x1m0ytg', '0.08', '1', '2015-12-28', '1', null, '2016-01-26 06:46:25', '2016-01-26 06:46:25');
INSERT INTO `net_user_income_expenditure` VALUES ('2', 'x1p336p', '5.31', '1', '2015-01-22', '1', null, '2016-01-26 06:46:25', '2016-01-26 06:46:25');

-- ----------------------------
-- Table structure for net_user_stats
-- ----------------------------
DROP TABLE IF EXISTS `net_user_stats`;
CREATE TABLE `net_user_stats` (
  `user_id` bigint(20) unsigned NOT NULL,
  `total` double(15,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1: Good, 2: Bad',
  `del_flg` tinyint(1) DEFAULT '0' COMMENT '0: not confirmed,1: activated, 2: deactivated',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of net_user_stats
-- ----------------------------
INSERT INTO `net_user_stats` VALUES ('1', '0.00', '1', '1', '2016-01-24 06:07:03', '2016-01-24 06:07:10');
INSERT INTO `net_user_stats` VALUES ('2', '138.86', '1', '1', '2016-01-24 06:07:03', '2016-01-26 06:46:46');
