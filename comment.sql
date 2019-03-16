-- MySQL dump 10.13  Distrib 5.5.37, for Win64 (x86)
--
-- Host: localhost    Database: comment
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `img_file_name` varchar(100) DEFAULT NULL COMMENT '图片文件名',
  `link` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,'暑假5折','1495353501938_ad_1.png','http://www.imooc.com/wap/index',1),(2,'特价出国','1495353568008_ad_2.png','http://www.imooc.com/wap/index',5),(3,'亮亮车','1495353623949_ad_3.png','http://www.imooc.com/wap/index',4),(4,'学钢琴','1495353664627_ad_4.png','http://www.imooc.com/wap/index',3),(5,'电影','1495353700766_ad_5.png','http://www.imooc.com/wap/index',2),(6,'旅游热线','1495353735839_ad_6.png','http://www.imooc.com/wap/index',1);
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_file_name` varchar(100) DEFAULT NULL COMMENT '图片文件名',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '副标题',
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格(单位：元)',
  `distance` int(11) DEFAULT NULL COMMENT '距离(单位：米)',
  `number` int(11) DEFAULT NULL COMMENT '已售数量',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `city` varchar(16) DEFAULT NULL COMMENT '城市',
  `category` varchar(16) DEFAULT NULL COMMENT '类别',
  `star_total_num` int(11) DEFAULT NULL COMMENT '评论星星总数',
  `comment_total_num` int(11) DEFAULT NULL COMMENT '评论总次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'1495354718489_business_1.png','汉堡大大','叫我汉堡大大，还你多彩口味',28.00,120,2,'1、当图片在app上不显示时，请查看system.properties里的访问路径，保存路径，如果看懂了视频：\r\n应该知道这个配置文件里的参数怎么改、我给你们的图片放在哪就可以了。<br/>2、后台管理用户名密码：admin/admin<br/>3、如果出现“没有权限访问请求资源，请切换账户后重试！”，请不要着急，先把applicationContext-web.xml中关于AuthInterceptor拦截器部分注释掉，等把拦截器听懂再来看看怎么回事！','北京','meishi',14,3),(2,'1538801862432_timg.jpg','lulif','java',11.00,2,1,'哈哈','北京','jingdian',10,2),(3,'1538926996661_20170307213304787.png','lele','lover',1314.00,520,0,'XXX','北京','jingdian',0,0),(4,'1552019326989_屏幕截图(31).png','asdadad','fadsfaf',11.00,123,0,'21','北京','jingdian',0,0);
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orders_id` int(11) DEFAULT NULL COMMENT '用户名',
  `comment` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `star` int(1) DEFAULT NULL COMMENT '星级评分',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Normal_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,4,'加油欧！',5,'2018-10-06 22:10:12'),(3,2,'好好吃',5,'2018-10-06 22:21:42'),(4,3,'ok的',3,'2018-10-06 23:15:20'),(5,6,'版本',4,'2018-10-07 10:14:47'),(6,8,'very good',5,'2019-02-28 16:06:37');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dic`
--

DROP TABLE IF EXISTS `dic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dic` (
  `type` varchar(16) NOT NULL,
  `code` varchar(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`type`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dic`
--

LOCK TABLES `dic` WRITE;
/*!40000 ALTER TABLE `dic` DISABLE KEYS */;
INSERT INTO `dic` VALUES ('category','jiehun','结婚',4),('category','jingdian','景点',1),('category','ktv','KTV',2),('category','meishi','美食',3),('city','上海','上海',2),('city','北京','北京',1),('city','广州','广州',3),('httpMethod','DELETE','DELETE',2),('httpMethod','GET','GET',4),('httpMethod','POST','POST',1),('httpMethod','PUT','PUT',3);
/*!40000 ALTER TABLE `dic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` bigint(13) DEFAULT NULL COMMENT '手机号',
  `name` varchar(16) DEFAULT NULL COMMENT '用户名',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_unique` (`phone`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,15658110392,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_id` int(11) DEFAULT NULL COMMENT '商户主键',
  `member_id` int(11) DEFAULT NULL COMMENT '会员主键',
  `num` int(11) DEFAULT NULL COMMENT '消费人数',
  `comment_state` int(1) DEFAULT NULL COMMENT '评论状态 -- 0：未评论 2：已评论',
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格(消费金额)',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (6,1,1,1,2,360.00,'2018-10-06 23:19:48'),(7,1,1,1,0,371.00,'2018-10-07 00:01:09'),(8,2,1,1,2,733.00,'2018-10-07 00:01:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_action`
--

DROP TABLE IF EXISTS `sys_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '动作名称',
  `url` varchar(200) DEFAULT NULL COMMENT '动作地址',
  `menu_id` int(11) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='系统表-操作表，权限拦截用，存放系统里全部动作。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action`
--

LOCK TABLES `sys_action` WRITE;
/*!40000 ALTER TABLE `sys_action` DISABLE KEYS */;
INSERT INTO `sys_action` VALUES (1,'浏览','/auth',2,''),(2,'浏览用户','/users',2,''),(3,'维护用户','/users/.{1,}',2,''),(4,'浏览用户组','/groups',2,''),(5,'维护用户组','/groups/.{1,}',2,''),(6,'分配菜单','/groups/.{1,}/menus',2,''),(7,'浏览菜单','/menus',2,''),(8,'维护菜单','/menus/.{1,}',2,''),(9,'菜单排序','/menus/.{1,}/.{1,}/.{1,}',2,''),(10,'浏览动作','/actions',2,''),(11,'维护动作','/actions/.{1,}',2,''),(12,'浏览','/ad',4,''),(13,'查询','/ad/search',4,''),(14,'删除','/ad/remove',4,''),(15,'新增页初始化','/ad/addInit',4,''),(16,'新增','/ad/add',4,''),(17,'修改页初始化','/ad/modifyInit',4,''),(18,'修改','/ad/modify',4,''),(19,'浏览','/businesses',5,'GET'),(20,'删除','/businesses/.{1,}',5,'DELETE'),(21,'新增页初始化','/businesses/addPage',5,'GET'),(22,'新增','/businesses',5,'POST'),(23,'修改页初始化','/businesses/.{1,}',5,'GET'),(24,'修改','/businesses/.{1,}',5,'PUT'),(25,'浏览','/orderReport',9,''),(26,'统计','/orderReport/count',9,'GET');
/*!40000 ALTER TABLE `sys_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group`
--

LOCK TABLES `sys_group` WRITE;
/*!40000 ALTER TABLE `sys_group` DISABLE KEYS */;
INSERT INTO `sys_group` VALUES (1,'系统管理员'),(2,'管理'),(3,'业务');
/*!40000 ALTER TABLE `sys_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group_action`
--

DROP TABLE IF EXISTS `sys_group_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group_action`
--

LOCK TABLES `sys_group_action` WRITE;
/*!40000 ALTER TABLE `sys_group_action` DISABLE KEYS */;
INSERT INTO `sys_group_action` VALUES (131,1,9),(132,1,6),(133,1,1),(134,1,7),(135,1,10),(136,1,2),(137,1,4),(138,1,8),(139,1,11),(140,1,3),(141,1,5),(142,1,13),(143,1,12),(144,1,14),(145,1,16),(146,1,15),(147,1,18),(148,1,17),(149,1,19),(150,1,20),(151,1,22),(152,1,21),(153,1,24),(154,1,23),(155,1,25),(156,1,26);
/*!40000 ALTER TABLE `sys_group_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group_menu`
--

DROP TABLE IF EXISTS `sys_group_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group_menu`
--

LOCK TABLES `sys_group_menu` WRITE;
/*!40000 ALTER TABLE `sys_group_menu` DISABLE KEYS */;
INSERT INTO `sys_group_menu` VALUES (46,1,1),(47,1,2),(48,1,3),(49,1,4),(50,1,5),(51,1,6),(52,1,7),(53,1,8),(54,1,9);
/*!40000 ALTER TABLE `sys_group_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_num` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理','',0,2),(2,'权限管理','/auth',1,1),(3,'内容管理','',0,4),(4,'广告管理','/ad',3,1),(5,'商户管理','/businesses',3,2),(6,'评论查询','/comments',3,3),(7,'订单查询','/orders',3,4),(8,'统计报表','',0,5),(9,'订单统计','/orderReport',8,1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_param`
--

DROP TABLE IF EXISTS `sys_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_param` (
  `param_key` varchar(20) DEFAULT NULL,
  `param_value` datetime DEFAULT NULL,
  `param_desc` varchar(200) DEFAULT NULL,
  UNIQUE KEY `Unique_key` (`param_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_param`
--

LOCK TABLES `sys_param` WRITE;
/*!40000 ALTER TABLE `sys_param` DISABLE KEYS */;
INSERT INTO `sys_param` VALUES ('last_sync_star_time','2019-03-10 09:45:01','最后一次同步星星数时间');
/*!40000 ALTER TABLE `sys_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `ch_name` varchar(32) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员',1),(2,'zhangsan','01d7f40760960e7bd9443513f22ab9af','张三',2),(3,'lisi','dc3a8f1670d65bea69b7b65048a0ac40','李四',3),(4,'lulif','0ed68c3e4ab14886133c47643b46a67f','lulif',1);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-16 17:16:19
