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
-- Table structure for table `provide_feedback`
--

DROP TABLE IF EXISTS `provide_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provide_feedback` (
  `agent_phone_no` varchar(40) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `feedback_date` date NOT NULL,
  `rate` int NOT NULL,
  `review` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_email`,`agent_phone_no`,`feedback_date`),
  CONSTRAINT `provide_feedback_chk_1` CHECK (((`rate` >= 0) and (`rate` <= 10)))
  CONSTRAINT `provide_feedback_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
  CONSTRAINT `provide_feedback_ibfk_2` FOREIGN KEY (`agent_phone_no`) REFERENCES `agent` (`phone_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provide_feedback`
--

LOCK TABLES `provide_feedback` WRITE;
/*!40000 ALTER TABLE `provide_feedback` DISABLE KEYS */;
INSERT INTO `provide_feedback` VALUES ('01020844778','campbelldavid@example.com','0000-00-00',2,'Last yard hope article month. Chance apply happy choose.'),('01118321817','christinebrown@example.net','0000-00-00',4,'Deep pay ok option grow road game. Cover skin new too cold.'),('01140433702','dsmith@example.org','0000-00-00',9,'Your year strong be some thousand energy late. We soldier either sure main sense.'),('01143744330','houseduane@example.net','0000-00-00',1,'Present program thank political. Candidate most degree far.'),('01020844778','jennifer85@example.org','0000-00-00',9,'Southern reason wife stay population money call. Building feeling especially others back. Miss surface along floor choice nice mouth. Development debate sometimes heavy research church chair.'),('01020844778','marywilliams@example.com','0000-00-00',8,'Interesting dog significant option into. International first leave attention animal TV.'),('01020844778','patrickcarpenter@example.com','0000-00-00',5,'Officer nearly north though. Capital involve pick less able interesting. Different marriage recently.'),('01020844778','rosalesbarbara@example.com','0000-00-00',2,'Home almost campaign guess kind theory wrong analysis. Far whose any coach thought science total.'),('01111011421','seanpark@example.org','0000-00-00',8,'Thousand police pretty generation organization plant. Real never security care quality. Movie fall conference green he energy.'),('01000344676','umiller@example.com','0000-00-00',3,'Run save economy service. Data table hear respond case will.');
/*!40000 ALTER TABLE `provide_feedback` ENABLE KEYS */;
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
