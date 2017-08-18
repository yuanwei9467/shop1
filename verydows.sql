/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : verydows

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-08-18 17:07:39
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
  `goods_image` varchar(300) NOT NULL DEFAULT '',
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods
-- ----------------------------
INSERT INTO `verydows_goods` VALUES ('20', '1', '0', '华为 HUAWEI Nova (CAZ-AL10) 全网通版', '00100219953', '2099.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/485826a56b10398.jpg', '精美金属机身，舒适握感！4K高清视频拍摄！美颜自拍！DTS音效！张艺兴，关晓彤的选择！', '<div class=\"content\"><p style=\"text-align: center;\"><img src=\"http://demo.verydows.com/upload/goods/editor/1611/5826a662b4f22Dw8GRU7cJ568921.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/5826a662b4f22Dw8GRU7cJ568921.jpg\"/></p></div>', '0.00', '100', '华为 HUAWEI Nova (CAZ-AL10) 全网通版', '华为 HUAWEI Nova (CAZ-AL10) 全网通版', '1503024243', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('19', '1', '0', 'Apple iPhone 7 (A1660) 国行版', '00100117376', '5199.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/3858269ea7d1c9f.jpg', '', '<div class=\"content\"><div style=\"text-align:center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/58269f91f3b9b2VpJYC3XAE50145.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/58269f91f3b9b2VpJYC3XAE50145.jpg\" style=\"\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/58269f9632bf6ytEal405iH30662.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/58269f9632bf6ytEal405iH30662.jpg\" style=\"\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/58269f9cc7a2fbJOx0R7N8X67972.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/58269f9cc7a2fbJOx0R7N8X67972.jpg\" style=\"\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/58269fa2500b2oH9pZarjJO59866.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/58269fa2500b2oH9pZarjJO59866.jpg\" style=\"\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/58269fa65620fuhvobJ8qHk91264.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/58269fa65620fuhvobJ8qHk91264.jpg\" style=\"\"/></p></div>', '0.00', '100', 'Apple iPhone 7 (A1660) 国行版', 'Apple iPhone 7 (A1660) 国行版', '1503024254', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('16', '1', '0', 'Apple iPhone 6s Plus', '00100116500', '4688.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1656e6d17164926.jpg', '', '<div class=\"content\"></div>', '0.00', '100', 'Apple iPhone 6s Plus', 'Apple iPhone 6s Plus', '1503024254', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('13', '1', '0', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待 香槟金', '00101513635', '3698.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1356e6c40a0d492.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e6c6405bf3bw2T3JtxeM558784.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e6c64a81c98BuJ9V5C0D426836.jpg\"/></p></div>', '0.00', '100', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待 香槟金', 'vivo Xplay5 全网通4G手机 4GB+128GB 双卡双待 香槟金', '1503024254', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('3', '1', '0', '小米4 MI4 2GB内存版 移动 联通 电信 4G手机', '0010033521', '1299.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/356e2fa344ec51.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2fad802f73JXclAK3DV07838.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2fae1ea2e2F6Y1lpxjE250520.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2fae836e9fugT70NKaUe75951.jpg\"/></p></div>', '0.00', '100', '小米4 MI4 2GB内存版 移动 联通 电信 4G手机', '小米4 MI4 2GB内存版 移动 联通 电信 4G手机', '1503024254', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('2', '1', '0', '华为 Mate8 3GB+32GB版 全网通 移动版 月光银 苍穹灰', '0010022030', '2999.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/256e2f30e7256c.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2f2abed2195dHIXDVxa295565.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2f26836850PvsUtf5CjI32491.jpg\"/></p></div>', '0.00', '100', '华为 Mate8 3GB+32GB版 全网通 移动版 月光银 苍穹灰', '华为 Mate8 3GB+32GB版 全网通 移动版 月光银 苍穹灰', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('1', '1', '0', 'Apple iPhone 6s (A1700) 移动联通电信4G手机', '0010011563', '4888.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/156e2d4fa488d0.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2daaf5dc64IiTXQnmG6Z66363.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2dc22524ec5iENqzFsIB51238.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e2dc2ed68dbTJKr2HGiBQ34101.jpg\"/></p></div>', '0.00', '100', 'Apple iPhone 6s (A1700) 移动联通电信4G手机', 'Apple iPhone 6s (A1700) 移动联通电信4G手机', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('21', '2', '0', 'Teclast/台电 Tbook16s 64GB平板电脑二合一 Win10 双系统 11.6英寸', '00801920813', '1679.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/2258291084d0330.jpg', '', '<div class=\"content\"><div style=\"text-align: center;\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/582910e7a171fSlIJ76QfM512361.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/582910e7a171fSlIJ76QfM512361.jpg\" style=\"\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/582910eb76dd0MjiUoWEGkI75987.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/582910eb76dd0MjiUoWEGkI75987.jpg\" style=\"\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/1611/582910ed4e16f06SHLRFIUN36079.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/1611/582910ed4e16f06SHLRFIUN36079.jpg\" style=\"\"/></p></div>', '0.00', '100', 'Teclast/台电 Tbook16s 64GB平板电脑二合一 Win10 双系统 11.6英寸', 'Teclast/台电 Tbook16s 64GB平板电脑二合一 Win10 双系统 11.6英寸', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('17', '2', '0', '微软 Microsoft Surface Pro 3 平板电脑', '00801817082', '0.01', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1756e6d909b8a0c.jpg', '', '<div class=\"content\"><p><span style=\"font-size:16px\">i7i87i87i</span></p></div>', '0.00', '100', '微软 Microsoft Surface Pro 3 平板电脑', '微软 Microsoft Surface Pro 3 平板电脑', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('9', '2', '0', '诺基亚（Nokia）N1 7.9英寸平板电脑', '0000009639', '1099.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/956e4029db165b.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e404e0a51a58MblFa9Jn152056.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e404e6555ca5o90xsbOah31334.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e404eb65c8bZyJVI760NU84987.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e404f152c6f6iFm8oWvgq47192.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e404f5ec67ffxakSiFUmN92775.jpg\"/></p></div>', '0.00', '100', '诺基亚（Nokia）N1 7.9英寸平板电脑', '诺基亚（Nokia）N1 7.9英寸平板电脑', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('8', '2', '0', 'Apple iPad Air 2 MH0W2CH/A 9.7英寸平板电脑', '0080018206', '3288.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/856e3fba434963.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e4008736b14kWtqo0HygS54399.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e4008e6fc68FW01pSODne25515.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e40093ecb183MHgfX2PFV79431.jpg\"/></p></div>', '0.00', '100', 'Apple iPad Air 2 MH0W2CH/A 9.7英寸平板电脑', 'Apple iPad Air 2 MH0W2CH/A 9.7英寸平板电脑', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('7', '2', '0', '三星(SAMSUNG)900X5L-K01 15.0英寸超薄笔记本电脑', '0070097259', '8999.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/756e3f9459edf9.jpg', '', '<div class=\"content\"></div>', '0.00', '100', '三星(SAMSUNG)900X5L-K01 15.0英寸超薄笔记本电脑', '三星(SAMSUNG)900X5L-K01 15.0英寸超薄笔记本电脑', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('6', '2', '0', '宏碁（acer）V3-372-P47B 13.3英寸轻薄笔记本电脑', '0070076922', '2999.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/656e3f5f12fd03.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e3f5d64aca8H4Ums25rXt87027.jpg\"/></p></div>', '0.00', '100', '宏碁（acer）V3-372-P47B 13.3英寸轻薄笔记本电脑', '宏碁（acer）V3-372-P47B 13.3英寸轻薄笔记本电脑', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('5', '2', '0', '戴尔（DELL）Ins14MR-7508R 14.0英寸笔记本电脑 （i5-6200U 4G 500G Win10）', '0070065228', '4399.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/556e3f1ea40b41.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e3f3d10866cKyN8ADTlm775049.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e3f3d857b8fjc8pRygfUY79695.jpg\"/></p></div>', '0.00', '100', '戴尔（DELL）Ins14MR-7508R 14.0英寸笔记本电脑 （i5-6200U 4G 500G Win10）', '戴尔（DELL）Ins14MR-7508R 14.0英寸笔记本电脑 （i5-6200U 4G 500G Win10）', '1503024255', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('4', '2', '0', 'Apple MacBook Air MJVE2CH/A 13.3英寸宽屏笔记本电脑', '0070014005', '6666.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/456e3dfe6d22c1.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e3df31c8fb7iRwAu3PbmC99819.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/56e3df31c8fb7iRwAu3PbmC99819.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e3df4023401NJv1Rc3LfM73993.jpg\" _src=\"http://demo.verydows.com/upload/goods/editor/56e3df4023401NJv1Rc3LfM73993.jpg\"/></p></div>', '0.00', '100', 'Apple MacBook Air MJVE2CH/A 13.3英寸宽屏笔记本电脑', 'Apple MacBook Air MJVE2CH/A 13.3英寸宽屏笔记本电脑', '1503024256', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('15', '3', '0', '奥克斯 AUX KFR-25GW/FK01+3 1匹 挂壁式家用冷暖空调', '01401715715', '1499.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1556e6cf29b6bb6.jpg', '', '<div class=\"content\"></div>', '0.00', '100', '奥克斯 AUX KFR-25GW/FK01+3 1匹 挂壁式家用冷暖空调', '奥克斯 AUX KFR-25GW/FK01+3 1匹 挂壁式家用冷暖空调', '1503024256', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('14', '3', '0', '美的 Midea KFR-51LW/WYAA2 2匹 除PM2.5超静音变频柜机 物联网版', '01401614386', '6699.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1456e6ccd6bdbd6.jpg', '', '<div class=\"content\"></div>', '0.00', '100', '美的 Midea KFR-51LW/WYAA2 2匹 除PM2.5超静音变频柜机 物联网版', '美的 Midea KFR-51LW/WYAA2 2匹 除PM2.5超静音变频柜机 物联网版', '1503024256', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('12', '3', '0', '索尼 SONY U90 55英寸4K超高清 安卓5.0智能系统液晶电视', '00901212289', '8999.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1256e51f1dd0df2.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e5203fa7fbeiAu3Jpt1BI19575.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e52045e8048Gui7A89S4Y21703.jpg\"/></p></div>', '0.00', '100', '索尼 SONY U90 55英寸4K超高清 安卓5.0智能系统液晶电视', '索尼 SONY U90 55英寸4K超高清 安卓5.0智能系统液晶电视', '1503024256', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('11', '3', '0', '飞利浦 PHILIPS 48PFL5445/T3 48英寸 全高清LED智能电视', '00901111459', '2999.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1156e51cf0075f8.jpg', '', '<div class=\"content\"></div>', '0.00', '100', '飞利浦 PHILIPS 48PFL5445/T3 48英寸 全高清LED智能电视', '飞利浦 PHILIPS 48PFL5445/T3 48英寸 全高清LED智能电视', '1503024256', '0', '0', '0', '1');
INSERT INTO `verydows_goods` VALUES ('10', '3', '0', '飞利浦 PHILIPS 49PFL3445/T3 49英寸 全高清LED液晶电视', '00901110039', '2399.00', '0.00', 'http://demo.verydows.com/upload/goods/prime/150x150/1056e5188b5e84e.jpg', '', '<div class=\"content\"><div align=\"center\"><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e5197255a8dKT69YEHpMO28069.jpg\"/></p><p><img src=\"http://demo.verydows.com/upload/goods/editor/56e5196a0b5e2wgTuQ6I5Bd43172.jpg\"/></p></div>', '0.00', '100', '飞利浦 PHILIPS 49PFL3445/T3 49英寸 全高清LED液晶电视', '飞利浦 PHILIPS 49PFL3445/T3 49英寸 全高清LED液晶电视', '1503024256', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `verydows_goods_album`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_album`;
CREATE TABLE `verydows_goods_album` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_album
-- ----------------------------
INSERT INTO `verydows_goods_album` VALUES ('1', '20', 'http://demo.verydows.com/upload/goods/prime/50x50/485826a56b10398.jpg');
INSERT INTO `verydows_goods_album` VALUES ('2', '20', 'http://demo.verydows.com/upload/goods/album/50x50/205826a58a76122.jpg');
INSERT INTO `verydows_goods_album` VALUES ('3', '20', 'http://demo.verydows.com/upload/goods/album/50x50/345826a58a81a63.jpg');
INSERT INTO `verydows_goods_album` VALUES ('4', '20', 'http://demo.verydows.com/upload/goods/album/50x50/515826a58a8d3db.jpg');
INSERT INTO `verydows_goods_album` VALUES ('5', '20', 'http://demo.verydows.com/upload/goods/album/50x50/575826a58a98643.jpg');
INSERT INTO `verydows_goods_album` VALUES ('6', '20', 'http://demo.verydows.com/upload/goods/album/50x50/235826a58aa2add.jpg');
INSERT INTO `verydows_goods_album` VALUES ('7', '19', 'http://demo.verydows.com/upload/goods/prime/50x50/3858269ea7d1c9f.jpg');
INSERT INTO `verydows_goods_album` VALUES ('8', '19', 'http://demo.verydows.com/upload/goods/album/50x50/5958269ed7d3d4d.jpg');
INSERT INTO `verydows_goods_album` VALUES ('9', '19', 'http://demo.verydows.com/upload/goods/album/50x50/3158269ed7c913b.jpg');
INSERT INTO `verydows_goods_album` VALUES ('10', '19', 'http://demo.verydows.com/upload/goods/album/50x50/9558269ed7be5af.jpg');
INSERT INTO `verydows_goods_album` VALUES ('11', '19', 'http://demo.verydows.com/upload/goods/album/50x50/3958269ed7b3ddd.jpg');
INSERT INTO `verydows_goods_album` VALUES ('12', '19', 'http://demo.verydows.com/upload/goods/album/50x50/2258269ed7a8d7a.jpg');
INSERT INTO `verydows_goods_album` VALUES ('13', '16', 'http://demo.verydows.com/upload/goods/prime/50x50/1656e6d17164926.jpg');
INSERT INTO `verydows_goods_album` VALUES ('14', '16', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d17164f91PGQJUuEyrV97248.jpg');
INSERT INTO `verydows_goods_album` VALUES ('15', '16', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d17164ee4EAzyl70sHQ5322.jpg');
INSERT INTO `verydows_goods_album` VALUES ('16', '16', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d17164e20BpxUwMG6eC69216.jpg');
INSERT INTO `verydows_goods_album` VALUES ('17', '13', 'http://demo.verydows.com/upload/goods/prime/50x50/1356e6c40a0d492.jpg');
INSERT INTO `verydows_goods_album` VALUES ('18', '13', 'http://demo.verydows.com/upload/goods/album/50x50/56e6c40a0da8byXYOEBjsqz53057.jpg');
INSERT INTO `verydows_goods_album` VALUES ('19', '13', 'http://demo.verydows.com/upload/goods/album/50x50/56e6c40a0d9c8UVbCSzOqNW97722.jpg');
INSERT INTO `verydows_goods_album` VALUES ('20', '13', 'http://demo.verydows.com/upload/goods/album/50x50/56e6c40a0d901YOUSGBw2NA2184.jpg');
INSERT INTO `verydows_goods_album` VALUES ('21', '3', 'http://demo.verydows.com/upload/goods/prime/50x50/356e2fa344ec51.jpg');
INSERT INTO `verydows_goods_album` VALUES ('22', '3', 'http://demo.verydows.com/upload/goods/album/50x50/56e2fa344f384iqwXgUJ4OM64483.jpg');
INSERT INTO `verydows_goods_album` VALUES ('23', '3', 'http://demo.verydows.com/upload/goods/album/50x50/56e2fa344f2e0XPhivetwqd36656.jpg');
INSERT INTO `verydows_goods_album` VALUES ('24', '3', 'http://demo.verydows.com/upload/goods/album/50x50/56e2fa344f23ctCfyjL1WAZ46687.jpg');
INSERT INTO `verydows_goods_album` VALUES ('25', '3', 'http://demo.verydows.com/upload/goods/album/50x50/56e2fa344f195JtQsiem0Hy2366.jpg');
INSERT INTO `verydows_goods_album` VALUES ('26', '3', 'http://demo.verydows.com/upload/goods/album/50x50/56e2fa344f0eamoiRIGQUST26183.jpg');
INSERT INTO `verydows_goods_album` VALUES ('27', '3', 'http://demo.verydows.com/upload/goods/album/50x50/56e2fa344f02cY1uRU7wkr339310.jpg');
INSERT INTO `verydows_goods_album` VALUES ('28', '2', 'http://demo.verydows.com/upload/goods/prime/50x50/256e2f30e7256c.jpg');
INSERT INTO `verydows_goods_album` VALUES ('29', '2', 'http://demo.verydows.com/upload/goods/album/50x50/56e2f30e72928BSOzT93IkP9639.jpg');
INSERT INTO `verydows_goods_album` VALUES ('30', '2', 'http://demo.verydows.com/upload/goods/album/50x50/56e2f30e729e9TJ9pqaSYQZ87527.jpg');
INSERT INTO `verydows_goods_album` VALUES ('31', '2', 'http://demo.verydows.com/upload/goods/album/50x50/56e2f30e72a98gP0RSdCui37720.jpg');
INSERT INTO `verydows_goods_album` VALUES ('32', '2', 'http://demo.verydows.com/upload/goods/album/50x50/56e2f30e72b41PyGKWtfZ0311691.jpg');
INSERT INTO `verydows_goods_album` VALUES ('33', '2', 'http://demo.verydows.com/upload/goods/album/50x50/56e2f5332bff4rao5t7snf261816.jpg');
INSERT INTO `verydows_goods_album` VALUES ('34', '2', 'http://demo.verydows.com/upload/goods/album/50x50/56e2f5332c0d0YT4xyB0kAd82509.jpg');
INSERT INTO `verydows_goods_album` VALUES ('35', '1', 'http://demo.verydows.com/upload/goods/prime/50x50/156e2d4fa488d0.jpg');
INSERT INTO `verydows_goods_album` VALUES ('36', '1', 'http://demo.verydows.com/upload/goods/album/50x50/56e2d943368b959ynGbQ7lW80201.jpg');
INSERT INTO `verydows_goods_album` VALUES ('37', '1', 'http://demo.verydows.com/upload/goods/album/50x50/56e2d94336995XcJQWpDSwE86673.jpg');
INSERT INTO `verydows_goods_album` VALUES ('38', '21', 'http://demo.verydows.com/upload/goods/prime/50x50/2258291084d0330.jpg');
INSERT INTO `verydows_goods_album` VALUES ('39', '21', 'http://demo.verydows.com/upload/goods/album/50x50/27582910926e671.jpg');
INSERT INTO `verydows_goods_album` VALUES ('40', '21', 'http://demo.verydows.com/upload/goods/album/50x50/5058291092805a4.jpg');
INSERT INTO `verydows_goods_album` VALUES ('41', '21', 'http://demo.verydows.com/upload/goods/album/50x50/82582910928cd57.jpg');
INSERT INTO `verydows_goods_album` VALUES ('42', '17', 'http://demo.verydows.com/upload/goods/prime/50x50/1756e6d909b8a0c.jpg');
INSERT INTO `verydows_goods_album` VALUES ('43', '17', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d909b8fcc1kSndBiq8G49254.jpg');
INSERT INTO `verydows_goods_album` VALUES ('44', '17', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d909b8f00X5n7MsSVcP12157.jpg');
INSERT INTO `verydows_goods_album` VALUES ('45', '9', 'http://demo.verydows.com/upload/goods/prime/50x50/956e4029db165b.jpg');
INSERT INTO `verydows_goods_album` VALUES ('46', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1a5aVK73Qd4kRY44539.jpg');
INSERT INTO `verydows_goods_album` VALUES ('47', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1b2dYKsE8d9bl265913.jpg');
INSERT INTO `verydows_goods_album` VALUES ('48', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1bdc2SgAQe8DhX13870.jpg');
INSERT INTO `verydows_goods_album` VALUES ('49', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1c85GtqHLd9bfO22887.jpg');
INSERT INTO `verydows_goods_album` VALUES ('50', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1d36cjQ02S4wRx84896.jpg');
INSERT INTO `verydows_goods_album` VALUES ('51', '8', 'http://demo.verydows.com/upload/goods/prime/50x50/856e3fba434963.jpg');
INSERT INTO `verydows_goods_album` VALUES ('52', '8', 'http://demo.verydows.com/upload/goods/album/50x50/56e3fba434df3FvpI1ea2z011388.jpg');
INSERT INTO `verydows_goods_album` VALUES ('53', '8', 'http://demo.verydows.com/upload/goods/album/50x50/56e3fba434ebdgGnoHcM62f69789.jpg');
INSERT INTO `verydows_goods_album` VALUES ('54', '8', 'http://demo.verydows.com/upload/goods/album/50x50/56e3fba434f6bOk0oljHqRg88606.jpg');
INSERT INTO `verydows_goods_album` VALUES ('55', '7', 'http://demo.verydows.com/upload/goods/prime/50x50/756e3f9459edf9.jpg');
INSERT INTO `verydows_goods_album` VALUES ('56', '7', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f9459f26416pkIfzRxL94522.jpg');
INSERT INTO `verydows_goods_album` VALUES ('57', '7', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f9459f329V1m5ivX80J61533.jpg');
INSERT INTO `verydows_goods_album` VALUES ('58', '7', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f9459f3d75RjAoGYxNI60323.jpg');
INSERT INTO `verydows_goods_album` VALUES ('59', '6', 'http://demo.verydows.com/upload/goods/prime/50x50/656e3f5f12fd03.jpg');
INSERT INTO `verydows_goods_album` VALUES ('60', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f13024fewM0GFa5Vt49870.jpg');
INSERT INTO `verydows_goods_album` VALUES ('61', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f13032bKUPf8uecMz91660.jpg');
INSERT INTO `verydows_goods_album` VALUES ('62', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f1303d9oYudLMSe7y99233.jpg');
INSERT INTO `verydows_goods_album` VALUES ('63', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f130486e4w0WSoUmZ13763.jpg');
INSERT INTO `verydows_goods_album` VALUES ('64', '5', 'http://demo.verydows.com/upload/goods/prime/50x50/556e3f1ea40b41.jpg');
INSERT INTO `verydows_goods_album` VALUES ('65', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea40f58mkRSp4lMJA2728.jpg');
INSERT INTO `verydows_goods_album` VALUES ('66', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea4101alQtjuWg7G16579.jpg');
INSERT INTO `verydows_goods_album` VALUES ('67', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea410c87IodqvTUXH31299.jpg');
INSERT INTO `verydows_goods_album` VALUES ('68', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea41174sdoGeHNpL541450.jpg');
INSERT INTO `verydows_goods_album` VALUES ('69', '4', 'http://demo.verydows.com/upload/goods/prime/50x50/456e3dfe6d22c1.jpg');
INSERT INTO `verydows_goods_album` VALUES ('70', '4', 'http://demo.verydows.com/upload/goods/album/50x50/56e3dfe6d279cuDlyS83YL155115.jpg');
INSERT INTO `verydows_goods_album` VALUES ('71', '4', 'http://demo.verydows.com/upload/goods/album/50x50/56e3dfe6d288aDoQdTKf6nJ56044.jpg');
INSERT INTO `verydows_goods_album` VALUES ('72', '15', 'http://demo.verydows.com/upload/goods/prime/50x50/1556e6cf29b6bb6.jpg');
INSERT INTO `verydows_goods_album` VALUES ('73', '15', 'http://demo.verydows.com/upload/goods/album/50x50/56e6cf29b71afKUwdtDvquI21134.jpg');
INSERT INTO `verydows_goods_album` VALUES ('74', '15', 'http://demo.verydows.com/upload/goods/album/50x50/56e6cf29b729907TybLOFhI8230.jpg');
INSERT INTO `verydows_goods_album` VALUES ('75', '14', 'http://demo.verydows.com/upload/goods/prime/50x50/1456e6ccd6bdbd6.jpg');
INSERT INTO `verydows_goods_album` VALUES ('76', '14', 'http://demo.verydows.com/upload/goods/album/50x50/56e6ccd6bdfeeayuY1i63oD43514.jpg');
INSERT INTO `verydows_goods_album` VALUES ('77', '14', 'http://demo.verydows.com/upload/goods/album/50x50/56e6ccd6be0b0hc3qve6I0Z69833.jpg');
INSERT INTO `verydows_goods_album` VALUES ('78', '14', 'http://demo.verydows.com/upload/goods/album/50x50/56e6ccd6be15cY3SmyQldF512516.jpg');
INSERT INTO `verydows_goods_album` VALUES ('79', '12', 'http://demo.verydows.com/upload/goods/prime/50x50/1256e51f1dd0df2.jpg');
INSERT INTO `verydows_goods_album` VALUES ('80', '12', 'http://demo.verydows.com/upload/goods/album/50x50/56e51f1dd11f741p2ygvBAq21097.jpg');
INSERT INTO `verydows_goods_album` VALUES ('81', '12', 'http://demo.verydows.com/upload/goods/album/50x50/56e51f1dd12bf5cX4uhmtb368719.jpg');
INSERT INTO `verydows_goods_album` VALUES ('82', '11', 'http://demo.verydows.com/upload/goods/prime/50x50/1156e51cf0075f8.jpg');
INSERT INTO `verydows_goods_album` VALUES ('83', '11', 'http://demo.verydows.com/upload/goods/album/50x50/56e51cf0079a7JE9oKl0Njz63104.jpg');
INSERT INTO `verydows_goods_album` VALUES ('84', '11', 'http://demo.verydows.com/upload/goods/album/50x50/56e51cf007a6aBOfzmsalQE58255.jpg');
INSERT INTO `verydows_goods_album` VALUES ('85', '10', 'http://demo.verydows.com/upload/goods/prime/50x50/1056e5188b5e84e.jpg');
INSERT INTO `verydows_goods_album` VALUES ('86', '10', 'http://demo.verydows.com/upload/goods/album/50x50/56e5188b5ed92nkGi16usrt831.jpg');
INSERT INTO `verydows_goods_album` VALUES ('87', '10', 'http://demo.verydows.com/upload/goods/album/50x50/56e5188b5ee5cX8rRQBv4Gh26528.jpg');
INSERT INTO `verydows_goods_album` VALUES ('88', '10', 'http://demo.verydows.com/upload/goods/album/50x50/56e5188b5ef0asHY8fUuQv198815.jpg');
INSERT INTO `verydows_goods_album` VALUES ('89', '7', 'http://demo.verydows.com/upload/goods/prime/50x50/756e3f9459edf9.jpg');
INSERT INTO `verydows_goods_album` VALUES ('90', '7', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f9459f26416pkIfzRxL94522.jpg');
INSERT INTO `verydows_goods_album` VALUES ('91', '7', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f9459f329V1m5ivX80J61533.jpg');
INSERT INTO `verydows_goods_album` VALUES ('92', '7', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f9459f3d75RjAoGYxNI60323.jpg');
INSERT INTO `verydows_goods_album` VALUES ('93', '6', 'http://demo.verydows.com/upload/goods/prime/50x50/656e3f5f12fd03.jpg');
INSERT INTO `verydows_goods_album` VALUES ('94', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f13024fewM0GFa5Vt49870.jpg');
INSERT INTO `verydows_goods_album` VALUES ('95', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f13032bKUPf8uecMz91660.jpg');
INSERT INTO `verydows_goods_album` VALUES ('96', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f1303d9oYudLMSe7y99233.jpg');
INSERT INTO `verydows_goods_album` VALUES ('97', '6', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f5f130486e4w0WSoUmZ13763.jpg');
INSERT INTO `verydows_goods_album` VALUES ('98', '5', 'http://demo.verydows.com/upload/goods/prime/50x50/556e3f1ea40b41.jpg');
INSERT INTO `verydows_goods_album` VALUES ('99', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea40f58mkRSp4lMJA2728.jpg');
INSERT INTO `verydows_goods_album` VALUES ('100', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea4101alQtjuWg7G16579.jpg');
INSERT INTO `verydows_goods_album` VALUES ('101', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea410c87IodqvTUXH31299.jpg');
INSERT INTO `verydows_goods_album` VALUES ('102', '5', 'http://demo.verydows.com/upload/goods/album/50x50/56e3f1ea41174sdoGeHNpL541450.jpg');
INSERT INTO `verydows_goods_album` VALUES ('103', '4', 'http://demo.verydows.com/upload/goods/prime/50x50/456e3dfe6d22c1.jpg');
INSERT INTO `verydows_goods_album` VALUES ('104', '4', 'http://demo.verydows.com/upload/goods/album/50x50/56e3dfe6d279cuDlyS83YL155115.jpg');
INSERT INTO `verydows_goods_album` VALUES ('105', '4', 'http://demo.verydows.com/upload/goods/album/50x50/56e3dfe6d288aDoQdTKf6nJ56044.jpg');
INSERT INTO `verydows_goods_album` VALUES ('106', '21', 'http://demo.verydows.com/upload/goods/prime/50x50/2258291084d0330.jpg');
INSERT INTO `verydows_goods_album` VALUES ('107', '21', 'http://demo.verydows.com/upload/goods/album/50x50/27582910926e671.jpg');
INSERT INTO `verydows_goods_album` VALUES ('108', '21', 'http://demo.verydows.com/upload/goods/album/50x50/5058291092805a4.jpg');
INSERT INTO `verydows_goods_album` VALUES ('109', '21', 'http://demo.verydows.com/upload/goods/album/50x50/82582910928cd57.jpg');
INSERT INTO `verydows_goods_album` VALUES ('110', '17', 'http://demo.verydows.com/upload/goods/prime/50x50/1756e6d909b8a0c.jpg');
INSERT INTO `verydows_goods_album` VALUES ('111', '17', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d909b8fcc1kSndBiq8G49254.jpg');
INSERT INTO `verydows_goods_album` VALUES ('112', '17', 'http://demo.verydows.com/upload/goods/album/50x50/56e6d909b8f00X5n7MsSVcP12157.jpg');
INSERT INTO `verydows_goods_album` VALUES ('113', '9', 'http://demo.verydows.com/upload/goods/prime/50x50/956e4029db165b.jpg');
INSERT INTO `verydows_goods_album` VALUES ('114', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1a5aVK73Qd4kRY44539.jpg');
INSERT INTO `verydows_goods_album` VALUES ('115', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1b2dYKsE8d9bl265913.jpg');
INSERT INTO `verydows_goods_album` VALUES ('116', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1bdc2SgAQe8DhX13870.jpg');
INSERT INTO `verydows_goods_album` VALUES ('117', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1c85GtqHLd9bfO22887.jpg');
INSERT INTO `verydows_goods_album` VALUES ('118', '9', 'http://demo.verydows.com/upload/goods/album/50x50/56e4029db1d36cjQ02S4wRx84896.jpg');
INSERT INTO `verydows_goods_album` VALUES ('119', '8', 'http://demo.verydows.com/upload/goods/prime/50x50/856e3fba434963.jpg');
INSERT INTO `verydows_goods_album` VALUES ('120', '8', 'http://demo.verydows.com/upload/goods/album/50x50/56e3fba434df3FvpI1ea2z011388.jpg');
INSERT INTO `verydows_goods_album` VALUES ('121', '8', 'http://demo.verydows.com/upload/goods/album/50x50/56e3fba434ebdgGnoHcM62f69789.jpg');
INSERT INTO `verydows_goods_album` VALUES ('122', '8', 'http://demo.verydows.com/upload/goods/album/50x50/56e3fba434f6bOk0oljHqRg88606.jpg');
INSERT INTO `verydows_goods_album` VALUES ('123', '12', 'http://demo.verydows.com/upload/goods/prime/50x50/1256e51f1dd0df2.jpg');
INSERT INTO `verydows_goods_album` VALUES ('124', '12', 'http://demo.verydows.com/upload/goods/album/50x50/56e51f1dd11f741p2ygvBAq21097.jpg');
INSERT INTO `verydows_goods_album` VALUES ('125', '12', 'http://demo.verydows.com/upload/goods/album/50x50/56e51f1dd12bf5cX4uhmtb368719.jpg');
INSERT INTO `verydows_goods_album` VALUES ('126', '11', 'http://demo.verydows.com/upload/goods/prime/50x50/1156e51cf0075f8.jpg');
INSERT INTO `verydows_goods_album` VALUES ('127', '11', 'http://demo.verydows.com/upload/goods/album/50x50/56e51cf0079a7JE9oKl0Njz63104.jpg');
INSERT INTO `verydows_goods_album` VALUES ('128', '11', 'http://demo.verydows.com/upload/goods/album/50x50/56e51cf007a6aBOfzmsalQE58255.jpg');
INSERT INTO `verydows_goods_album` VALUES ('129', '10', 'http://demo.verydows.com/upload/goods/prime/50x50/1056e5188b5e84e.jpg');
INSERT INTO `verydows_goods_album` VALUES ('130', '10', 'http://demo.verydows.com/upload/goods/album/50x50/56e5188b5ed92nkGi16usrt831.jpg');
INSERT INTO `verydows_goods_album` VALUES ('131', '10', 'http://demo.verydows.com/upload/goods/album/50x50/56e5188b5ee5cX8rRQBv4Gh26528.jpg');
INSERT INTO `verydows_goods_album` VALUES ('132', '10', 'http://demo.verydows.com/upload/goods/album/50x50/56e5188b5ef0asHY8fUuQv198815.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_cate
-- ----------------------------
INSERT INTO `verydows_goods_cate` VALUES ('1', '0', '手机', '手机', '手机', '99');
INSERT INTO `verydows_goods_cate` VALUES ('2', '0', '电脑', '电脑', '电脑', '99');
INSERT INTO `verydows_goods_cate` VALUES ('3', '0', '家电', '家电', '家电', '99');
INSERT INTO `verydows_goods_cate` VALUES ('4', '0', '汽车用品', '汽车用品', '汽车用品', '99');
INSERT INTO `verydows_goods_cate` VALUES ('5', '0', '个护化妆', '个护化妆', '个护化妆', '99');
INSERT INTO `verydows_goods_cate` VALUES ('6', '0', '珠宝饰品', '珠宝饰品', '珠宝饰品', '99');
INSERT INTO `verydows_goods_cate` VALUES ('7', '0', '食品酒类', '食品酒类', '食品酒类', '99');
INSERT INTO `verydows_goods_cate` VALUES ('8', '2', '平板电脑', '平板电脑', '平板电脑', '99');
INSERT INTO `verydows_goods_cate` VALUES ('9', '2', '笔记本', '笔记本', '笔记本', '99');
INSERT INTO `verydows_goods_cate` VALUES ('10', '3', '电视', '电视', '电视', '99');
INSERT INTO `verydows_goods_cate` VALUES ('11', '3', '空调', '空调', '空调', '99');
INSERT INTO `verydows_goods_cate` VALUES ('12', '6', '项链', '项链', '项链', '99');
INSERT INTO `verydows_goods_cate` VALUES ('13', '6', '手链', '手链', '手链', '99');

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
) ENGINE=MyISAM AUTO_INCREMENT=656 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_optional
-- ----------------------------
INSERT INTO `verydows_goods_optional` VALUES ('583', '239', '20', '64GB', '300.00');
INSERT INTO `verydows_goods_optional` VALUES ('584', '239', '20', '32GB', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('585', '240', '20', '香槟金(白)', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('586', '240', '20', '香槟金(黑)', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('587', '240', '20', '玫瑰金', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('588', '240', '20', '皓月银', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('589', '241', '20', '64GB', '300.00');
INSERT INTO `verydows_goods_optional` VALUES ('590', '241', '20', '32GB', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('591', '242', '20', '香槟金(白)', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('592', '242', '20', '香槟金(黑)', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('593', '242', '20', '玫瑰金', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('594', '242', '20', '皓月银', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('595', '243', '19', '银色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('596', '243', '19', '金色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('597', '243', '19', '玫瑰金', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('598', '243', '19', '亮黑色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('599', '243', '19', '黑色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('600', '244', '19', '256GB', '1500.00');
INSERT INTO `verydows_goods_optional` VALUES ('601', '244', '19', '128GB', '800.00');
INSERT INTO `verydows_goods_optional` VALUES ('602', '244', '19', '32GB', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('603', '245', '16', '128G', '1800.00');
INSERT INTO `verydows_goods_optional` VALUES ('604', '245', '16', '64G', '800.00');
INSERT INTO `verydows_goods_optional` VALUES ('605', '245', '16', '16G', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('606', '246', '16', '银色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('607', '246', '16', '深空灰', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('608', '246', '16', '金色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('609', '246', '16', '玫瑰金', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('610', '247', '16', '移动版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('611', '247', '16', '全网通', '200.00');
INSERT INTO `verydows_goods_optional` VALUES ('612', '248', '3', '白色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('613', '248', '3', '黑色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('614', '249', '3', '联通', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('615', '249', '3', '电信', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('616', '249', '3', '移动', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('617', '250', '2', '苍穹灰', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('618', '250', '2', '月光银', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('619', '251', '2', '移动版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('620', '251', '2', '全网通', '200.00');
INSERT INTO `verydows_goods_optional` VALUES ('621', '252', '1', '银色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('622', '252', '1', '深空灰', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('623', '252', '1', '金色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('624', '252', '1', '玫瑰金', '50.00');
INSERT INTO `verydows_goods_optional` VALUES ('625', '253', '1', '16G', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('626', '253', '1', '128G', '1700.00');
INSERT INTO `verydows_goods_optional` VALUES ('627', '253', '1', '64G', '700.00');
INSERT INTO `verydows_goods_optional` VALUES ('628', '254', '21', '官方标配', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('629', '254', '21', '套餐一', '100.00');
INSERT INTO `verydows_goods_optional` VALUES ('630', '254', '21', '套餐二', '200.00');
INSERT INTO `verydows_goods_optional` VALUES ('631', '254', '21', '套餐三', '300.00');
INSERT INTO `verydows_goods_optional` VALUES ('632', '255', '17', '专业版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('633', '255', '17', '中文版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('634', '256', '8', '银色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('635', '256', '8', '灰色', '100.00');
INSERT INTO `verydows_goods_optional` VALUES ('636', '256', '8', '金色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('637', '257', '8', '128G WiFi版', '1500.00');
INSERT INTO `verydows_goods_optional` VALUES ('638', '257', '8', '16G WiFi版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('639', '257', '8', '64G WiFi版', '700.00');
INSERT INTO `verydows_goods_optional` VALUES ('640', '258', '4', '256G', '1333.00');
INSERT INTO `verydows_goods_optional` VALUES ('641', '258', '4', '128G', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('642', '259', '4', '256G', '1333.00');
INSERT INTO `verydows_goods_optional` VALUES ('643', '259', '4', '128G', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('644', '260', '21', '官方标配', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('645', '260', '21', '套餐一', '100.00');
INSERT INTO `verydows_goods_optional` VALUES ('646', '260', '21', '套餐二', '200.00');
INSERT INTO `verydows_goods_optional` VALUES ('647', '260', '21', '套餐三', '300.00');
INSERT INTO `verydows_goods_optional` VALUES ('648', '261', '17', '专业版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('649', '261', '17', '中文版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('650', '262', '8', '银色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('651', '262', '8', '灰色', '100.00');
INSERT INTO `verydows_goods_optional` VALUES ('652', '262', '8', '金色', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('653', '263', '8', '128G WiFi版', '1500.00');
INSERT INTO `verydows_goods_optional` VALUES ('654', '263', '8', '16G WiFi版', '0.00');
INSERT INTO `verydows_goods_optional` VALUES ('655', '263', '8', '64G WiFi版', '700.00');

-- ----------------------------
-- Table structure for `verydows_goods_optional_type`
-- ----------------------------
DROP TABLE IF EXISTS `verydows_goods_optional_type`;
CREATE TABLE `verydows_goods_optional_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of verydows_goods_optional_type
-- ----------------------------
INSERT INTO `verydows_goods_optional_type` VALUES ('239', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('240', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('241', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('242', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('243', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('244', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('245', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('246', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('247', '网络类型');
INSERT INTO `verydows_goods_optional_type` VALUES ('248', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('249', '网络类型');
INSERT INTO `verydows_goods_optional_type` VALUES ('250', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('251', '网络类型');
INSERT INTO `verydows_goods_optional_type` VALUES ('252', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('253', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('254', '版本');
INSERT INTO `verydows_goods_optional_type` VALUES ('255', '版本');
INSERT INTO `verydows_goods_optional_type` VALUES ('256', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('257', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('258', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('259', '机身存储');
INSERT INTO `verydows_goods_optional_type` VALUES ('260', '版本');
INSERT INTO `verydows_goods_optional_type` VALUES ('261', '版本');
INSERT INTO `verydows_goods_optional_type` VALUES ('262', '颜色');
INSERT INTO `verydows_goods_optional_type` VALUES ('263', '机身存储');

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
INSERT INTO `verydows_visitor_stats` VALUES ('vsu9n975eq4eut295jot14acm3', '127.0.0.1', '1503038739', '1', '', '1', '0', '');
INSERT INTO `verydows_visitor_stats` VALUES ('47261a37cf302a8acf6820e6099969b4', '114.251.205.2', '1502985600', '2', '127.0.0.1', '3', '1', '北京市');
