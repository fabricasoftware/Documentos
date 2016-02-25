CREATE DATABASE  IF NOT EXISTS `comercio_web` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `comercio_web`;
-- MySQL dump 10.13  Distrib 5.6.19, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: comercio_web
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.12.04.1

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_cadastro` int(11) DEFAULT '0' COMMENT '0=Pessoa fisica; 1=pessoa Juridica',
  `nome` varchar(256) DEFAULT NULL,
  `logradouro` varchar(10) DEFAULT NULL,
  `endereco` varchar(256) DEFAULT NULL,
  `numero` varchar(6) DEFAULT NULL,
  `complemento` varchar(128) DEFAULT NULL,
  `bairro` varchar(128) DEFAULT NULL,
  `cidade` varchar(128) DEFAULT NULL,
  `estado` varchar(128) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_alternativo` varchar(256) DEFAULT NULL,
  `telefone_residencial` varchar(20) DEFAULT NULL,
  `telefone_celular` varchar(20) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `cnpj` varchar(100) DEFAULT NULL,
  `inscricao_estadual` varchar(128) DEFAULT NULL,
  `nome_empresa` varchar(128) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pais` text,
  `cod_pais` int(11) DEFAULT '55',
  `pis_pasepe_nis` varchar(100) DEFAULT NULL,
  `nome_mae` varchar(256) DEFAULT NULL,
  `cancelado` tinyint(4) DEFAULT '0',
  `data_cancelamento` timestamp NULL DEFAULT NULL,
  `obs_cancelamento` longtext,
  `data_ultima_atualizacao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`(255)),
  KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `cnpj` int(11) NOT NULL,
  `ie` int(11) NOT NULL,
  `im` int(11) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `complemento` varchar(60) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `fone1` varchar(11) NOT NULL,
  `fone2` varchar(11) NOT NULL,
  `matriz` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientes` int(11) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` timestamp NULL DEFAULT NULL,
  `data_baixa` timestamp NULL DEFAULT NULL,
  `confirmado` int(11) NOT NULL COMMENT '0 = Nao confirmado; 1= Confirmado; 2= Cancelado',
  `valor` double(25,2) DEFAULT NULL,
  `id_tipo_pagamento` int(11) DEFAULT NULL COMMENT 'referencia tipo_pagamento',
  `id_empresa` int(11) DEFAULT NULL,
  `usuario_baixa` int(11) DEFAULT NULL,
  `data_cancelamento` timestamp NULL DEFAULT NULL,
  `status_entrega` int(11) DEFAULT '0' COMMENT '0 = Nao Entrege; 1 = Enviado; 2= Entregue',
  `data_entrega` datetime DEFAULT NULL,
  `obs_entrega` text,
  `memo` mediumtext,
  `codigo_rastreio` varchar(100) DEFAULT NULL,
  `cod_autorizacao_pagamento` varchar(100) DEFAULT NULL,
  `id_transacao_pagamento` varchar(100) DEFAULT NULL,
  `recusado_pagamento` tinyint(4) DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `valor_juros` double(25,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_1_idx` (`id_tipo_pagamento`),
  KEY `fk_pedidos_2_idx` (`id_clientes`),
  CONSTRAINT `fk_pedidos_2` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_1` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tipo_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedidos` int(11) NOT NULL,
  `id_produtos` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor_unitario` decimal(5,2) DEFAULT NULL,
  `valor_desconto` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_produtos_1_idx` (`id_pedidos`),
  KEY `fk_pedidos_produtos_2_idx` (`id_produtos`),
  CONSTRAINT `fk_pedidos_produtos_2` FOREIGN KEY (`id_produtos`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_produtos_1` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `nivel` int(11) NOT NULL,
  `ativo` int(11) NOT NULL COMMENT '0= Nao; 1= Sim',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis_recursos`
--

DROP TABLE IF EXISTS `perfis_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfis_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_resource` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_resource` (`id_resource`),
  CONSTRAINT `fk_perfis_resources_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfis_resources_2` FOREIGN KEY (`id_resource`) REFERENCES `recursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis_recursos`
--

LOCK TABLES `perfis_recursos` WRITE;
/*!40000 ALTER TABLE `perfis_recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfis_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `codigo_barras` varchar(13) DEFAULT NULL,
  `ncm_sh` varchar(8) DEFAULT NULL,
  `o_csf` varchar(3) DEFAULT NULL,
  `cfop` varchar(4) DEFAULT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `valor_unitario` decimal(5,2) DEFAULT NULL,
  `base_icms` decimal(5,2) DEFAULT NULL,
  `valor_icms` decimal(5,2) DEFAULT NULL,
  `base_icms_st` decimal(5,2) DEFAULT NULL,
  `valor_icms_st` decimal(5,2) DEFAULT NULL,
  `valor_pis` decimal(5,2) DEFAULT NULL,
  `valor_cofins` decimal(5,2) DEFAULT NULL,
  `aliquota_icms` int(11) DEFAULT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos`
--

DROP TABLE IF EXISTS `recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource` (`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos`
--

LOCK TABLES `recursos` WRITE;
/*!40000 ALTER TABLE `recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pagamento`
--

DROP TABLE IF EXISTS `tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pagamento`
--

LOCK TABLES `tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tipo_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `cpf` varchar(13) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `data_ultimo_login` timestamp NULL DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_perfis`
--

DROP TABLE IF EXISTS `usuarios_perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_perfis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `fk_usuarios_perfis_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_perfis_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_perfis`
--

LOCK TABLES `usuarios_perfis` WRITE;
/*!40000 ALTER TABLE `usuarios_perfis` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'comercio_web'
--

--
-- Dumping routines for database 'comercio_web'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-25 13:43:14
