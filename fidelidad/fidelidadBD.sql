-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: fidelidad
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKrdxh7tq2xs66r485cc8dkxt77` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (2,'American Eagle'),(1,'Americanino'),(3,'Chevignon'),(4,'Esprit'),(5,'Naf Naf'),(6,'Rifle');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5bv8j9ier9lcwsx4wt1hw6a85` (`department_id`),
  CONSTRAINT `FK5bv8j9ier9lcwsx4wt1hw6a85` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Medellín',1),(2,'Envigado',1),(3,'Bogotá',2),(4,'Chía',2),(5,'Guadalajara',3),(6,'Zapopan',3),(7,'Tlaquepaque',3),(8,'Tonalá',3),(9,'Puerto Vallarta',3),(10,'Centro',4),(11,'Coyoacán',4),(12,'Polanco',4),(13,'Xochimilco',4),(14,'Tlalpan',4),(15,'Monterrey',5),(16,'San Nicolás',5),(17,'Guadalupe',5),(18,'San Pedro',5),(19,'Apodaca',5),(20,'Puebla',6),(21,'Cholula',6),(22,'Tehuacán',6),(23,'Atlixco',6),(24,'San Martín Texmelucan',6),(25,'Mérida',7),(26,'Valladolid',7),(27,'Progreso',7),(28,'Tizimín',7),(29,'Ticul',7),(30,'Lima',8),(31,'Miraflores',8),(32,'San Isidro',8),(33,'Santiago de Surco',8),(34,'Callao',8),(35,'Cusco',9),(36,'Urubamba',9),(37,'Sicuani',9),(38,'Calca',9),(39,'Quillabamba',9),(40,'Arequipa',10),(41,'Camaná',10),(42,'Mollendo',10),(43,'Cayma',10),(44,'Yanahuara',10),(45,'Trujillo',11),(46,'Chao',11),(47,'Chepén',11),(48,'Pacasmayo',11),(49,'Huamachuco',11),(50,'Piura',12),(51,'Sullana',12),(52,'Talara',12),(53,'Paita',12),(54,'Catacaos',12),(55,'Cali',13),(56,'Palmira',13),(57,'Tuluá',13),(58,'Buenaventura',13),(59,'Buga',13),(60,'Barranquilla',14),(61,'Soledad',14),(62,'Malambo',14),(63,'Puerto Colombia',14),(64,'Sabanalarga',14),(65,'Bucaramanga',15),(66,'Floridablanca',15),(67,'Girón',15),(68,'Piedecuesta',15),(69,'Barrancabermeja',15),(70,'Bello',1),(71,'Itagüí',1),(72,'Rionegro',1),(73,'Chía',2),(74,'Zipaquirá',2),(90,'Facatativá',2);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKllidyp77h6xkeokpbmoy710d4` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Colombia'),(2,'México'),(3,'Perú');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `brand_id` bigint NOT NULL,
  `city_id` bigint NOT NULL,
  `id_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK240rdnr4j2u0y9qqaod0sila9` (`brand_id`),
  KEY `FKt79b5wvqbf38jtkjx36vp9vam` (`city_id`),
  KEY `FK6w6b0peut6e9r7vtf0y7aoykv` (`id_type_id`),
  CONSTRAINT `FK240rdnr4j2u0y9qqaod0sila9` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK6w6b0peut6e9r7vtf0y7aoykv` FOREIGN KEY (`id_type_id`) REFERENCES `id_type` (`id`),
  CONSTRAINT `FKt79b5wvqbf38jtkjx36vp9vam` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Calle Falsa 123','1995-06-01','Andres','123456789','Castillo',2,1,1),(2,'calle 90A# 44b-19','1997-07-20','Libardo','1116447262','Castillo',3,1,1),(3,'calle fake # 5686','2000-10-16','Camilo','12121212','Rodriguez',5,3,1),(4,'carrera 50 # 12-24','1995-12-03','Sara ','1313131313','Higuita',5,2,1),(5,'calle 42 B 12-24','2005-06-20','Lian','1414141414','Herrera',3,71,1),(6,'calle 90A# 44b-19','2006-01-16','SEBASTIAN','1025762297','ARBOLEDA',5,1,2),(7,'carrera 67 -189','1994-05-22','Juan Camilo','789456123','Castro Gomez',2,12,1),(8,'carrera 40 # 45-98','1992-06-24','Lionel','123456789','Messi',3,22,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk0qqx5jjcwjwd8wut9t7rl23` (`country_id`),
  CONSTRAINT `FKk0qqx5jjcwjwd8wut9t7rl23` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Antioquia',1),(2,'Cundinamarca',1),(3,'Jalisco',2),(4,'Ciudad de México',2),(5,'Nuevo León',2),(6,'Puebla',2),(7,'Yucatán',2),(8,'Lima',3),(9,'Cusco',3),(10,'Arequipa',3),(11,'La Libertad',3),(12,'Piura',3),(13,'Valle del Cauca',1),(14,'Atlántico',1),(15,'Santander',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_type`
--

DROP TABLE IF EXISTS `id_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmcvn6o9lapx7y6b3849b4v18g` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_type`
--

LOCK TABLES `id_type` WRITE;
/*!40000 ALTER TABLE `id_type` DISABLE KEYS */;
INSERT INTO `id_type` VALUES (1,'CC'),(3,'CE'),(4,'PASAPORTE'),(2,'TI');
/*!40000 ALTER TABLE `id_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_clientes`
--

DROP TABLE IF EXISTS `vista_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_clientes` AS SELECT 
 1 AS `id`,
 1 AS `tipo_identificacion`,
 1 AS `numero_identificacion`,
 1 AS `nombres`,
 1 AS `apellidos`,
 1 AS `fecha_nacimiento`,
 1 AS `direccion`,
 1 AS `ciudad`,
 1 AS `departamento`,
 1 AS `pais`,
 1 AS `marca`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_clientes` AS select `c`.`id` AS `id`,`it`.`name` AS `tipo_identificacion`,`c`.`id_number` AS `numero_identificacion`,`c`.`first_name` AS `nombres`,`c`.`last_name` AS `apellidos`,`c`.`birth_date` AS `fecha_nacimiento`,`c`.`address` AS `direccion`,`ci`.`name` AS `ciudad`,`d`.`name` AS `departamento`,`co`.`name` AS `pais`,`b`.`name` AS `marca` from (((((`customer` `c` join `id_type` `it` on((`c`.`id_type_id` = `it`.`id`))) join `city` `ci` on((`c`.`city_id` = `ci`.`id`))) join `department` `d` on((`ci`.`department_id` = `d`.`id`))) join `country` `co` on((`d`.`country_id` = `co`.`id`))) join `brand` `b` on((`c`.`brand_id` = `b`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-30 12:49:50
