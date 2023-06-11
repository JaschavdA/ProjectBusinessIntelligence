USE [master]
GO
/****** Object:  Database [KramseRaw]    Script Date: 2023-03-30 12:21:58 ******/
CREATE DATABASE [KramseRaw]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KramseRaw', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseRaw.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KramseRaw_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseRaw_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KramseRaw] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KramseRaw].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KramseRaw] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KramseRaw] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KramseRaw] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KramseRaw] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KramseRaw] SET ARITHABORT OFF 
GO
ALTER DATABASE [KramseRaw] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KramseRaw] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KramseRaw] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KramseRaw] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KramseRaw] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KramseRaw] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KramseRaw] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KramseRaw] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KramseRaw] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KramseRaw] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KramseRaw] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KramseRaw] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KramseRaw] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KramseRaw] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KramseRaw] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KramseRaw] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KramseRaw] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KramseRaw] SET RECOVERY FULL 
GO
ALTER DATABASE [KramseRaw] SET  MULTI_USER 
GO
ALTER DATABASE [KramseRaw] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KramseRaw] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KramseRaw] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KramseRaw] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KramseRaw] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KramseRaw] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KramseRaw', N'ON'
GO
ALTER DATABASE [KramseRaw] SET QUERY_STORE = ON
GO
ALTER DATABASE [KramseRaw] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KramseRaw]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 2023-03-30 12:21:58 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Consignor]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignor](
	[Id] [float] NULL,
	[Consignor] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Discount] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container v3]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container v3](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RefrigerationFlag] [bit] NOT NULL,
	[PowerFlag] [nvarchar](50) NOT NULL,
	[Length] [float] NOT NULL,
	[Cubes] [float] NOT NULL,
	[EuroPricePerKm] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_key] [int] NULL,
	[item_description] [nvarchar](50) NULL,
	[item_category] [nvarchar](50) NULL,
	[item_mfgr] [nvarchar](50) NULL,
	[item_storage_type] [nvarchar](50) NULL,
	[item_hazard_flag] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRVPublication]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRVPublication](
	[IMO Number] [nvarchar](255) NULL,
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
	[Average density of the cargo transported (m tonnes / m³)] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Port]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Port](
	[P_PortOrder] [nvarchar](50) NULL,
	[VPS_PortId] [int] NOT NULL,
	[P_PortName] [nvarchar](50) NULL,
	[P_Country] [nvarchar](50) NULL,
	[P_DistanceFromOslo] [int] NULL,
	[P_DistanceFromPiraeus] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[VS_Shipid] [int] NOT NULL,
	[Sh_Shipname] [nvarchar](50) NULL,
	[Sh_MaxTEU] [int] NULL,
	[Sh_SpeedInKnots] [int] NULL,
	[Sh_SpeedInKm_H] [int] NULL,
	[Sh_Country] [nvarchar](50) NULL,
	[Sh_Yearcost] [money] NULL,
	[Sh_Length] [int] NULL,
	[Sh_Width] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 2023-03-30 12:21:58 ******/
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
	[NumberContainers] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetail]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetail](
	[ShipmentId] [int] NULL,
	[ContainerNr] [nvarchar](50) NULL,
	[Item] [int] NULL,
	[ContainertypeId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voyage]    Script Date: 2023-03-30 12:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voyage](
	[VV_VoyageId] [int] NOT NULL,
	[VS_ShipId] [int] NULL,
	[V_DateDepartVoyage] [datetime] NULL,
	[VPS_PortIdStart] [int] NULL,
	[V_PortIdEnd] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoyagePort]    Script Date: 2023-03-30 12:21:58 ******/
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
	[Vp_PortOrder] [nvarchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [KramseRaw] SET  READ_WRITE 
GO
