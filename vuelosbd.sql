-- create database vuelobd;
use vuelobd;

-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: vuelopruebadb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto` (
  `id_aeropuerto` int NOT NULL AUTO_INCREMENT,
  `nombre_aeropuerto` varchar(50) NOT NULL,
  `numero_de_pistas` int NOT NULL,
  `aeropuerto_activo` varchar(2) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_aeropuerto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `id_avion` int NOT NULL AUTO_INCREMENT,
  `aeropuerto_id_aeropuerto` int NOT NULL,
  `compania_id_compania` int NOT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `avion_aeropuerto_fk` (`aeropuerto_id_aeropuerto`),
  KEY `avion_compania_fk` (`compania_id_compania`),
  CONSTRAINT `avion_aeropuerto_fk` FOREIGN KEY (`aeropuerto_id_aeropuerto`) REFERENCES `aeropuerto` (`id_aeropuerto`),
  CONSTRAINT `avion_compania_fk` FOREIGN KEY (`compania_id_compania`) REFERENCES `compania` (`id_compania`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compania`
--

DROP TABLE IF EXISTS `compania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compania` (
  `id_compania` int NOT NULL AUTO_INCREMENT,
  `nombre_compania` varchar(50) NOT NULL,
  PRIMARY KEY (`id_compania`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compania`
--

LOCK TABLES `compania` WRITE;
/*!40000 ALTER TABLE `compania` DISABLE KEYS */;
/*!40000 ALTER TABLE `compania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `nombre_aeropuerto` varchar(50) NOT NULL,
  `nombre_ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerario`
--

DROP TABLE IF EXISTS `itinerario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerario` (
  `id_itinerario` int NOT NULL AUTO_INCREMENT,
  `fecha_salida` timestamp NULL DEFAULT NULL,
  `fecha_llegada` timestamp NULL DEFAULT NULL,
  `destino_id_destino` int NOT NULL,
  `origen_id_origen` int NOT NULL,
  PRIMARY KEY (`id_itinerario`),
  KEY `itinerario_destino_fk` (`destino_id_destino`),
  KEY `itinerario_origen_fk` (`origen_id_origen`),
  CONSTRAINT `itinerario_destino_fk` FOREIGN KEY (`destino_id_destino`) REFERENCES `destino` (`id_destino`),
  CONSTRAINT `itinerario_origen_fk` FOREIGN KEY (`origen_id_origen`) REFERENCES `origen` (`id_origen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerario`
--

LOCK TABLES `itinerario` WRITE;
/*!40000 ALTER TABLE `itinerario` DISABLE KEYS */;
/*!40000 ALTER TABLE `itinerario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origen`
--

DROP TABLE IF EXISTS `origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origen` (
  `id_origen` int NOT NULL AUTO_INCREMENT,
  `nombre_aeropuerto` varchar(50) NOT NULL,
  `nombre_ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_origen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origen`
--

LOCK TABLES `origen` WRITE;
/*!40000 ALTER TABLE `origen` DISABLE KEYS */;
/*!40000 ALTER TABLE `origen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasaje`
--

DROP TABLE IF EXISTS `pasaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasaje` (
  `id_pasaje` int NOT NULL AUTO_INCREMENT,
  `clase` varchar(30) NOT NULL,
  `asiento` varchar(15) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `pasajero_id` int NOT NULL,
  `vuelo_id_vuelo` int NOT NULL,
  PRIMARY KEY (`id_pasaje`),
  KEY `pasaje_pasajero_fk` (`pasajero_id`),
  KEY `pasaje_vuelo_fk` (`vuelo_id_vuelo`),
  CONSTRAINT `pasaje_pasajero_fk` FOREIGN KEY (`pasajero_id`) REFERENCES `pasajero` (`id`),
  CONSTRAINT `pasaje_vuelo_fk` FOREIGN KEY (`vuelo_id_vuelo`) REFERENCES `vuelo` (`id_vuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasaje`
--

LOCK TABLES `pasaje` WRITE;
/*!40000 ALTER TABLE `pasaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `edad` varchar(15) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `id_vuelo` int NOT NULL AUTO_INCREMENT,
  `capacidad` varchar(10) DEFAULT NULL,
  `numerovuelo` varchar(10) DEFAULT NULL,
  `compania_id_compania` int NOT NULL,
  `itinerario_id_itinerario` int NOT NULL,
  `avion_id_avion` int NOT NULL,
  PRIMARY KEY (`id_vuelo`),
  KEY `vuelo_avion_fk` (`avion_id_avion`),
  KEY `vuelo_compania_fk` (`compania_id_compania`),
  KEY `vuelo_itinerario_fk` (`itinerario_id_itinerario`),
  CONSTRAINT `vuelo_avion_fk` FOREIGN KEY (`avion_id_avion`) REFERENCES `avion` (`id_avion`),
  CONSTRAINT `vuelo_compania_fk` FOREIGN KEY (`compania_id_compania`) REFERENCES `compania` (`id_compania`),
  CONSTRAINT `vuelo_itinerario_fk` FOREIGN KEY (`itinerario_id_itinerario`) REFERENCES `itinerario` (`id_itinerario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30  8:38:49
INSERT INTO pasajero (id,nombre,documento,edad,email,telefono) VALUES
('1','Eduardo Crosthwaite','10100123','60','jorgesalazar@gmail.com','321818732'),
('2','Maria Pineda','41768023','51','jorgesalazar@gmail.com','3019084563'),
('3','Geraldine Jaramillo','1095967409','21','gjaramillo@hotmail.com','312450945'),
('4','Maria Cuellar','1095986731','19','mcuellarj@outlook.com','3109674532'),
('5','Juan Rios','1095970907','32','jmrios@gmail.com','3112907687'),
('6','Daniel Gomez','1093958745','28','danigomesp@hotmail.com','3017650989'),
('7','Juan Jose Orozco','1093958730','35','jjorozco@hotmail.com','3225691'),
('8','Viviana Rodriguez','1094967698','39','viviro@gmail.com','3217650989'),
('9','Tatiana Salazar','1096978645','26','tsalazarp.uq@gmail.com','3017650989');

INSERT INTO origen (id_origen,nombre_aeropuerto,nombre_ciudad) VALUES
('1','Aeropuerto Internacional El Eden','Armenia'),
('2','Aeropuerto Internacional Matecaña','Pereira'),
('3','Aeropuerto Nacional La Nubia','Manizales'),
('4','Aeropuerto Internacional Alfonso Bonilla Aragón','Cali');

INSERT INTO destino (id_destino,nombre_aeropuerto,nombre_ciudad) VALUES
('1','Aeropuerto Internacional El Eden','Armenia'),
('2','Aeropuerto Internacional Matecaña','Pereira'),
('3','Aeropuerto Nacional La Nubia','Manizales'),
('4','Aeropuerto Internacional Alfonso Bonilla Aragón','Cali');

INSERT INTO itinerario (id_itinerario,fecha_salida,fecha_llegada,destino_id_destino,origen_id_origen) VALUES
(1,'2021-06-29 03:00:00','2021-06-29 05:00:00',4,1),
(2,'2021-06-30 01:00:00','2021-06-30 03:00:00',3,4),
(3,'2021-07-01 06:00:00','2021-07-01 07:00:00',3,1);

INSERT INTO compania (id_compania, nombre_compania) VALUES
('1','Avianca'),
('2','Viva Air');

INSERT INTO aeropuerto (id_aeropuerto , nombre_aeropuerto,numero_de_pistas,aeropuerto_activo,ciudad) VALUES
('1','Aeropuerto Internacional El Eden','2', 'si','Armenia'),
('2','Aeropuerto Internacional Matecaña','3','si','Pereira'),
('3','Aeropuerto Nacional La Nubia','3','si','Manizales'),
('4','Aeropuerto Internacional Alfonso Bonilla Aragón','3','si','Cali');

INSERT INTO avion (id_avion , aeropuerto_id_aeropuerto,compania_id_compania, modelo, capacidad) VALUES
('1','1','1','ATR-72',74),
('2','1','2','Airbus A320',180),
('3','2','1','ATR-72',74),
('4','3','1','ATR-72',74),
('5','4','1','ATR-72',74);

INSERT INTO vuelo (id_vuelo,capacidad,numerovuelo,compania_id_compania,itinerario_id_itinerario,avion_id_avion) VALUES
('1',74,'1',1,1,'1'),
('2',74,'2',1,1,'1'),
('3',180,'3',2,1,'1');

INSERT INTO pasaje (id_pasaje,clase,asiento,valor,pasajero_id,vuelo_id_vuelo) VALUES
('1','Económica','15',250000,'9','1'),
('2','Económica','22',250000,'8','1'),
('3','Económica','31',250000,'7','1');

use vuelobd;
select * from pasaje;
select * from pasaje WHERE id_pasaje >2;
select * from pasajero where edad>30;
select * from pasaje inner join vuelo on pasaje.vuelo_id_vuelo=id_pasaje inner join itinerario on id_vuelo=itinerario_id_itinerario inner join destino on id_itinerario=destino_id_destino ;
 -- capacidad del vuelo segun la fecha de salida
 select vuelo.capacidad from pasaje inner join vuelo on pasaje.vuelo_id_vuelo=id_pasaje inner join itinerario on id_vuelo=itinerario_id_itinerario where itinerario.fecha_salida='2021-06-29 03:00:00';
 -- id pasaje, id vuelo, id pasajero con destino armenia
 select pasaje.id_pasaje,vuelo.id_vuelo, pasaje.pasajero_id from pasaje inner join vuelo on pasaje.vuelo_id_vuelo=id_pasaje
									inner join itinerario on id_vuelo=itinerario_id_itinerario 
                                    inner join destino on id_itinerario=destino_id_destino
                                    where destino.nombre_ciudad='Armenia';
