-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: formativaHogwarts
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `progressos`
--

DROP TABLE IF EXISTS `progressos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progressos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descrisao` varchar(135) NOT NULL,
  `data` datetime NOT NULL,
  `imagens_status_FK` bigint NOT NULL,
  `tarefa_FK` bigint NOT NULL,
  `status_FK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tarefa_FK` (`tarefa_FK`),
  KEY `status_FK` (`status_FK`),
  KEY `imagens_status_FK` (`imagens_status_FK`),
  CONSTRAINT `progressos_ibfk_1` FOREIGN KEY (`tarefa_FK`) REFERENCES `tarefa` (`id`),
  CONSTRAINT `progressos_ibfk_2` FOREIGN KEY (`status_FK`) REFERENCES `status` (`id`),
  CONSTRAINT `progressos_ibfk_3` FOREIGN KEY (`imagens_status_FK`) REFERENCES `imagens_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progressos`
--

LOCK TABLES `progressos` WRITE;
/*!40000 ALTER TABLE `progressos` DISABLE KEYS */;
INSERT INTO `progressos` VALUES (1,'pronto','2023-01-30 00:00:00',1,1,1),(2,'ta quase','2023-02-12 00:00:00',2,1,2),(3,'*','2023-03-13 00:00:00',3,1,3),(4,'*','2023-04-14 00:00:00',3,1,4),(5,'cabo','2023-05-15 00:00:00',3,2,1),(6,'*','2023-06-04 00:00:00',1,3,1),(7,'ta quase','2023-07-13 00:00:00',2,4,1),(8,'*','2023-08-16 00:00:00',3,6,1),(9,'*','2023-09-11 00:00:00',3,7,1),(10,'cabo','2023-10-18 00:00:00',3,8,1),(11,'pronto','2023-01-30 00:00:00',1,1,1),(12,'pronto','2023-02-12 00:00:00',2,1,2),(13,'pronto','2023-03-13 00:00:00',3,1,3),(14,'pronto','2023-04-14 00:00:00',3,1,4),(15,'pronto','2023-05-15 00:00:00',3,2,1),(16,'finalizando','2023-06-04 00:00:00',1,3,1),(17,'finalizando','2023-07-13 00:00:00',2,4,1),(18,'finalizando','2023-08-16 00:00:00',3,6,1),(19,'finalizando','2023-09-11 00:00:00',3,7,1),(20,'finalizando','2023-10-18 00:00:00',3,8,1);
/*!40000 ALTER TABLE `progressos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 14:25:31
