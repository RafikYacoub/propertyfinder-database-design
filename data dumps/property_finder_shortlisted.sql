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
-- Table structure for table `shortlisted`
--

DROP TABLE IF EXISTS `shortlisted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortlisted` (
  `property_ID` varchar(50) NOT NULL,
  `property_location` varchar(200) NOT NULL,
  `property_area` int NOT NULL,
  `user_email` varchar(40) NOT NULL,
  PRIMARY KEY (`user_email`,`property_ID`,`property_location`,`property_area`)
  CONSTRAINT `shortlisted_ibfk_1` FOREIGN KEY (`property_ID`, `property_location`, `property_area`) REFERENCES `property` (`ID`, `location`, `area`) ON DELETE CASCADE ON UPDATE CASCADE
  CONSTRAINT `shortlisted_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlisted`
--

LOCK TABLES `shortlisted` WRITE;
/*!40000 ALTER TABLE `shortlisted` DISABLE KEYS */;
INSERT INTO `shortlisted` VALUES ('\'KAB-RA003\'','\'Tala Giza  6 October City  6 October Compounds\'',182,'\'christinebrown@example.net\'\r'),('\'hmz613\'','\'Madinaty Cairo\'',165,'\'dsmith@example.org\'\r'),('\'hmz613\'','\'Madinaty Cairo\'',165,'\'houseduane@example.net\'\r'),('\'KAB-RA003\'','\'Tala Giza  6 October City  6 October Compounds\'',182,'\'umiller@example.com\'\r');
/*!40000 ALTER TABLE `shortlisted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-29 12:07:51
