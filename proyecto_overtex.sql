-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_overtex
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `NombreCliente` varchar(45) DEFAULT NULL,
  `TelefonoClientes` varchar(45) DEFAULT NULL,
  `EmailClientes` varchar(45) DEFAULT NULL,
  `DireccionCLientes` varchar(45) DEFAULT NULL,
  `EstadoCLientes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'CARLOS','372947832','CMENDEZ','cll65','DESACTIVO'),(2,'MANUEL','2345634567','MPEÑA','CLL87','ACTIVO'),(3,'MARIA','345367898','UMARIA','CLL12','ACTIVO'),(4,'UBALDO','361736238U','URODRIGEZ','CLL100','DESACTIVO'),(5,'CARLOS','361736238U','URODRIGUEZ','CLL100','ACTIVO');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `ComIDCompra` int NOT NULL AUTO_INCREMENT,
  `ComFecha` date DEFAULT NULL,
  `CoDetallesProducto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ComIDCompra`),
  CONSTRAINT `fkcomprarealizada` FOREIGN KEY (`ComIDCompra`) REFERENCES `comprarealizada` (`CrCantidad`),
  CONSTRAINT `fkproveedor` FOREIGN KEY (`ComIDCompra`) REFERENCES `proveedores` (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,NULL,'USO');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprarealizada`
--

DROP TABLE IF EXISTS `comprarealizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprarealizada` (
  `CrCantidad` int NOT NULL,
  PRIMARY KEY (`CrCantidad`),
  CONSTRAINT `fkinventario` FOREIGN KEY (`CrCantidad`) REFERENCES `productos` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprarealizada`
--

LOCK TABLES `comprarealizada` WRITE;
/*!40000 ALTER TABLE `comprarealizada` DISABLE KEYS */;
INSERT INTO `comprarealizada` VALUES (1),(2);
/*!40000 ALTER TABLE `comprarealizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `consultar_estado_cliente`
--

DROP TABLE IF EXISTS `consultar_estado_cliente`;
/*!50001 DROP VIEW IF EXISTS `consultar_estado_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consultar_estado_cliente` AS SELECT 
 1 AS `idClientes`,
 1 AS `NombreCliente`,
 1 AS `TelefonoClientes`,
 1 AS `EmailClientes`,
 1 AS `DireccionClientes`,
 1 AS `EstadoClientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `IdFactura` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `DIreccion` varchar(45) DEFAULT NULL,
  `Facfecha` date DEFAULT NULL,
  `FacValorTotal` double DEFAULT NULL,
  PRIMARY KEY (`IdFactura`),
  CONSTRAINT `fkcliente` FOREIGN KEY (`IdFactura`) REFERENCES `clientes` (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,2,'362163','Cll65',NULL,30000),(2,1,'3713971379','CLL76',NULL,10000),(3,5,'319289','CLL45',NULL,80000),(4,3,'37823719','CLL78',NULL,100000);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generarventa`
--

DROP TABLE IF EXISTS `generarventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generarventa` (
  `GVCantidad` int NOT NULL,
  PRIMARY KEY (`GVCantidad`),
  CONSTRAINT `fkventa` FOREIGN KEY (`GVCantidad`) REFERENCES `venta` (`VenIdFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generarventa`
--

LOCK TABLES `generarventa` WRITE;
/*!40000 ALTER TABLE `generarventa` DISABLE KEYS */;
INSERT INTO `generarventa` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `generarventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listartrigger`
--

DROP TABLE IF EXISTS `listartrigger`;
/*!50001 DROP VIEW IF EXISTS `listartrigger`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listartrigger` AS SELECT 
 1 AS `base_datos`,
 1 AS `nombre`,
 1 AS `evento`,
 1 AS `tabla`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loginventario`
--

DROP TABLE IF EXISTS `loginventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginventario` (
  `Id` int DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `ValorN` varchar(50) DEFAULT NULL,
  `ValorV` varchar(50) DEFAULT NULL,
  `Operacion` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginventario`
--

LOCK TABLES `loginventario` WRITE;
/*!40000 ALTER TABLE `loginventario` DISABLE KEYS */;
INSERT INTO `loginventario` VALUES (1,'jean','2022-09-28 06:43:33','root@localhost','3',NULL,'I'),(2,'polo','2022-09-28 07:01:18','root@localhost','4',NULL,'I'),(3,'chate jean','2022-09-28 07:01:18','root@localhost','2',NULL,'I'),(4,'cuello toturga','2022-09-28 07:01:18','root@localhost','3',NULL,'I'),(3,'chate jean','2022-09-28 07:01:46','root@localhost','2','2','A'),(3,'chate jean','2022-09-28 07:02:06','root@localhost','2','2','A'),(2,'polo','2022-09-28 07:02:17','root@localhost','4','4','A'),(4,'cuello toturga','2022-09-28 07:03:03','root@localhost',NULL,'3','B');
/*!40000 ALTER TABLE `loginventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `IdProducto` int NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(45) DEFAULT NULL,
  `PrecioProducto` double DEFAULT NULL,
  `EstadoProducto` varchar(45) DEFAULT NULL,
  `CantidadProducto` int DEFAULT NULL,
  `CategoriaProducto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  CONSTRAINT `fkgenerarventa` FOREIGN KEY (`IdProducto`) REFERENCES `generarventa` (`GVCantidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'jean',300000,'EXITENTE',3,'pantalon'),(2,'polo',20000,'EXITENTE',4,''),(3,'chaqueta jean',42000,'EXISTENTE',2,'chaqueta');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `IdProveedor` int NOT NULL AUTO_INCREMENT,
  `NombreProveedor` varchar(45) DEFAULT NULL,
  `ApellidoProveedor` varchar(45) DEFAULT NULL,
  `N.Documento` int DEFAULT NULL,
  `CantidadPrendas` int DEFAULT NULL,
  `EmailProveedor` varchar(45) DEFAULT NULL,
  `EstadoProveedor` varchar(45) DEFAULT NULL,
  `TelefonoProveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'LORENA',NULL,NULL,3,'BLORENA','ACTIVO','74384928'),(2,'CAMILA',NULL,NULL,4,'BCAMILA','ACTIVO','727391328');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `IdVendedor` int NOT NULL,
  `NombreVendedor` varchar(45) DEFAULT NULL,
  `TelefonoVendedor` varchar(45) DEFAULT NULL,
  `EstadoVendedor` varchar(45) DEFAULT NULL,
  `DireccionVendedor` varchar(45) DEFAULT NULL,
  `ComisionesVendedor` double DEFAULT NULL,
  `EmailVendedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'MARTIN','3828237','ACTIVO','CLL65',3,'GMARTIN'),(2,'SOFIA','237482','ACTIVO','CLL78',3,'LCARLOS'),(3,'JULIO','346789837','ACTIVO','CLL34',5,'PJULIO'),(4,'ROBERTO','4356789323','ACTIVO','CLL56',9,'LROBERTO');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `VenIdFactura` int NOT NULL AUTO_INCREMENT,
  `VenIdCodigo` int DEFAULT NULL,
  `VenIDCantidad` int DEFAULT NULL,
  PRIMARY KEY (`VenIdFactura`),
  CONSTRAINT `fkfacturaventa` FOREIGN KEY (`VenIdFactura`) REFERENCES `facturas` (`IdFactura`),
  CONSTRAINT `fkvendedorventa` FOREIGN KEY (`VenIdFactura`) REFERENCES `vendedor` (`IdVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,3),(2,1,2),(3,2,5),(4,3,5);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `consultar_estado_cliente`
--

/*!50001 DROP VIEW IF EXISTS `consultar_estado_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultar_estado_cliente` AS select `clientes`.`idClientes` AS `idClientes`,`clientes`.`NombreCliente` AS `NombreCliente`,`clientes`.`TelefonoClientes` AS `TelefonoClientes`,`clientes`.`EmailClientes` AS `EmailClientes`,`clientes`.`DireccionCLientes` AS `DireccionClientes`,`clientes`.`EstadoCLientes` AS `EstadoClientes` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listartrigger`
--

/*!50001 DROP VIEW IF EXISTS `listartrigger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listartrigger` AS select `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `base_datos`,`information_schema`.`triggers`.`TRIGGER_NAME` AS `nombre`,`information_schema`.`triggers`.`EVENT_MANIPULATION` AS `evento`,`information_schema`.`triggers`.`EVENT_OBJECT_TABLE` AS `tabla` from `information_schema`.`TRIGGERS` */;
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

-- Dump completed on 2022-11-05 22:53:13
