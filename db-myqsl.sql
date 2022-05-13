-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: node
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `CatID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Điện thoại'),(2,'Laptop'),(3,'Tablet'),(4,'Phụ kiện'),(5,'Đồng hồ thông minh'),(6,'Trang sức'),(7,'khác');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ProID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) unsigned NOT NULL,
  `Quantity` int(11) NOT NULL,
  `imgs` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ProID`),
  KEY `CatID` (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 11','Màn hình 6.1\", Chip Apple A13 Bionic','',13790000,1,6,'1650870648719.jpg'),(2,'iPhone 13 Pro Max','Màn hình 6.7\", Chip Apple A15 Bionic','',33490000,1,6,'1650870796375.jpg'),(3,'iPhone 13 Pro','Màn hình 6.7\", Chip Apple A15 Bionic','',29490000,1,6,'1650870834621.jpg'),(4,'iPhone 12 Pro Max','Màn hình 6.7\", Chip Apple A14 Bionic','',28990000,1,2,'1650870867965.jpg'),(5,'iPhone 12 Pro','Màn hình 6.1\", Chip Apple A14 Bionic','',24590000,1,6,'1650870917256.jpg'),(6,'iPhone 13','Màn hình 6.1\", Chip Apple A15 Bionic','',23690000,1,4,'1650870951613.jpg'),(7,'iPhone 12 mini','Màn hình 5.4\", Chip Apple A14 Bionic','',18313123,1,2,'1650870975554.jpg'),(8,'iPhone 13 mini','Màn hình 5.4\", Chip Apple A15 Bionic','',15756756,1,6,'1650871017580.jpg'),(9,'iPhone SE (2022)','Màn hình 4.7\", Chip Apple A15 Bionic','',13333333,1,6,'1650871040204.jpg'),(10,'Samsung Galaxy Z Fold3 5G','Màn hình Chính 7.6\" & Phụ 6.2\", Chip Snapdragon 888','',33334545,1,6,'1650871148956.jpg'),(11,'Samsung Galaxy S22 Ultra 5G','Màn hình 6.8\", Chip Snapdragon 8 Gen 1 8 nhân','',31313234,1,6,'1650871208523.jpg'),(12,'Samsung Galaxy S22+ 5G','Màn hình 6.6\", Chip Snapdragon 8 Gen 1 8 nhân','',45345355,1,4,'1650871269388.jpg'),(13,'MacBook Air M1 2020 7-core ','RAM 16 GB SSD 256 GB','',25,2,14,'1650872176996.jpg'),(14,'Macbook Pro M1 2020','16GB RAM SSB 512','',30000000,2,6,'1650872350939.jpg'),(15,'MacBook Pro 14 M1 Max','RAM 32 GB SSD 1 TB','',80000000,2,6,'1650876394991.jpg'),(16,'MacBook Pro 14 M1 Pro 2021','RAM 64 SDD 1TB','',21121231,2,3,'1650909152706.jpg'),(17,'MacBook Pro 14 M1 Pro 2021/16','RAM 16 GB SSD 1 TB','',132,2,0,'1650909152706.jpg'),(18,'MacBook Pro 14 M1 Pro 2021/16','RAM 16 GB SSD 1 TB','',12,0,0,'1650909152706.jpg'),(19,'iPad Pro M1 12.9 inch 5G','RAM 16 GB SSD 256 GB','',1231231313,3,6,'1650911773843.jpg'),(20,'Samsung Galaxy Tab S8+','12.4\"Super AMOLED','',10000000,3,2,'1650911902448.jpg'),(21,'iPad Pro M1 11 inch WiFi','Chip A16 bitona','',2147483647,3,12,'1650911964716.jpg'),(25,'Apple Watch S6 44mm viền nhôm dây cao su','Có chống nước Đo nồng độ oxy (SpO2)','',1,5,12,'file_1652446085042.jpg'),(22,'Apple Watch S6 44mm viền nhôm dây silicone','Có chống nước Đo nồng độ oxy (SpO2)','',1313131313,5,12,'file_1652446047844.jpg'),(23,'Apple Watch S6 44mm viền nhôm dây cao su','Có chống nước Đo nồng độ oxy (SpO2)','',1,5,12,'file_1652446085042.jpg'),(24,'Apple Watch S6 44mm viền nhôm dây silicone','Có chống nước Đo nồng độ oxy (SpO2)','',1313131313,5,12,'file_1652446047844.jpg'),(26,'Apple Watch S6 44mm viền nhôm dây silicone','Có chống nước Đo nồng độ oxy (SpO2)','',444,5,6,'file_1652446269237.jpg'),(27,'Apple Watch S6 44mm viền nhôm dây silicone','Có chống nước Đo nồng độ oxy (SpO2)','',1313131313,5,12,'file_1652446047844.jpg'),(28,'Apple Watch S6 44mm viền nhôm dây cao su','Có chống nước Đo nồng độ oxy (SpO2)','',1,5,12,'file_1652446085042.jpg'),(29,'Apple Watch S6 44mm viền nhôm dây silicone','Có chống nước Đo nồng độ oxy (SpO2)','',1313131313,5,12,'file_1652446047844.jpg'),(30,'Apple Watch S6 44mm viền nhôm dây cao su','Có chống nước Đo nồng độ oxy (SpO2)','',1,5,12,'file_1652446085042.jpg'),(31,'Samsung Galaxy S22 Ultra 5G','RAM 16 GB SSD 256 GB','',3232323,3,6,'file_1652446365335.jpg'),(32,'iPad Pro M1 12.9 inch 5G','RAM 16 GB SSD 256 GB','',1231231313,3,6,'1650911773843.jpg'),(33,'Samsung Galaxy Tab S8+','12.4\"Super AMOLED','',10000000,3,2,'1650911902448.jpg'),(34,'iPad Pro M1 11 inch WiFi','Chip A16 bitona','',2147483647,3,12,'1650911964716.jpg'),(35,'Samsung Galaxy S22 Ultra 5G','RAM 16 GB SSD 256 GB','',3232323,3,6,'file_1652446365335.jpg'),(36,'Loa Bluetooth Mozard E8','5w','',433333,4,6,'file_1652446541576.jpg'),(37,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P000205','','',2341234,6,12,'file_1652458089477.jpg'),(38,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P000205','','',31,6,12,'file_1652458106147.jpg'),(39,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P123123','','',123132123,6,0,'file_1652458145506.jpg'),(40,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P000205','','',2341234,6,12,'file_1652458089477.jpg'),(41,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P000205','','',31,6,12,'file_1652458106147.jpg'),(42,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P123123','','',123132123,6,0,'file_1652458145506.jpg'),(43,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P000205','','',2341234,6,12,'file_1652458089477.jpg'),(44,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P000205','','',31,6,12,'file_1652458106147.jpg'),(45,'Mặt Dây Chuyền Vàng 610 18K Nữ AvaJi AVJ.P123123','','',123132123,6,0,'file_1652458145506.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrefreshtokenext`
--

DROP TABLE IF EXISTS `userrefreshtokenext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrefreshtokenext` (
  `ID` int(11) NOT NULL,
  `refreshToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rdt` datetime(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrefreshtokenext`
--

LOCK TABLES `userrefreshtokenext` WRITE;
/*!40000 ALTER TABLE `userrefreshtokenext` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrefreshtokenext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2b$08$D4TdbgtHd22nmTJkh49XguQbK2xr53aep/DlfBy61Ghu9eVXtn2Tq','phimisa','phi@gmail.com','1999-11-09',0),(33,'admin2','$2b$08$0S9kYgSB9fzwl5ygMfYqteBtTr8PNNRsUGso2Om3EK9ggRXXmfqRm','admin','lequocphi201@gmail.com','2012-12-21',1);
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

-- Dump completed on 2022-05-13 23:31:34
