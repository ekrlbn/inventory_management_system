-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `current_price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Chocolate Chip Cookies',2.99,150,1),(2,'Fruity Gummy Bears',1.49,300,2),(3,'Butter Shortbread Biscuits',3.99,100,3),(4,'Assorted Chocolates Mix',4.49,200,4),(5,'Jelly-filled Donuts',2.79,250,5),(6,'Hazelnut Crunch Biscuits',3.29,180,6),(7,'Caramel Popcorn',1.99,220,7),(8,'Vanilla Cream Sandwich Cookies',3.49,170,8),(9,'Sour Cherry Candies',2.19,280,9),(10,'Peanut Butter Cups',4.99,120,10),(11,'White Chocolate Macadamia Cookies',3.79,190,11),(12,'Fudge Brownie Bites',2.59,240,12),(13,'Ginger Snap Biscuits',3.89,160,13),(14,'Cotton Candy Bags',1.69,270,14),(15,'Almond Joy Chocolates',4.3,140,14),(16,'Lemon Shortbread Cookies',3.09,210,16),(17,'Rock Candy Sticks',2.39,260,17),(18,'Pistachio Delight Biscuits',3.69,140,18),(19,'Bubblegum Balls',1.79,290,19),(20,'Raspberry Dark Chocolate Bars',4.79,110,20),(21,'Mint Chocolate Chip Cookies',2.99,150,2),(22,'Fruity Rainbow Gummies',1.49,300,3),(23,'Cinnamon Swirl Biscuits',3.99,100,4),(24,'Decadent Chocolate Bonbons',4.49,200,6),(25,'Blueberry Glazed Donuts',2.79,250,8),(26,'Peanut Butter Bliss Biscuits',3.29,180,9),(27,'Spicy Jalapeno Popcorn',1.99,220,10),(28,'Oreo Cream Cookies',3.49,170,11),(29,'Tropical Fruit Chewy Candies',2.19,280,13),(30,'Salted Caramel Chocolate Squares',4.5,110,14),(31,'Chewy Mocha Cookies',3.79,190,15),(32,'Chocolate Hazelnut Brownie Bites',2.59,240,2),(33,'Lavender Shortbread Biscuits',3.89,160,2),(34,'Strawberry Lollipop Delight',1.69,270,4),(35,'White Chocolate Toffee Crunch',4.29,130,9),(36,'Lemon Zest Cookies',3.09,210,15),(37,'Fizzy Fruit Rock Candy',2.39,260,20),(38,'Pistachio Nut Biscuits',3.69,140,20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `p_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'2023-01-01 09:00:00'),(2,'2023-02-15 11:30:00'),(3,'2023-03-10 06:45:00'),(4,'2023-04-20 15:20:00'),(5,'2023-05-05 04:30:00'),(6,'2023-06-12 07:45:00'),(7,'2023-07-07 13:00:00'),(8,'2023-08-18 18:15:00'),(9,'2023-09-08 08:30:00'),(10,'2023-10-25 11:45:00'),(11,'2023-11-03 05:00:00'),(12,'2023-12-15 14:30:00'),(13,'2023-01-02 05:15:00'),(14,'2023-02-20 13:45:00'),(15,'2023-03-15 08:00:00'),(16,'2023-04-10 16:30:00'),(17,'2023-05-12 03:45:00'),(18,'2023-06-20 10:10:00'),(19,'2023-07-15 12:30:00'),(20,'2023-08-22 19:00:00'),(21,'2023-09-12 09:30:00'),(22,'2023-10-30 12:55:00'),(23,'2023-11-08 06:10:00'),(24,'2023-12-20 15:35:00');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_detail`
--

DROP TABLE IF EXISTS `purchase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `purchase_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `purchase_detail_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_detail`
--

LOCK TABLES `purchase_detail` WRITE;
/*!40000 ALTER TABLE `purchase_detail` DISABLE KEYS */;
INSERT INTO `purchase_detail` VALUES (1,15,120,12.6,8),(2,23,75,10.3,17),(3,7,180,15.8,3),(4,31,95,18.5,22),(5,14,150,6.7,11),(6,5,110,13.2,6),(7,20,55,9.4,19),(8,11,160,16.9,13),(9,36,130,14.7,2),(10,29,70,7.1,14),(11,8,100,11.8,10),(12,17,190,19.2,23),(13,26,120,5.5,7),(14,2,85,17.3,16),(15,33,170,8.6,1),(16,22,60,12.1,20),(17,9,140,14.4,4),(18,35,105,10.9,12),(19,18,195,16,18),(20,13,125,6.2,9),(21,28,80,15.5,21),(22,3,165,9.9,5),(23,24,115,13.7,15),(24,19,145,11.4,8),(25,32,90,7.8,13),(26,6,175,18.2,24),(27,27,135,5.1,6),(28,12,110,16.4,17),(29,37,55,10.1,1),(30,30,185,14.9,11),(31,4,75,8.2,10),(32,21,155,12.3,3),(33,10,120,17.6,19),(34,25,95,6.4,8),(35,16,160,15.1,14),(36,1,130,9.7,12),(37,34,100,13,16),(38,15,175,11.6,22),(39,23,80,17.5,4);
/*!40000 ALTER TABLE `purchase_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `s_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2023-01-01 09:00:00'),(2,'2023-02-15 11:30:00'),(3,'2023-03-10 06:45:00'),(4,'2023-04-20 15:20:00'),(5,'2023-05-05 04:30:00'),(6,'2023-06-12 07:45:00'),(7,'2023-07-07 13:00:00'),(8,'2023-08-18 18:15:00'),(9,'2023-09-08 08:30:00'),(10,'2023-10-25 11:45:00'),(11,'2023-11-03 05:00:00'),(12,'2023-12-15 14:30:00'),(13,'2023-01-02 05:15:00'),(14,'2023-02-20 13:45:00'),(15,'2023-03-15 08:00:00'),(16,'2023-04-10 16:30:00'),(17,'2023-05-12 03:45:00'),(18,'2023-06-20 10:10:00'),(19,'2023-07-15 12:30:00'),(20,'2023-08-22 19:00:00'),(21,'2023-09-12 09:30:00'),(22,'2023-10-30 12:55:00'),(23,'2023-11-08 06:10:00'),(24,'2023-12-20 15:35:00');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_detail`
--

DROP TABLE IF EXISTS `sale_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `sale_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `sale_detail_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_detail`
--

LOCK TABLES `sale_detail` WRITE;
/*!40000 ALTER TABLE `sale_detail` DISABLE KEYS */;
INSERT INTO `sale_detail` VALUES (1,1,10.5,120,1),(2,2,15.3,80,2),(3,3,8.7,150,3),(4,4,18.2,100,4),(5,5,6.4,180,5),(6,6,12.9,55,6),(7,7,19.8,130,7),(8,8,7.1,95,8),(9,9,14.6,160,9),(10,10,9.3,70,10),(11,11,17,110,11),(12,12,13.7,140,12),(13,13,5.6,185,13),(14,14,16.1,120,14),(15,15,11.2,90,15),(16,16,8.9,55,16),(17,17,18.4,170,17),(18,18,6.7,105,18),(19,19,14.3,75,19),(20,20,12,195,20),(21,21,16.8,160,21),(22,22,7.5,130,22),(23,23,9.6,85,23),(24,24,19,110,24),(25,25,10.1,155,1),(26,26,15.7,120,2),(27,27,8.4,80,3),(28,28,18.9,145,4),(29,29,6.2,195,5),(30,30,12.5,100,6),(31,31,19.3,60,7),(32,32,7.8,130,8),(33,33,14.2,180,9),(34,34,9.9,95,10),(35,35,17.6,150,11),(36,36,13,120,12),(37,37,5.5,85,13);
/*!40000 ALTER TABLE `sale_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'SweetDelights Distributors','5551234567'),(2,'CrispyTreats Suppliers','5552345678'),(3,'SugarJoy Traders','5553456789'),(4,'CookieCraze Enterprises','5554567890'),(5,'CandyLand Distributing Co.','5555678901'),(6,'GourmetBites Suppliers','5556789012'),(7,'BlissfulSweets Trading','5557890123'),(8,'SnackHarmony Distributors','5558901234'),(9,'DelightfulMunchies Co.','5559012345'),(10,'TastyBites Wholesalers','5550123456'),(11,'SugarRush Trading Company','5551232567'),(12,'CrunchyMingle Suppliers','5552345278'),(13,'YummyHaven Distributors','5553456749'),(14,'DivineConfections Traders','5554562890'),(15,'SweetSensation Wholesalers','5555628901'),(16,'CrispNJoy Suppliers','5556789212'),(17,'MunchyMagic Trading Co.','5557891123'),(18,'CookieHeaven Distributing','5558201234'),(19,'CandyCrunch Wholesalers','5559011345'),(20,'HeavenlyTreats Suppliers','5550163456');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','4e09aa81-7c7e-40da-b48f-8d4f85eb3994');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-08 10:50:58
