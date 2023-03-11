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
-- Table structure for table `user_focus_areas`
--

DROP TABLE IF EXISTS `user_focus_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_focus_areas` (
  `user_email` varchar(40) NOT NULL,
  `focus_areas` varchar(40) NOT NULL,
  PRIMARY KEY (`user_email`,`focus_areas`),
  CONSTRAINT `user_focus_areas_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_focus_areas`
--

LOCK TABLES `user_focus_areas` WRITE;
/*!40000 ALTER TABLE `user_focus_areas` DISABLE KEYS */;
INSERT INTO `user_focus_areas` VALUES ('\'dsmith@example.org\'','\'Giza\'\r'),('\'dsmith@example.org\'','\'New Cairo\'\r'),('\'houseduane@example.net\'','\'Nasr City\'\r'),('\'houseduane@example.net\'','\'Sheikh Zayed\'\r'),('\'patrickcarpenter@example.com\'','\'Giza\'\r'),('\'patrickcarpenter@example.com\'','\'New Cairo\'\r'),('\'seanpark@example.org\'','\'Nasr City\'\r'),('\'seanpark@example.org\'','\'Sheikh Zayed\'\r'),('\'umiller@example.com\'','\'Giza\'\r'),('\'umiller@example.com\'','\'Nasr City\'\r');
/*!40000 ALTER TABLE `user_focus_areas` ENABLE KEYS */;
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
