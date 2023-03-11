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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` char(3) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('elliottlindsey','John Kennedy','M','5815 Guzman Turnpike Lake Tinatown ; MN 75844','campbelldavid@example.com','1976-10-09'),('allen12','Aaron Calderon','M','351 Lawrence Fort North Jacktown ; IA 42240','christinebrown@example.net','1973-09-02'),('vjackson','Darrell Mcdonald','M','94345 John Locks Ronaldland ; NJ 01695','dsmith@example.org','1970-05-14'),('nguyenmark','Kathleen Cortez','F','9082 Todd Trail Apt. 437 West Davidhaven ; VA 21412','houseduane@example.net','1953-11-19'),('johnsonwilliam','Adam Vazquez','M','9708 Seth Squares Port James ; TN 51775','jennifer85@example.org','1962-02-07'),('thomasnichols','Dr. Debra Moore','F','2444 Aaron Mission Apt. 203 Sancheztown ; PA 90147','marywilliams@example.com','1958-05-21'),('debbie29','Sarah Hicks','F','Unit 7010 Box 9256 DPO AE 60312','patrickcarpenter@example.com','1966-11-10'),('robert01','Logan Randall','M','018 Michael Mall Apt. 211 South Kristy ; CO 95187','rosalesbarbara@example.com','1996-05-15'),('dustin03','Brandi Green','F','855 Mendoza Wall New Marcus ; NY 31062','seanpark@example.org','1990-02-10'),('davidholt','Holly Miller','F','1092 Brandon Rapid Apt. 856 North Ricardo ; SD 20949','umiller@example.com','1967-11-01');
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

-- Dump completed on 2022-10-29 12:07:50
