/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : fcsdas

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-10-09 22:23:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_brandclothesinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_brandclothesinfo`;
CREATE TABLE `tb_brandclothesinfo` (
  `clothes_id` int(11) NOT NULL,
  `clothes_design` int(11) DEFAULT NULL,
  `clothes_style` int(11) DEFAULT NULL,
  `clothes_brand` int(11) DEFAULT NULL,
  `clothes_elements` int(11) DEFAULT NULL,
  `clothes_weave` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL,
  `clothes_num` int(11) NOT NULL,
  `clothes_name` varchar(50) NOT NULL,
  `clothes_des` varchar(255) NOT NULL,
  `clothes_category` int(11) NOT NULL,
  `clothes_color` varchar(10) NOT NULL,
  `clothes_year` varchar(10) NOT NULL,
  `clothes_season` varchar(10) NOT NULL,
  `clothes_imgOne` varchar(50) NOT NULL,
  `clothes_imgTwo` varchar(50) NOT NULL,
  `clothes_imgThree` varchar(50) NOT NULL,
  `clothes_imgFour` varchar(50) NOT NULL,
  `clothes_likeNum` int(11) NOT NULL,
  `clothes_saveNum` int(11) NOT NULL,
  `clothes_addTime` varchar(50) NOT NULL,
  `clothes_updateTime` varchar(50) NOT NULL,
  `clothes_status` int(11) NOT NULL,
  PRIMARY KEY (`clothes_id`),
  KEY `clothes_design` (`clothes_design`),
  KEY `clothes_style` (`clothes_style`),
  KEY `clothes_brand` (`clothes_brand`),
  KEY `clothes_elements` (`clothes_elements`),
  KEY `clothes_weave` (`clothes_weave`),
  CONSTRAINT `tb_brandclothesinfo_ibfk_1` FOREIGN KEY (`clothes_design`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `tb_brandclothesinfo_ibfk_2` FOREIGN KEY (`clothes_style`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `tb_brandclothesinfo_ibfk_3` FOREIGN KEY (`clothes_brand`) REFERENCES `tb_clothesbrandinfo` (`clothesBrand_id`),
  CONSTRAINT `tb_brandclothesinfo_ibfk_4` FOREIGN KEY (`clothes_elements`) REFERENCES `tb_fabriccomposition` (`fabricComposition_id`),
  CONSTRAINT `tb_brandclothesinfo_ibfk_5` FOREIGN KEY (`clothes_weave`) REFERENCES `tb_weave` (`weave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_brandclothesinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_buyneed
-- ----------------------------
DROP TABLE IF EXISTS `tb_buyneed`;
CREATE TABLE `tb_buyneed` (
  `buyneed_id` int(11) NOT NULL,
  `designerWorks_id` int(11) NOT NULL,
  `designer_id` int(11) NOT NULL,
  `dictionaryCategory_id` int(11) NOT NULL,
  `Buyneed_message` varchar(50) NOT NULL,
  `Buyneed_name` varchar(50) NOT NULL,
  `Buyneed_phone` varchar(50) NOT NULL,
  `Buyneed_datetime` varchar(50) NOT NULL,
  PRIMARY KEY (`buyneed_id`),
  KEY `designerWorks_id` (`designerWorks_id`),
  KEY `designer_id` (`designer_id`),
  KEY `dictionaryCategory_id` (`dictionaryCategory_id`),
  CONSTRAINT `tb_buyneed_ibfk_1` FOREIGN KEY (`designerWorks_id`) REFERENCES `tb_designerworks` (`designerWorks_id`),
  CONSTRAINT `tb_buyneed_ibfk_2` FOREIGN KEY (`designer_id`) REFERENCES `tb_designerinfo` (`designer_id`),
  CONSTRAINT `tb_buyneed_ibfk_3` FOREIGN KEY (`dictionaryCategory_id`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_buyneed
-- ----------------------------

-- ----------------------------
-- Table structure for tb_clothcategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_clothcategory`;
CREATE TABLE `tb_clothcategory` (
  `clothCategory_id` int(11) NOT NULL,
  `clothCategory_number` int(11) NOT NULL,
  `clothCategory_supCategory` varchar(50) DEFAULT NULL,
  `clothCategory_categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`clothCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_clothcategory
-- ----------------------------

-- ----------------------------
-- Table structure for tb_clothesbrandinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_clothesbrandinfo`;
CREATE TABLE `tb_clothesbrandinfo` (
  `clothesBrand_id` int(11) NOT NULL,
  `clothesBrand_name` varchar(50) NOT NULL,
  `clothesBrand_des` varchar(255) NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  PRIMARY KEY (`clothesBrand_id`),
  KEY `enterprise_id` (`enterprise_id`),
  CONSTRAINT `tb_clothesbrandinfo_ibfk_1` FOREIGN KEY (`enterprise_id`) REFERENCES `tb_enterpriseinfo` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_clothesbrandinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_collection
-- ----------------------------
DROP TABLE IF EXISTS `tb_collection`;
CREATE TABLE `tb_collection` (
  `collection_id` int(11) NOT NULL,
  `collection_userId` int(11) DEFAULT NULL,
  `collection_objectId` int(11) NOT NULL,
  `collection_type` int(11) NOT NULL,
  `collection_datetime` varchar(50) NOT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `collection_userId` (`collection_userId`),
  KEY `collection_objectId` (`collection_objectId`),
  CONSTRAINT `tb_collection_ibfk_1` FOREIGN KEY (`collection_userId`) REFERENCES `tb_useraccount` (`user_id`),
  CONSTRAINT `tb_collection_ibfk_2` FOREIGN KEY (`collection_objectId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_collection
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL,
  `commentn_objectId` int(11) DEFAULT NULL,
  `comment_content` text NOT NULL,
  `comment_type` varchar(100) NOT NULL,
  `comment_datetime` varchar(50) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `commentn_objectId` (`commentn_objectId`),
  CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`commentn_objectId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_concern
-- ----------------------------
DROP TABLE IF EXISTS `tb_concern`;
CREATE TABLE `tb_concern` (
  `concern_id` int(11) NOT NULL,
  `concern_objectId` int(11) DEFAULT NULL,
  `concern_userId` int(11) DEFAULT NULL,
  `collection_datetime` varchar(50) NOT NULL,
  PRIMARY KEY (`concern_id`),
  KEY `concern_userId` (`concern_userId`),
  KEY `concern_objectId` (`concern_objectId`),
  CONSTRAINT `tb_concern_ibfk_1` FOREIGN KEY (`concern_userId`) REFERENCES `tb_useraccount` (`user_id`),
  CONSTRAINT `tb_concern_ibfk_2` FOREIGN KEY (`concern_objectId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_concern
-- ----------------------------

-- ----------------------------
-- Table structure for tb_designerflag
-- ----------------------------
DROP TABLE IF EXISTS `tb_designerflag`;
CREATE TABLE `tb_designerflag` (
  `tb_designerFlag` int(11) NOT NULL,
  `designerFlag_designerId` int(11) NOT NULL,
  `designerFlag` int(11) NOT NULL,
  `designerFlag_likeCount` int(11) NOT NULL,
  PRIMARY KEY (`tb_designerFlag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_designerflag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_designerinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_designerinfo`;
CREATE TABLE `tb_designerinfo` (
  `designer_id` int(11) NOT NULL,
  `designer_accountId` int(11) DEFAULT NULL,
  `designer_educat` int(11) DEFAULT NULL,
  `designer_imgUrl` varchar(255) NOT NULL,
  `designer_name` varchar(50) DEFAULT NULL,
  `designer_gender` int(11) DEFAULT NULL,
  `designer_birthday` varchar(50) DEFAULT NULL,
  `designer_phone` varchar(50) NOT NULL,
  `designer_email` varchar(50) NOT NULL,
  `designer_experience` text,
  `designer_profession` varchar(255) DEFAULT NULL,
  `designer_school` varchar(255) NOT NULL,
  `designer_changeTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`designer_id`),
  KEY `designer_accountId` (`designer_accountId`),
  KEY `designer_educat` (`designer_educat`),
  CONSTRAINT `tb_designerinfo_ibfk_1` FOREIGN KEY (`designer_accountId`) REFERENCES `tb_useraccount` (`user_id`),
  CONSTRAINT `tb_designerinfo_ibfk_2` FOREIGN KEY (`designer_educat`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_designerinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_designerworks
-- ----------------------------
DROP TABLE IF EXISTS `tb_designerworks`;
CREATE TABLE `tb_designerworks` (
  `designerWorks_id` int(11) NOT NULL,
  `designerWorks_designeIid` int(11) NOT NULL,
  `designerWorks_effectImgUrl` varchar(255) NOT NULL,
  `designerWorks_styleImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_technologyImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_fabricImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_finishImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_othersImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_workName` varchar(255) NOT NULL,
  `designerWorks_type` int(11) NOT NULL,
  `designerWorks_style` int(11) NOT NULL,
  `designerWorks_album` int(11) NOT NULL,
  `designerWorks_fabric` int(11) NOT NULL,
  `designerWorks_model` int(11) NOT NULL,
  `designerWorks_desc` varchar(255) NOT NULL,
  `designerWorks_likeCount` int(11) NOT NULL,
  `designerWorks_collection` int(11) NOT NULL,
  `designerWorks_publishTime` varchar(255) NOT NULL,
  `designerWorks_changeTime` varchar(255) DEFAULT NULL,
  `designerWorks_status` int(11) NOT NULL,
  PRIMARY KEY (`designerWorks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_designerworks
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dictionarycategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionarycategory`;
CREATE TABLE `tb_dictionarycategory` (
  `dictionaryCategory_id` int(11) NOT NULL,
  `dictionaryCategory_number` int(11) NOT NULL,
  `dictionaryCategory_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dictionaryCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dictionarycategory
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dictionarydata
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionarydata`;
CREATE TABLE `tb_dictionarydata` (
  `dictionaryData_id` int(11) NOT NULL,
  `dictionaryData_categoryNumber` int(11) NOT NULL,
  `dictionaryData_dataNumber` int(11) NOT NULL,
  `Column_dictionaryData_Value4` varchar(0) NOT NULL,
  PRIMARY KEY (`dictionaryData_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dictionarydata
-- ----------------------------

-- ----------------------------
-- Table structure for tb_enterpriseinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_enterpriseinfo`;
CREATE TABLE `tb_enterpriseinfo` (
  `enterprise_id` int(11) NOT NULL,
  `enterprise_name` varchar(50) NOT NULL,
  `enterprise_des` varchar(50) NOT NULL,
  `enterprise_addr` varchar(255) NOT NULL,
  `enterprise_phone` varchar(20) NOT NULL,
  `enterprise_fax` int(11) NOT NULL,
  `enterprise_contacts` varchar(50) NOT NULL,
  `enterprise_contactsphone` varchar(50) NOT NULL,
  `enterprise_net` varchar(50) NOT NULL,
  `enterprise_logo` varchar(50) NOT NULL,
  `enterprise_updateTime` varchar(50) NOT NULL,
  PRIMARY KEY (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_enterpriseinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_enterprise_clothescategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_enterprise_clothescategory`;
CREATE TABLE `tb_enterprise_clothescategory` (
  `ec_id` int(11) NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `clothesCategory_num` int(11) NOT NULL,
  PRIMARY KEY (`ec_id`),
  KEY `enterprise_id` (`enterprise_id`),
  CONSTRAINT `tb_enterprise_clothescategory_ibfk_1` FOREIGN KEY (`enterprise_id`) REFERENCES `tb_enterpriseinfo` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_enterprise_clothescategory
-- ----------------------------

-- ----------------------------
-- Table structure for tb_fabriccomposition
-- ----------------------------
DROP TABLE IF EXISTS `tb_fabriccomposition`;
CREATE TABLE `tb_fabriccomposition` (
  `fabricComposition_id` int(11) NOT NULL,
  `fabricComposition_number` int(11) NOT NULL,
  `fabricComposition_supCategory` varchar(50) NOT NULL,
  `fabricComposition_categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`fabricComposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fabriccomposition
-- ----------------------------

-- ----------------------------
-- Table structure for tb_fabricinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_fabricinfo`;
CREATE TABLE `tb_fabricinfo` (
  `fabric_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `fabric_Composition_id` int(11) DEFAULT NULL,
  `fabricName` varchar(50) NOT NULL,
  `fabric_number` varchar(50) NOT NULL,
  `fabric_orderNum` int(11) NOT NULL,
  `fabric_haveSpot` int(11) NOT NULL,
  `fabric_quantityNum` int(11) NOT NULL,
  `fabric_price` float NOT NULL,
  `fabric_imgNoe` varchar(50) NOT NULL,
  `fabric_imgTwo` varchar(50) NOT NULL,
  `fabric_imgTree` varchar(50) NOT NULL,
  `fabric_imgFour` varchar(50) NOT NULL,
  `weave_id` int(11) NOT NULL,
  `dictionaryData_id` int(11) NOT NULL,
  `makeProcess` int(11) DEFAULT NULL,
  `fabric_haveEasticity` int(11) NOT NULL,
  `fabric_tcxColor` varchar(50) NOT NULL,
  `fabric_tpxColor` varchar(50) NOT NULL,
  `fabric_like` int(11) NOT NULL,
  `fabric_collection` int(11) NOT NULL,
  `fabric_addTime` varchar(50) NOT NULL,
  `fabric_updateTime` varchar(50) NOT NULL,
  `fabric_status` int(11) NOT NULL,
  PRIMARY KEY (`fabric_id`),
  KEY `provider_id` (`provider_id`),
  KEY `fabric_Composition_id` (`fabric_Composition_id`),
  KEY `weave_id` (`weave_id`),
  KEY `dictionaryData_id` (`dictionaryData_id`),
  KEY `makeProcess` (`makeProcess`),
  CONSTRAINT `tb_fabricinfo_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `tb_providerinfo` (`provider_id`),
  CONSTRAINT `tb_fabricinfo_ibfk_2` FOREIGN KEY (`fabric_Composition_id`) REFERENCES `tb_fabriccomposition` (`fabricComposition_id`),
  CONSTRAINT `tb_fabricinfo_ibfk_3` FOREIGN KEY (`weave_id`) REFERENCES `tb_weave` (`weave_id`),
  CONSTRAINT `tb_fabricinfo_ibfk_4` FOREIGN KEY (`dictionaryData_id`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `tb_fabricinfo_ibfk_5` FOREIGN KEY (`makeProcess`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fabricinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_information
-- ----------------------------
DROP TABLE IF EXISTS `tb_information`;
CREATE TABLE `tb_information` (
  `information_id` int(11) NOT NULL,
  `information_type` int(11) DEFAULT NULL,
  `information_title` varchar(50) NOT NULL,
  `Information_issueDatetime` varchar(50) NOT NULL,
  `information_source` varchar(50) NOT NULL,
  `information_content` text NOT NULL,
  `information_modifyDatetime` varchar(50) NOT NULL,
  `information_status` varchar(50) NOT NULL,
  PRIMARY KEY (`information_id`),
  KEY `information_type` (`information_type`),
  CONSTRAINT `tb_information_ibfk_1` FOREIGN KEY (`information_type`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_information
-- ----------------------------

-- ----------------------------
-- Table structure for tb_providerinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_providerinfo`;
CREATE TABLE `tb_providerinfo` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(50) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `annualProduction` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `contactsName` varchar(50) NOT NULL,
  `contactsPhone` varchar(50) NOT NULL,
  `storePhotos` varchar(255) NOT NULL,
  `modifyDatetime` datetime NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_providerinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_provideroperate
-- ----------------------------
DROP TABLE IF EXISTS `tb_provideroperate`;
CREATE TABLE `tb_provideroperate` (
  `proOper_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `fabricProperty` int(11) NOT NULL,
  `propertyValue` int(11) NOT NULL,
  PRIMARY KEY (`proOper_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `tb_provideroperate_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `tb_providerinfo` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_provideroperate
-- ----------------------------

-- ----------------------------
-- Table structure for tb_special
-- ----------------------------
DROP TABLE IF EXISTS `tb_special`;
CREATE TABLE `tb_special` (
  `special_id` int(11) NOT NULL,
  `designer_id` int(11) DEFAULT NULL,
  `special_name` varchar(50) NOT NULL,
  `special_status` int(11) NOT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_special
-- ----------------------------

-- ----------------------------
-- Table structure for tb_useraccount
-- ----------------------------
DROP TABLE IF EXISTS `tb_useraccount`;
CREATE TABLE `tb_useraccount` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_actor` int(11) NOT NULL,
  `user_regDatetime` varchar(50) NOT NULL,
  `user_status` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_useraccount
-- ----------------------------

-- ----------------------------
-- Table structure for tb_weave
-- ----------------------------
DROP TABLE IF EXISTS `tb_weave`;
CREATE TABLE `tb_weave` (
  `weave_id` int(11) NOT NULL,
  `weave_number` int(11) NOT NULL,
  `weave_supCategory` varchar(50) NOT NULL,
  `weave_categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`weave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_weave
-- ----------------------------
