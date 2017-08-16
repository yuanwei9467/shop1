/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : verydows

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-16 17:21:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `verydows_admin`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_admin`;
CREATE TABLE `verydows_admin` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(16) NOT NULL,
  `password` char(32) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `last_ip` char(15) NOT NULL DEFAULT '',
  `last_date` int(10) unsigned NOT NULL DEFAULT '0',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` char(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_admin
-- ----------------------------
INSERT INTO `verydows_admin` VALUES ('1', 'admin', '66f6c3af2d69b6a619660b7e3cc474ef', '', 'yuanwei9467@126.com', '127.0.0.1', '1502846673', '1502846465', 'eadc29d5a4e88a2cf59812cb6d375c3b1e406313');

-- ----------------------------
-- Table structure for `verydows_admin_active`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_admin_active`;
CREATE TABLE `verydows_admin_active` (
  `sess_id` char(32) NOT NULL DEFAULT '',
  `user_id` smallint(5) unsigned NOT NULL,
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_admin_active
-- ----------------------------
INSERT INTO `verydows_admin_active` VALUES ('4mbqfouluhk03jnagjrdmko2a7', '1', '127.0.0.1', '1502846673', '1502865509');

-- ----------------------------
-- Table structure for `verydows_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_admin_role`;
CREATE TABLE `verydows_admin_role` (
  `user_id` smallint(5) unsigned NOT NULL,
  `role_id` smallint(5) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_adv`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_adv`;
CREATE TABLE `verydows_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `type` char(5) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `codes` text NOT NULL,
  `start_date` int(10) unsigned NOT NULL DEFAULT '0',
  `end_date` int(10) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`adv_id`),
  KEY `position_id` (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_adv
-- ----------------------------
INSERT INTO `verydows_adv` VALUES ('1', '1', '首页广告1', 'image', '{\"src\":\"http:\\/\\/127.0.0.1\\/verydows\\/upload\\/adv\\/image\\/59939f4e4357fsvgOqw98Mb67579.jpg\",\"width\":\"100\",\"height\":\"100\",\"title\":\"\",\"link\":\"http::\\/www.baidu.com\"}', '<a href=\"http::/www.baidu.com\"><img src=\"http://127.0.0.1/verydows/upload/adv/image/59939f4e4357fsvgOqw98Mb67579.jpg\" width=\"100\" height=\"100\" border=\"0\" /></a>', '1502812800', '1510848000', '99', '1');

-- ----------------------------
-- Table structure for `verydows_adv_position`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_adv_position`;
CREATE TABLE `verydows_adv_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `codes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_adv_position
-- ----------------------------
INSERT INTO `verydows_adv_position` VALUES ('1', '首页广告', '100', '100', '<img src=\"\">');

-- ----------------------------
-- Table structure for `verydows_aftersales`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_aftersales`;
CREATE TABLE `verydows_aftersales` (
  `as_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_id` char(15) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_qty` smallint(5) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cause` text NOT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`as_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_aftersales
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_aftersales_message`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_aftersales_message`;
CREATE TABLE `verydows_aftersales_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `as_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `as_id` (`as_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_aftersales_message
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_article`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_article`;
CREATE TABLE `verydows_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(180) NOT NULL,
  `picture` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `brief` varchar(240) NOT NULL DEFAULT '',
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_article
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_article_cate`;
CREATE TABLE `verydows_article_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(60) NOT NULL,
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_article_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_brand`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_brand`;
CREATE TABLE `verydows_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(255) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_email_queue`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_email_queue`;
CREATE TABLE `verydows_email_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `tpl_id` char(30) NOT NULL DEFAULT '',
  `subject` varchar(240) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `last_err` varchar(255) NOT NULL DEFAULT '',
  `err_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_email_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_email_subscription`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_email_subscription`;
CREATE TABLE `verydows_email_subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_email_subscription
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_email_template`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_email_template`;
CREATE TABLE `verydows_email_template` (
  `id` char(30) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `subject` varchar(240) NOT NULL DEFAULT '',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_email_template
-- ----------------------------
INSERT INTO `verydows_email_template` VALUES ('email_captcha', '邮箱验证码', '验证码', '1');

-- ----------------------------
-- Table structure for `verydows_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_feedback`;
CREATE TABLE `verydows_feedback` (
  `fb_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fb_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_feedback_message`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_feedback_message`;
CREATE TABLE `verydows_feedback_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fb_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fb_id` (`fb_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_feedback_message
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_friendlink`;
CREATE TABLE `verydows_friendlink` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods`;
CREATE TABLE `verydows_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(180) NOT NULL DEFAULT '',
  `goods_sn` char(20) NOT NULL DEFAULT '',
  `now_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_image` varchar(30) NOT NULL DEFAULT '',
  `goods_brief` text NOT NULL,
  `goods_content` text NOT NULL,
  `goods_weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `stock_qty` smallint(4) unsigned NOT NULL DEFAULT '0',
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `newarrival` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bargain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `cate_id` (`cate_id`),
  FULLTEXT KEY `indexing` (`goods_name`,`meta_keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_album`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_album`;
CREATE TABLE `verydows_goods_album` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `image` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_album
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_attr`;
CREATE TABLE `verydows_goods_attr` (
  `goods_id` mediumint(8) unsigned NOT NULL,
  `attr_id` mediumint(8) NOT NULL,
  `value` varchar(160) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_cate`;
CREATE TABLE `verydows_goods_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(60) NOT NULL DEFAULT '',
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_cate_attr`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_cate_attr`;
CREATE TABLE `verydows_goods_cate_attr` (
  `attr_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `opts` text NOT NULL,
  `uom` varchar(20) NOT NULL DEFAULT '',
  `filtrate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_cate_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_cate_brand`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_cate_brand`;
CREATE TABLE `verydows_goods_cate_brand` (
  `cate_id` smallint(5) unsigned NOT NULL,
  `brand_id` smallint(5) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_cate_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_optional`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_optional`;
CREATE TABLE `verydows_goods_optional` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opt_text` varchar(80) NOT NULL DEFAULT '',
  `opt_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_optional
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_optional_type`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_optional_type`;
CREATE TABLE `verydows_goods_optional_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_optional_type
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_related`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_related`;
CREATE TABLE `verydows_goods_related` (
  `goods_id` mediumint(8) NOT NULL,
  `related_id` mediumint(8) NOT NULL,
  `direction` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`goods_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_related
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_goods_review`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_review`;
CREATE TABLE `verydows_goods_review` (
  `review_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rating` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `replied` text NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_review
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_help`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_help`;
CREATE TABLE `verydows_help` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `meta_keywords` varchar(240) NOT NULL DEFAULT '',
  `meta_description` varchar(240) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_help
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_help_cate`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_help_cate`;
CREATE TABLE `verydows_help_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(60) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_help_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_navigation`;
CREATE TABLE `verydows_navigation` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_navigation
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_oauth`;
CREATE TABLE `verydows_oauth` (
  `party` char(10) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `params` text NOT NULL,
  `instruction` varchar(240) NOT NULL DEFAULT '',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`party`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_oauth
-- ----------------------------
INSERT INTO `verydows_oauth` VALUES ('qq', '腾讯QQ', '{\"app_id\":\"\",\"app_key\":\"\"}', 'QQ互联开放平台为第三方网站提供了丰富的API。第三方网站接入QQ互联开放平台后，即可通过调用平台提供的API实现用户使用QQ帐号登录网站功能，且可以获取到腾讯QQ用户的相关信息。', '1');
INSERT INTO `verydows_oauth` VALUES ('weibo', '新浪微博', '{\"app_key\":\"\",\"app_secret\":\"\"}', '网站接入是微博针对第三方网站提供的社会化网络接入方案。接入微连接让您的网站支持用微博帐号登录，基于OAuth2.0协议，使用微博 Open API 进行开发， 即可用微博帐号登录你的网站， 让你的网站降低新用户注册成本，快速获取大量用户。', '1');

-- ----------------------------
-- Table structure for `verydows_order`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_order`;
CREATE TABLE `verydows_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `shipping_method` smallint(5) unsigned NOT NULL DEFAULT '0',
  `payment_method` smallint(5) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `memos` varchar(240) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `thirdparty_trade_id` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_order
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_order_consignee`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_order_consignee`;
CREATE TABLE `verydows_order_consignee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `receiver` varchar(20) NOT NULL DEFAULT '',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `borough` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(240) NOT NULL DEFAULT '',
  `zip` char(6) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_order_consignee
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_order_goods`;
CREATE TABLE `verydows_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(180) NOT NULL DEFAULT '',
  `goods_image` varchar(30) NOT NULL DEFAULT '',
  `goods_qty` smallint(5) NOT NULL DEFAULT '1',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `is_reviewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_order_goods_optional`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_order_goods_optional`;
CREATE TABLE `verydows_order_goods_optional` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `opt_id` int(10) unsigned NOT NULL DEFAULT '0',
  `opt_type` varchar(20) NOT NULL DEFAULT '',
  `opt_text` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_order_goods_optional
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_order_log`;
CREATE TABLE `verydows_order_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `operate` char(10) NOT NULL,
  `cause` varchar(240) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_order_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_order_shipping`;
CREATE TABLE `verydows_order_shipping` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` char(15) NOT NULL DEFAULT '',
  `carrier_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tracking_no` varchar(20) NOT NULL DEFAULT '',
  `memos` varchar(240) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_order_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_payment_method`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_payment_method`;
CREATE TABLE `verydows_payment_method` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pcode` varchar(20) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `instruction` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_payment_method
-- ----------------------------
INSERT INTO `verydows_payment_method` VALUES ('1', '余额支付', '0', 'balance', '[\"\"]', '', '2', '1');
INSERT INTO `verydows_payment_method` VALUES ('2', '货到付款', '1', 'cod', '[\"\"]', '', '3', '1');
INSERT INTO `verydows_payment_method` VALUES ('3', '支付宝', '0', 'alipay', '{\"seller\":\"\",\"partner\":\"\",\"key\":\"\"}', '', '1', '1');

-- ----------------------------
-- Table structure for `verydows_request_error`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_request_error`;
CREATE TABLE `verydows_request_error` (
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `lockout` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_request_error
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_role`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_role`;
CREATE TABLE `verydows_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '',
  `role_desc` varchar(240) NOT NULL DEFAULT '',
  `role_acl` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_role
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_sendmail_limit`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_sendmail_limit`;
CREATE TABLE `verydows_sendmail_limit` (
  `ip` char(15) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` char(30) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_sendmail_limit
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_setting`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_setting`;
CREATE TABLE `verydows_setting` (
  `sk` varchar(30) NOT NULL,
  `sv` text NOT NULL,
  PRIMARY KEY (`sk`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_setting
-- ----------------------------
INSERT INTO `verydows_setting` VALUES ('site_name', 'Verydows 开源电商系统');
INSERT INTO `verydows_setting` VALUES ('home_title', 'Verydows 开源电子商务系统 | 轻松开启电商之旅');
INSERT INTO `verydows_setting` VALUES ('home_keywords', '');
INSERT INTO `verydows_setting` VALUES ('home_description', '');
INSERT INTO `verydows_setting` VALUES ('footer_info', '<div class=\"copyright mt10\"><p>联系邮箱：service@verydows.com<span class=\"sep\">|</span>QQ交流群：372701906<span class=\"sep\">|</span>Copyright © 2016 Verydows.com 版权所有</p></div>');
INSERT INTO `verydows_setting` VALUES ('goods_search_per_num', '20');
INSERT INTO `verydows_setting` VALUES ('upload_filetype', '.jpg|.jpeg|.gif|.png|.bmp|.swf|.flv|.avi|.rmvb');
INSERT INTO `verydows_setting` VALUES ('upload_filesize', '2MB');
INSERT INTO `verydows_setting` VALUES ('captcha_admin_login', '2');
INSERT INTO `verydows_setting` VALUES ('captcha_user_login', '2');
INSERT INTO `verydows_setting` VALUES ('captcha_user_register', '1');
INSERT INTO `verydows_setting` VALUES ('captcha_feedback', '1');
INSERT INTO `verydows_setting` VALUES ('smtp_server', 'smtp.163.com');
INSERT INTO `verydows_setting` VALUES ('smtp_user', 'test@163.com');
INSERT INTO `verydows_setting` VALUES ('smtp_password', '');
INSERT INTO `verydows_setting` VALUES ('smtp_port', '25');
INSERT INTO `verydows_setting` VALUES ('smtp_secure', '');
INSERT INTO `verydows_setting` VALUES ('admin_mult_ip_login', '0');
INSERT INTO `verydows_setting` VALUES ('upload_goods_filesize', '300KB');
INSERT INTO `verydows_setting` VALUES ('visitor_stats', '1');
INSERT INTO `verydows_setting` VALUES ('goods_hot_searches', '');
INSERT INTO `verydows_setting` VALUES ('cate_goods_per_num', '20');
INSERT INTO `verydows_setting` VALUES ('goods_history_num', '5');
INSERT INTO `verydows_setting` VALUES ('goods_related_num', '5');
INSERT INTO `verydows_setting` VALUES ('goods_review_per_num', '10');
INSERT INTO `verydows_setting` VALUES ('upload_goods_filetype', '.jpg|.png|.gif');
INSERT INTO `verydows_setting` VALUES ('show_goods_stock', '0');
INSERT INTO `verydows_setting` VALUES ('order_cancel_expires', '2');
INSERT INTO `verydows_setting` VALUES ('goods_img_thumb', '[{\"w\":350,\"h\":350},{\"w\":150,\"h\":150},{\"w\":100,\"h\":100},{\"w\":50,\"h\":50}]');
INSERT INTO `verydows_setting` VALUES ('goods_album_thumb', '[{\"w\":350,\"h\":350},{\"w\":50,\"h\":50}]');
INSERT INTO `verydows_setting` VALUES ('enabled_theme', 'default');
INSERT INTO `verydows_setting` VALUES ('user_consignee_limits', '15');
INSERT INTO `verydows_setting` VALUES ('upload_avatar_filesize', '200KB');
INSERT INTO `verydows_setting` VALUES ('order_delivery_expires', '7');
INSERT INTO `verydows_setting` VALUES ('user_register_email_verify', '0');
INSERT INTO `verydows_setting` VALUES ('user_review_approve', '0');
INSERT INTO `verydows_setting` VALUES ('rewrite_enable', '1');
INSERT INTO `verydows_setting` VALUES ('data_cache_lifetime', '7200');
INSERT INTO `verydows_setting` VALUES ('goods_fulltext_query', '0');
INSERT INTO `verydows_setting` VALUES ('debug', '1');
INSERT INTO `verydows_setting` VALUES ('rewrite_rule', '{\"m\\/pay\\/return\\/<pcode>.html\":\"mobile\\/pay\\/return\",\"pay\\/return\\/<pcode>.html\":\"pay\\/return\",\"api\\/pay\\/notify\\/<pcode>\":\"api\\/pay\\/notify\",\"api\\/oauth\\/callback\\/<party>\":\"api\\/oauth\\/callback\",\"m\\/index.html\":\"mobile\\/main\\/index\",\"m\\/<c>\\/<a>.html\":\"mobile\\/<c>\\/<a>\",\"api\\/<c>\\/<a>\":\"api\\/<c>\\/<a>\",\"404.html\":\"main\\/404\",\"index.html\":\"main\\/index\",\"<c>\\/<a>.html\":\"<c>\\/<a>\"}');
INSERT INTO `verydows_setting` VALUES ('encrypt_key', '9e290273e0f7eeb6747911efb164b0b7');

-- ----------------------------
-- Table structure for `verydows_shipping_carrier`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_shipping_carrier`;
CREATE TABLE `verydows_shipping_carrier` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tracking_url` varchar(255) NOT NULL DEFAULT '',
  `service_tel` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_shipping_carrier
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_shipping_method`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_shipping_method`;
CREATE TABLE `verydows_shipping_method` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `instruction` varchar(240) NOT NULL DEFAULT '',
  `seq` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_shipping_method
-- ----------------------------
INSERT INTO `verydows_shipping_method` VALUES ('1', '普通快递', '{\"0\":{\"type\":\"fixed\",\"area\":\"0\",\"charges\":\"0\"}}', '全国范围免邮', '1', '1');
INSERT INTO `verydows_shipping_method` VALUES ('2', '邮政快递', '{\"0\":{\"type\":\"fixed\",\"area\":[\"1\",\"2\"],\"charges\":\"20\"}}', '', '99', '1');
INSERT INTO `verydows_shipping_method` VALUES ('3', '邮政速递2', '{\"0\":{\"type\":\"weight\",\"area\":[\"1\",\"2\",\"3\",\"4\"],\"first_weight\":\"5\",\"first_charges\":\"10\",\"added_weight\":\"1\",\"added_charges\":\"2\"}}', '', '99', '1');

-- ----------------------------
-- Table structure for `verydows_user`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user`;
CREATE TABLE `verydows_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(16) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `avatar` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mobile_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_account`;
CREATE TABLE `verydows_user_account` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_account
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_account_log`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_account_log`;
CREATE TABLE `verydows_user_account_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `cause` varchar(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_consignee`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_consignee`;
CREATE TABLE `verydows_user_consignee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `receiver` varchar(20) NOT NULL DEFAULT '',
  `province` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `city` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `borough` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `address` varchar(240) NOT NULL DEFAULT '',
  `zip` char(6) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_consignee
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_favorite`;
CREATE TABLE `verydows_user_favorite` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL,
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`goods_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_group`;
CREATE TABLE `verydows_user_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) NOT NULL,
  `min_exp` int(10) unsigned NOT NULL DEFAULT '0',
  `discount_rate` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_group
-- ----------------------------
INSERT INTO `verydows_user_group` VALUES ('1', '初级会员', '0', '100');
INSERT INTO `verydows_user_group` VALUES ('2', '中级会员', '2000', '100');
INSERT INTO `verydows_user_group` VALUES ('3', '高级会员', '7000', '100');

-- ----------------------------
-- Table structure for `verydows_user_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_oauth`;
CREATE TABLE `verydows_user_oauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `party` char(10) NOT NULL DEFAULT '',
  `oauth_key` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_profile`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_profile`;
CREATE TABLE `verydows_user_profile` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birth_year` smallint(4) unsigned NOT NULL DEFAULT '0',
  `birth_month` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `birth_day` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `signature` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_profile
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_user_record`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_user_record`;
CREATE TABLE `verydows_user_record` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `created_ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `last_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_user_record
-- ----------------------------

-- ----------------------------
-- Table structure for `verydows_visitor_stats`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_visitor_stats`;
CREATE TABLE `verydows_visitor_stats` (
  `sessid` char(32) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pv` smallint(5) unsigned NOT NULL DEFAULT '1',
  `referrer` varchar(80) NOT NULL DEFAULT '',
  `browser` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `platform` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `area` char(10) NOT NULL DEFAULT '',
  KEY `sessid` (`sessid`) USING BTREE,
  KEY `ip` (`ip`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_visitor_stats
-- ----------------------------
INSERT INTO `verydows_visitor_stats` VALUES ('078b7fef6aa03b5a7647a69c1eddd5a9', '114.251.205.2', '1502812800', '14', '127.0.0.1', '3', '1', '北京市');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502869582', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502869935', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502870361', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502870374', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502870385', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502870423', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502870460', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('', '127.0.0.1', '1502870621', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('rbsfquca5q1riun4fb4nm8t0d1', '127.0.0.1', '1502870698', '2', '', '2', '0', '');
