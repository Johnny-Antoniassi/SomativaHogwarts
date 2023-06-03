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
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descrisao` varchar(500) NOT NULL,
  `usuarioFk` bigint NOT NULL,
  `responsavel_fk` bigint NOT NULL,
  `prazo` date NOT NULL,
  `locais_FK` bigint NOT NULL,
  `imagens` mediumtext,
  PRIMARY KEY (`id`),
  KEY `usuarioFk` (`usuarioFk`),
  KEY `responsavel_fk` (`responsavel_fk`),
  KEY `locais_FK` (`locais_FK`),
  CONSTRAINT `tarefa_ibfk_1` FOREIGN KEY (`usuarioFk`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tarefa_ibfk_2` FOREIGN KEY (`responsavel_fk`) REFERENCES `responsavel` (`id`),
  CONSTRAINT `tarefa_ibfk_3` FOREIGN KEY (`locais_FK`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (1,'computador','sem cabos',1,2,'2023-05-10',1,'imagem 1'),(2,'computador','quebrado',6,1,'2023-06-10',2,'imagem 2'),(3,'monitor','quebrado',4,3,'2023-07-12',5,'imagem 3'),(4,'monitor','falha',6,3,'2023-08-11',4,'imagem 4'),(5,'monitor','cabo',4,3,'2023-09-09',2,'imagem 5'),(6,'computador','cabo',4,3,'2023-10-12',2,'imagem 6'),(7,'tablet','carregador',4,3,'2023-11-05',2,'imagem 7'),(8,'celular','fonte',4,3,'2023-01-23',3,'imagem 8'),(9,'luminaria','cabo',4,3,'2023-02-24',4,'imagem 9'),(10,'ar condicionado','tomada',4,3,'2023-03-22',5,'imagem 10');
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
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
