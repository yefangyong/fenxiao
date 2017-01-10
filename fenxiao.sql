-- MySQL dump 10.13  Distrib 5.5.40, for Win32 (x86)
--
-- Host: localhost    Database: fenxiao
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Current Database: `fenxiao`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fenxiao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fenxiao`;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `byid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `money` double(7,2) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,10,34,33,2.31),(2,10,34,32,6.93),(3,12,34,33,2.31),(4,12,34,32,6.93),(5,15,34,33,11.65),(6,15,34,32,6.99),(7,15,34,31,2.33);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `goods_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) NOT NULL,
  `price` double(7,2) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,2,1,'白百合 清香宜人',1,23.10),(2,3,1,'白百合 清香宜人',1,23.10),(3,5,1,'白百合 清香宜人',1,23.10),(4,6,1,'白百合 清香宜人',1,23.10),(5,7,1,'白百合 清香宜人',1,23.10),(6,8,1,'白百合 清香宜人',1,23.10),(7,9,2,'红玫瑰 热烈奔放',1,23.20),(8,10,1,'白百合 清香宜人',1,23.10),(9,11,4,'狗尾巴 淡泊名利',1,23.40),(10,12,1,'白百合 清香宜人',1,23.10),(11,13,1,'白百合 清香宜人',1,23.10),(12,14,3,'黄牡丹 雍容华贵',1,23.30),(13,15,3,'黄牡丹 雍容华贵',1,23.30);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2017_01_10_035120_create_table_items',1),('2017_01_10_035134_create_table_oreders',1),('2017_01_10_060648_create_table_fees',2),('2017_01_10_063857_create_table_users',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordsn` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `openid` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `xm` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `tel` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `money` double(7,2) NOT NULL,
  `ispay` tinyint(4) NOT NULL DEFAULT '0',
  `ordtime` int(11) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017011060127',0,'','叶凡勇','蚌埠市','13053112897',23.10,0,1484024585),(2,'2017011072440',0,'','叶凡勇','蚌埠市','13053112897',23.10,0,1484025789),(3,'2017011046198',0,'','叶凡勇','蚌埠市','13053112897',23.10,0,1484026194),(4,'2017011015926',0,'','叶凡勇','蚌埠市','13053112897',0.00,0,1484026240),(5,'2017011022204',0,'','456','123','23465',23.10,0,1484026299),(6,'2017011045465',0,'','456','123','23465',23.10,0,1484026318),(7,'2017011099378',0,'','456','123','23465',23.10,0,1484026508),(8,'2017011096614',0,'','456','123','23465',23.10,0,1484026587),(9,'2017011086108',0,'','叶方勇','蚌埠医学院','13053112897',23.20,1,1484027592),(10,'2017011087188',34,'','胡家园','安徽财经大学','132324546',23.10,1,1484031596),(11,'2017011028215',33,'','213','12','3435',23.40,1,1484032363),(12,'2017011023812',34,'','wewew','dfsd','safdas',23.10,1,1484032424),(13,'2017011081206',34,'','asd','sd','wewe',23.10,1,1484032589),(14,'2017011086833',34,'','sd','dfs','we',23.30,1,1484032681),(15,'2017011062845',34,'','叶方勇','蚌埠市','13053112897',23.30,1,1484032841);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtime` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `p1` int(10) unsigned NOT NULL,
  `p2` int(10) unsigned NOT NULL,
  `p3` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `users_openid_unique` (`openid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (34,'sadas','asdaswva',2147483647,1,33,32,31);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 15:24:03
