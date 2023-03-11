-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: property_finder
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=1 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `development_project`
--

DROP TABLE IF EXISTS `development_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `development_project` (
  `name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `developer` varchar(60) DEFAULT NULL,
  `size_range_min` int DEFAULT NULL,
  `size_range_max` int DEFAULT NULL,
  `starting_price` int DEFAULT NULL,
  `completion_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `development_project`
--

LOCK TABLES `development_project` WRITE;
/*!40000 ALTER TABLE `development_project` DISABLE KEYS */;
INSERT INTO `development_project` VALUES ('\'Isola October\'','\'Al-Masryia Group\'','Giza;  6 October City;  Hadayek October',190,NULL,210,'\'Completed\'\r'),('\'La Verde New Capital\'','\'La Verde Developments\'','Cairo;  New Capital City;  New Capital Compounds',75,NULL,462,'\'Q4-2023\'\r'),('\'Rhodes\'','\'Plaza Gardens\'','Cairo;  New Capital City;  New Capital Compounds',118,NULL,414,'\'Q2-2024\'\r'),('\'Rivan**\'','\'Eltaamer Arabian\'','Cairo;  New Capital City;  New Capital Compounds',131,NULL,592,'\'Q1-2026\'\r'),('0','1','2',4,NULL,5,'6\r');
/*!40000 ALTER TABLE `development_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-29 12:07:50
