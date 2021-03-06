CREATE DATABASE  IF NOT EXISTS `eca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eca`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: eca
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_action`
--

DROP TABLE IF EXISTS `tb_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `str_cod_action` varchar(4) NOT NULL,
  `str_name_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_action`),
  UNIQUE KEY `str_cod_action_UNIQUE` (`str_cod_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_action`
--

LOCK TABLES `tb_action` WRITE;
/*!40000 ALTER TABLE `tb_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_beneficiaries`
--

DROP TABLE IF EXISTS `tb_beneficiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_beneficiaries` (
  `id_beneficiaries` bigint(20) NOT NULL AUTO_INCREMENT,
  `str_nis` varchar(14) NOT NULL,
  `str_name_person` varchar(255) NOT NULL,
  `str_cpf` varchar(14) DEFAULT NULL,
  `int_rgp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_beneficiaries`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_beneficiaries`
--

LOCK TABLES `tb_beneficiaries` WRITE;
/*!40000 ALTER TABLE `tb_beneficiaries` DISABLE KEYS */;
INSERT INTO `tb_beneficiaries` VALUES (1,'123','Joaquim Oliveira da Silva','123456789',321654);
/*!40000 ALTER TABLE `tb_beneficiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_city`
--

DROP TABLE IF EXISTS `tb_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `str_name_city` varchar(255) DEFAULT NULL,
  `str_cod_siafi_city` varchar(4) NOT NULL,
  `tb_state_id_state` int(11) NOT NULL,
  PRIMARY KEY (`id_city`),
  UNIQUE KEY `str_cod_siafi_city_UNIQUE` (`str_cod_siafi_city`),
  KEY `fk_tb_city_tb_state_idx` (`tb_state_id_state`),
  CONSTRAINT `fk_tb_city_tb_state` FOREIGN KEY (`tb_state_id_state`) REFERENCES `tb_state` (`id_state`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_city`
--

LOCK TABLES `tb_city` WRITE;
/*!40000 ALTER TABLE `tb_city` DISABLE KEYS */;
INSERT INTO `tb_city` VALUES (1,'Juiz de Fora','357',1);
/*!40000 ALTER TABLE `tb_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_crop_guarantee`
--

DROP TABLE IF EXISTS `tb_crop_guarantee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_crop_guarantee` (
  `id_crop_guarantee` int(11) NOT NULL AUTO_INCREMENT,
  `str_month` varchar(2) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `db_value` double NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  PRIMARY KEY (`id_crop_guarantee`),
  KEY `fk_td_crop_guarantee_tb_city1_idx` (`tb_city_id_city`),
  KEY `fk_td_crop_guarantee_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`),
  CONSTRAINT `fk_td_crop_guarantee_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_td_crop_guarantee_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_crop_guarantee`
--

LOCK TABLES `tb_crop_guarantee` WRITE;
/*!40000 ALTER TABLE `tb_crop_guarantee` DISABLE KEYS */;
INSERT INTO `tb_crop_guarantee` VALUES (1,'09','2018',120,1,1);
/*!40000 ALTER TABLE `tb_crop_guarantee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_family_bag`
--

DROP TABLE IF EXISTS `tb_family_bag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_family_bag` (
  `id_family_bag` int(11) NOT NULL AUTO_INCREMENT,
  `str_reference_month` varchar(2) NOT NULL,
  `str_reference_year` varchar(4) NOT NULL,
  `str_competence_month` varchar(2) NOT NULL,
  `str_competence_year` varchar(4) NOT NULL,
  `dt_date` date NOT NULL,
  `db_value` double NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  PRIMARY KEY (`id_family_bag`),
  KEY `fk_family_bag_td_beneficiaries_idx` (`tb_beneficiaries_id_beneficiaries`),
  KEY `fk_tb_family_bag_td_city_idx` (`tb_city_id_city`),
  CONSTRAINT `fk_tb_family_bag_td_city` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_td_family_bag_td_beneficiaries` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_family_bag`
--

LOCK TABLES `tb_family_bag` WRITE;
/*!40000 ALTER TABLE `tb_family_bag` DISABLE KEYS */;
INSERT INTO `tb_family_bag` VALUES (2,'05','2017','04','2018','2018-09-22',210,1,1),(3,'05','2017','04','2019','1993-05-25',150,1,1),(4,'05','2017','04','2018','2018-09-22',150,1,1);
/*!40000 ALTER TABLE `tb_family_bag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_files`
--

DROP TABLE IF EXISTS `tb_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_files` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `str_name_file` varchar(45) NOT NULL,
  `str_month` varchar(2) DEFAULT NULL,
  `str_year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id_file`),
  UNIQUE KEY `str_name_file_UNIQUE` (`str_name_file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_files`
--

LOCK TABLES `tb_files` WRITE;
/*!40000 ALTER TABLE `tb_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_fisherman_insurance`
--

DROP TABLE IF EXISTS `tb_fisherman_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_fisherman_insurance` (
  `id_tb_fisherman_insurance` int(11) NOT NULL AUTO_INCREMENT,
  `str_month` varchar(2) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `db_value` double NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  PRIMARY KEY (`id_tb_fisherman_insurance`),
  KEY `fk_tb_fisherman insurance_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`),
  KEY `fk_tb_fisherman insurance_tb_city1_idx` (`tb_city_id_city`),
  CONSTRAINT `fk_tb_fisherman insurance_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_fisherman insurance_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_fisherman_insurance`
--

LOCK TABLES `tb_fisherman_insurance` WRITE;
/*!40000 ALTER TABLE `tb_fisherman_insurance` DISABLE KEYS */;
INSERT INTO `tb_fisherman_insurance` VALUES (2,'09','2018',120,1,1);
/*!40000 ALTER TABLE `tb_fisherman_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_functions`
--

DROP TABLE IF EXISTS `tb_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_functions` (
  `id_function` int(11) NOT NULL AUTO_INCREMENT,
  `str_cod_function` varchar(4) NOT NULL,
  `str_name_function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_function`),
  UNIQUE KEY `str_cod_function_UNIQUE` (`str_cod_function`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_functions`
--

LOCK TABLES `tb_functions` WRITE;
/*!40000 ALTER TABLE `tb_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_payments`
--

DROP TABLE IF EXISTS `tb_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_payments` (
  `id_payment` bigint(20) NOT NULL AUTO_INCREMENT,
  `tb_city_id_city` int(11) NOT NULL,
  `tb_functions_id_function` int(11) NOT NULL,
  `tb_subfunctions_id_subfunction` int(11) NOT NULL,
  `tb_program_id_program` int(11) NOT NULL,
  `tb_action_id_action` int(11) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  `tb_source_id_source` int(11) NOT NULL,
  `tb_files_id_file` int(11) NOT NULL,
  `db_value` double NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `fk_tb_payments_tb_city1_idx` (`tb_city_id_city`),
  KEY `fk_tb_payments_tb_program1_idx` (`tb_program_id_program`),
  KEY `fk_tb_payments_tb_action1_idx` (`tb_action_id_action`),
  KEY `fk_tb_payments_tb_source1_idx` (`tb_source_id_source`),
  KEY `fk_tb_payments_tb_files1_idx` (`tb_files_id_file`),
  KEY `fk_tb_payments_tb_functions1_idx` (`tb_functions_id_function`),
  KEY `fk_tb_payments_tb_subfunctions1_idx` (`tb_subfunctions_id_subfunction`),
  KEY `fk_tb_payments_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`),
  CONSTRAINT `fk_tb_payments_tb_action1` FOREIGN KEY (`tb_action_id_action`) REFERENCES `tb_action` (`id_action`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_files1` FOREIGN KEY (`tb_files_id_file`) REFERENCES `tb_files` (`id_file`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_functions1` FOREIGN KEY (`tb_functions_id_function`) REFERENCES `tb_functions` (`id_function`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_program1` FOREIGN KEY (`tb_program_id_program`) REFERENCES `tb_program` (`id_program`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_source1` FOREIGN KEY (`tb_source_id_source`) REFERENCES `tb_source` (`id_source`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_payments_tb_subfunctions1` FOREIGN KEY (`tb_subfunctions_id_subfunction`) REFERENCES `tb_subfunctions` (`id_subfunction`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payments`
--

LOCK TABLES `tb_payments` WRITE;
/*!40000 ALTER TABLE `tb_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_peti`
--

DROP TABLE IF EXISTS `tb_peti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_peti` (
  `id_peti` int(11) NOT NULL AUTO_INCREMENT,
  `str_month` varchar(2) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `db_value` double NOT NULL,
  `str_situation` varchar(20) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  PRIMARY KEY (`id_peti`),
  KEY `fk_tb_peti_tb_beneficiaries_idx` (`tb_beneficiaries_id_beneficiaries`),
  KEY `fk_tb_peti_tb_city_idx` (`tb_city_id_city`),
  CONSTRAINT `fk_tb_peti_tb_beneficiaries` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_peti_tb_city` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_peti`
--

LOCK TABLES `tb_peti` WRITE;
/*!40000 ALTER TABLE `tb_peti` DISABLE KEYS */;
INSERT INTO `tb_peti` VALUES (1,'05','2017',150,'Sim',1,1);
/*!40000 ALTER TABLE `tb_peti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_program`
--

DROP TABLE IF EXISTS `tb_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_program` (
  `id_program` int(11) NOT NULL AUTO_INCREMENT,
  `str_cod_program` varchar(4) NOT NULL,
  `str_name_program` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_program`),
  UNIQUE KEY `str_cod_program_UNIQUE` (`str_cod_program`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_program`
--

LOCK TABLES `tb_program` WRITE;
/*!40000 ALTER TABLE `tb_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_region`
--

DROP TABLE IF EXISTS `tb_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_region` (
  `id_region` int(11) NOT NULL AUTO_INCREMENT,
  `str_name_region` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_region`),
  UNIQUE KEY `str_name_region_UNIQUE` (`str_name_region`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_region`
--

LOCK TABLES `tb_region` WRITE;
/*!40000 ALTER TABLE `tb_region` DISABLE KEYS */;
INSERT INTO `tb_region` VALUES (1,'Sudeste');
/*!40000 ALTER TABLE `tb_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_source`
--

DROP TABLE IF EXISTS `tb_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_source` (
  `id_source` int(11) NOT NULL AUTO_INCREMENT,
  `str_goal` varchar(255) NOT NULL,
  `str_origin` varchar(255) DEFAULT NULL,
  `str_periodicity` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_source`),
  UNIQUE KEY `str_goal_UNIQUE` (`str_goal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_source`
--

LOCK TABLES `tb_source` WRITE;
/*!40000 ALTER TABLE `tb_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_state`
--

DROP TABLE IF EXISTS `tb_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `str_uf` varchar(2) NOT NULL,
  `str_name` varchar(19) NOT NULL,
  `tb_region_id_region` int(11) NOT NULL,
  PRIMARY KEY (`id_state`),
  KEY `fk_tb_state_tb_region1_idx` (`tb_region_id_region`),
  CONSTRAINT `fk_tb_state_tb_region1` FOREIGN KEY (`tb_region_id_region`) REFERENCES `tb_region` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_state`
--

LOCK TABLES `tb_state` WRITE;
/*!40000 ALTER TABLE `tb_state` DISABLE KEYS */;
INSERT INTO `tb_state` VALUES (1,'MG','Minas Gerais',1);
/*!40000 ALTER TABLE `tb_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subfunctions`
--

DROP TABLE IF EXISTS `tb_subfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subfunctions` (
  `id_subfunction` int(11) NOT NULL AUTO_INCREMENT,
  `str_cod_subfunction` varchar(4) NOT NULL,
  `str_name_subfunction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_subfunction`),
  UNIQUE KEY `str_cod_subfunction_UNIQUE` (`str_cod_subfunction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subfunctions`
--

LOCK TABLES `tb_subfunctions` WRITE;
/*!40000 ALTER TABLE `tb_subfunctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_subfunctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `perfil` varchar(45) NOT NULL,
  `resetar` tinyint(4) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'admin','D033E22AE348AEB5660FC2140AEC35850C4DA997','Iran','0',0,'iranfaefid@hotmail.com'),(2,'user','12dea96fec20593566ab75692c9949596833adc9','usuario','1',1,'user@hotmail.com');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-21 21:54:14
