USE [master]
GO
/****** Object:  Database [KramseDataWarehouse]    Script Date: 2023-03-30 12:28:06 ******/
CREATE DATABASE [KramseDataWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KramseDataMart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseDataMart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KramseDataMart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseDataMart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KramseDataWarehouse] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KramseDataWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KramseDataWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KramseDataWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KramseDataWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KramseDataWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KramseDataWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [KramseDataWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [KramseDataWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KramseDataWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KramseDataWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KramseDataWarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KramseDataWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KramseDataWarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KramseDataWarehouse', N'ON'
GO
ALTER DATABASE [KramseDataWarehouse] SET QUERY_STORE = ON
GO
ALTER DATABASE [KramseDataWarehouse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KramseDataWarehouse]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 2023-03-30 12:28:06 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[D_Consignor]    Script Date: 2023-03-30 12:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Consignor](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[CountryISO3] [nvarchar](3) NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Consignor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Container]    Script Date: 2023-03-30 12:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Container](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Refrigerated] [bit] NOT NULL,
	[USD_Price_Per_KM] [decimal](18, 2) NOT NULL,
	[TEU] [int] NOT NULL,
 CONSTRAINT [PK_D_Container] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Item]    Script Date: 2023-03-30 12:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Item](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Storage_Type] [nvarchar](50) NOT NULL,
	[Hazard_Flag] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Port]    Script Date: 2023-03-30 12:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Port](
	[PortId] [int] NOT NULL,
	[Port_Name] [nvarchar](50) NOT NULL,
	[Port_Country] [nvarchar](50) NOT NULL,
	[Port_Country_ISO3] [nvarchar](3) NOT NULL,
	[Distance_From_Oslo] [int] NOT NULL,
	[Distance_From_Piraeus] [int] NOT NULL,
	[YearlyFixedCost] [int] NULL,
 CONSTRAINT [PK_D_Port] PRIMARY KEY CLUSTERED 
(
	[PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Ship]    Script Date: 2023-03-30 12:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Ship](
	[Ship_Name] [nvarchar](255) NOT NULL,
	[VS_ShipId] [int] NOT NULL,
	[Max_TEU] [int] NOT NULL,
	[Speed_In_Knots] [int] NOT NULL,
	[Speed_In_Kmh] [int] NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[CountryISO3] [nvarchar](3) NOT NULL,
	[Average_Fuel_Use_Per_Km_In_Kg] [decimal](18, 2) NULL,
	[Fuel_Co2_Ratio] [decimal](18, 2) NULL,
	[Yearly_Fixed_Cost] [int] NULL,
	[Ship_Length] [int] NULL,
	[Ship_Width] [int] NULL,
 CONSTRAINT [PK_D_Ship_1] PRIMARY KEY CLUSTERED 
(
	[VS_ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [CK_VS_ShipId] UNIQUE NONCLUSTERED 
(
	[VS_ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_VoyageShipment]    Script Date: 2023-03-30 12:28:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_VoyageShipment](
	[ShipId] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[Current_Port] [int] NOT NULL,
	[Next_Port] [int] NOT NULL,
	[TEU] [int] NOT NULL,
	[Start_Port] [int] NOT NULL,
	[End_Port] [int] NOT NULL,
	[ConsignorID] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[ShipmentId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ArrivalToNextPort] [datetime] NOT NULL,
	[DepartureFromCurrentPort] [datetime] NOT NULL,
	[ContainerAmount] [int] NULL,
 CONSTRAINT [PK_F_VoyageShipment] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC,
	[VoyageId] ASC,
	[Current_Port] ASC,
	[Next_Port] ASC,
	[Start_Port] ASC,
	[End_Port] ASC,
	[ConsignorID] ASC,
	[ContainerTypeId] ASC,
	[ShipmentId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageLeg_D_Ship1] FOREIGN KEY([ShipId])
REFERENCES [dbo].[D_Ship] ([VS_ShipId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageLeg_D_Ship1]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Consignor] FOREIGN KEY([ConsignorID])
REFERENCES [dbo].[D_Consignor] ([Id])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Consignor]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Container] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[D_Container] ([Id])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Container]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Port] FOREIGN KEY([Current_Port])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Port]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Port1] FOREIGN KEY([Next_Port])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Port1]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Port2] FOREIGN KEY([Start_Port])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Port2]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Port3] FOREIGN KEY([End_Port])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Port3]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[D_Item] ([Id])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_Item]
GO
USE [master]
GO
ALTER DATABASE [KramseDataWarehouse] SET  READ_WRITE 
GO
