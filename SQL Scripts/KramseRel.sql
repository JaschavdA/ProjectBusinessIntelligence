USE [master]
GO
/****** Object:  Database [KramseRel]    Script Date: 2023-03-30 12:23:27 ******/
CREATE DATABASE [KramseRel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KramsePSA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramsePSA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KramsePSA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramsePSA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KramseRel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KramseRel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KramseRel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KramseRel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KramseRel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KramseRel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KramseRel] SET ARITHABORT OFF 
GO
ALTER DATABASE [KramseRel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KramseRel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KramseRel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KramseRel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KramseRel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KramseRel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KramseRel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KramseRel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KramseRel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KramseRel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KramseRel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KramseRel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KramseRel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KramseRel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KramseRel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KramseRel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KramseRel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KramseRel] SET RECOVERY FULL 
GO
ALTER DATABASE [KramseRel] SET  MULTI_USER 
GO
ALTER DATABASE [KramseRel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KramseRel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KramseRel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KramseRel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KramseRel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KramseRel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KramseRel', N'ON'
GO
ALTER DATABASE [KramseRel] SET QUERY_STORE = ON
GO
ALTER DATABASE [KramseRel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KramseRel]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 2023-03-30 12:23:27 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Consignor]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignor](
	[Id] [int] NOT NULL,
	[Consignor] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NOT NULL,
	[CountryISO3] [nvarchar](3) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Consignor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RefrigerationFlag] [bit] NOT NULL,
	[EuroPricePerKm] [float] NOT NULL,
	[TEU] [tinyint] NOT NULL,
 CONSTRAINT [PK_Container v3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_key] [int] NOT NULL,
	[item_description] [nvarchar](50) NULL,
	[item_category] [nvarchar](50) NULL,
	[item_mfgr] [nvarchar](50) NULL,
	[item_storage_type] [nvarchar](50) NULL,
	[item_hazard_flag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRVPublication]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRVPublication](
	[IMO Number] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Ship type] [nvarchar](255) NULL,
	[Reporting Period] [float] NULL,
	[Technical efficiency] [nvarchar](255) NULL,
	[Port of Registry] [nvarchar](255) NULL,
	[Home Port] [nvarchar](255) NULL,
	[Ice Class] [nvarchar](255) NULL,
	[Verifier Number] [nvarchar](255) NULL,
	[Verifier Name] [nvarchar](255) NULL,
	[Verifier NAB] [nvarchar](255) NULL,
	[Verifier Address] [nvarchar](255) NULL,
	[Verifier City] [nvarchar](255) NULL,
	[Verifier Accreditation number] [nvarchar](255) NULL,
	[Verifier Country] [nvarchar](255) NULL,
	[A] [nvarchar](255) NULL,
	[B] [nvarchar](255) NULL,
	[C] [nvarchar](255) NULL,
	[D] [nvarchar](255) NULL,
	[Total fuel consumption (m tonnes)] [float] NULL,
	[Fuel consumptions assigned to On laden (m tonnes)] [nvarchar](255) NULL,
	[Total CO₂ emissions (m tonnes)] [float] NULL,
	[CO₂ emissions from all voyages between ports under a MS jurisdic] [float] NULL,
	[CO₂ emissions from all voyages which departed from ports under a] [float] NULL,
	[CO₂ emissions from all voyages to ports under a MS jurisdiction ] [float] NULL,
	[CO₂ emissions which occurred within ports under a MS jurisdictio] [float] NULL,
	[CO₂ emissions assigned to Passenger transport (m tonnes)] [nvarchar](255) NULL,
	[CO₂ emissions assigned to Freight transport (m tonnes)] [nvarchar](255) NULL,
	[CO₂ emissions assigned to On laden (m tonnes)] [nvarchar](255) NULL,
	[Annual Total time spent at sea (hours)] [float] NULL,
	[Annual average Fuel consumption per distance (kg / n mile)] [float] NULL,
	[Annual average Fuel consumption per transport work (mass) (g / m] [float] NULL,
	[Annual average Fuel consumption per transport work (volume) (g /] [nvarchar](255) NULL,
	[Annual average Fuel consumption per transport work (dwt) (g / dw] [nvarchar](255) NULL,
	[Annual average Fuel consumption per transport work (pax) (g / pa] [nvarchar](255) NULL,
	[Annual average Fuel consumption per transport work (freight) (g ] [nvarchar](255) NULL,
	[Annual average CO₂ emissions per distance (kg CO₂ / n mile)] [float] NULL,
	[Annual average CO₂ emissions per transport work (mass) (g CO₂ / ] [float] NULL,
	[Annual average CO₂ emissions per transport work (volume) (g CO₂ ] [nvarchar](255) NULL,
	[Annual average CO₂ emissions per transport work (dwt) (g CO₂ / d] [nvarchar](255) NULL,
	[Annual average CO₂ emissions per transport work (pax) (g CO₂ / p] [nvarchar](255) NULL,
	[Annual average CO₂ emissions per transport work (freight) (g CO₂] [nvarchar](255) NULL,
	[Through ice (n miles)] [nvarchar](255) NULL,
	[Total time spent at sea (hours)] [float] NULL,
	[Total time spent at sea through ice (hours)] [nvarchar](255) NULL,
	[Fuel consumption per distance on laden voyages (kg / n mile)] [nvarchar](255) NULL,
	[Fuel consumption per transport work (mass) on laden voyages (g /] [nvarchar](255) NULL,
	[Fuel consumption per transport work (volume) on laden voyages (g] [nvarchar](255) NULL,
	[Fuel consumption per transport work (dwt) on laden voyages (g / ] [nvarchar](255) NULL,
	[Fuel consumption per transport work (pax) on laden voyages (g / ] [nvarchar](255) NULL,
	[Fuel consumption per transport work (freight) on laden voyages (] [nvarchar](255) NULL,
	[CO₂ emissions per distance on laden voyages (kg CO₂ / n mile)] [nvarchar](255) NULL,
	[CO₂ emissions per transport work (mass) on laden voyages (g CO₂ ] [nvarchar](255) NULL,
	[CO₂ emissions per transport work (volume) on laden voyages (g CO] [nvarchar](255) NULL,
	[CO₂ emissions per transport work (dwt) on laden voyages (g CO₂ /] [nvarchar](255) NULL,
	[CO₂ emissions per transport work (pax) on laden voyages (g CO₂ /] [nvarchar](255) NULL,
	[CO₂ emissions per transport work (freight) on laden voyages (g C] [nvarchar](255) NULL,
	[Additional information to facilitate the understanding of the re] [nvarchar](255) NULL,
	[Average density of the cargo transported (m tonnes / m³)] [nvarchar](255) NULL,
 CONSTRAINT [PK_MRVPublication] PRIMARY KEY CLUSTERED 
(
	[IMO Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__MRVPubli__737584F6C4EB25EE] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[P_PortOrder] [nvarchar](50) NULL,
	[VPS_PortId] [int] NOT NULL,
	[P_PortName] [nvarchar](50) NULL,
	[P_Country] [nvarchar](50) NULL,
	[P_Country_ISO3] [nvarchar](3) NULL,
	[P_DistanceFromOslo] [int] NULL,
	[P_DistanceFromPiraeus] [int] NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[VPS_PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[VS_Shipid] [int] NOT NULL,
	[Sh_Shipname] [nvarchar](255) NULL,
	[Sh_MaxTEU] [int] NULL,
	[Sh_SpeedInKnots] [int] NULL,
	[Sh_SpeedInKm_H] [int] NULL,
	[Sh_Country] [nvarchar](50) NULL,
	[Sh_Country_ISO3] [nvarchar](3) NULL,
	[Sh_Yearcost] [money] NULL,
	[Sh_Length] [int] NULL,
	[Sh_Width] [int] NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[VS_Shipid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] NOT NULL,
	[VoyageId] [int] NULL,
	[ConsignorId] [int] NULL,
	[PortIdFrom] [int] NULL,
	[PortIdTo] [int] NULL,
	[Distance] [int] NULL,
	[NumberContainers] [int] NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[ContainertypeId] [int] NOT NULL,
	[AmountOfContainers] [int] NOT NULL,
	[TEU] [int] NULL,
 CONSTRAINT [PK_ShipmentDetail_1] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC,
	[Item] ASC,
	[ContainertypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[VV_VoyageId] [int] NOT NULL,
	[VS_ShipId] [int] NULL,
	[V_DateDepartVoyage] [datetime] NULL,
	[VPS_PortIdStart] [int] NULL,
	[V_PortIdEnd] [int] NULL,
 CONSTRAINT [PK_Voyage] PRIMARY KEY CLUSTERED 
(
	[VV_VoyageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 2023-03-30 12:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoyagePort](
	[VV_VoyageId] [int] NOT NULL,
	[VP_PortIdCurrent] [int] NOT NULL,
	[Vp_PortIdNext] [int] NOT NULL,
	[Vp_LegDateDepart] [datetime] NULL,
	[Vp_LegDateArrival] [datetime] NULL,
	[Vp_Traject_Distance] [int] NULL,
	[DaysInPort] [int] NULL,
 CONSTRAINT [PK_VoyagePort] PRIMARY KEY CLUSTERED 
(
	[VV_VoyageId] ASC,
	[VP_PortIdCurrent] ASC,
	[Vp_PortIdNext] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_MRVPublication] FOREIGN KEY([Sh_Shipname])
REFERENCES [dbo].[MRVPublication] ([Name])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_MRVPublication]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_MRVPublication1] FOREIGN KEY([Sh_Shipname])
REFERENCES [dbo].[MRVPublication] ([Name])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_MRVPublication1]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Consignor] FOREIGN KEY([ConsignorId])
REFERENCES [dbo].[Consignor] ([Id])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Consignor]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Voyage] FOREIGN KEY([VoyageId])
REFERENCES [dbo].[Voyage] ([VV_VoyageId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Voyage]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Container] FOREIGN KEY([ContainertypeId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Container]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Item] FOREIGN KEY([Item])
REFERENCES [dbo].[Item] ([item_key])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Item]
GO
ALTER TABLE [dbo].[ShipmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetail_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([ShipmentId])
GO
ALTER TABLE [dbo].[ShipmentDetail] CHECK CONSTRAINT [FK_ShipmentDetail_Shipment]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port] FOREIGN KEY([VPS_PortIdStart])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Port]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Port1] FOREIGN KEY([V_PortIdEnd])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Port1]
GO
ALTER TABLE [dbo].[Voyage]  WITH CHECK ADD  CONSTRAINT [FK_Voyage_Ship1] FOREIGN KEY([VS_ShipId])
REFERENCES [dbo].[Ship] ([VS_Shipid])
GO
ALTER TABLE [dbo].[Voyage] CHECK CONSTRAINT [FK_Voyage_Ship1]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Port] FOREIGN KEY([VP_PortIdCurrent])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Port]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Port1] FOREIGN KEY([Vp_PortIdNext])
REFERENCES [dbo].[Port] ([VPS_PortId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Port1]
GO
ALTER TABLE [dbo].[VoyagePort]  WITH CHECK ADD  CONSTRAINT [FK_VoyagePort_Voyage] FOREIGN KEY([VV_VoyageId])
REFERENCES [dbo].[Voyage] ([VV_VoyageId])
GO
ALTER TABLE [dbo].[VoyagePort] CHECK CONSTRAINT [FK_VoyagePort_Voyage]
GO
USE [master]
GO
ALTER DATABASE [KramseRel] SET  READ_WRITE 
GO
