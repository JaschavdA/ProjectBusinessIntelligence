USE [master]
GO
/****** Object:  Database [KramseCleanup]    Script Date: 2023-03-30 12:24:50 ******/
CREATE DATABASE [KramseCleanup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KramseCleanup', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseCleanup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KramseCleanup_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseCleanup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KramseCleanup] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KramseCleanup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KramseCleanup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KramseCleanup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KramseCleanup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KramseCleanup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KramseCleanup] SET ARITHABORT OFF 
GO
ALTER DATABASE [KramseCleanup] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KramseCleanup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KramseCleanup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KramseCleanup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KramseCleanup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KramseCleanup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KramseCleanup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KramseCleanup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KramseCleanup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KramseCleanup] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KramseCleanup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KramseCleanup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KramseCleanup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KramseCleanup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KramseCleanup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KramseCleanup] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KramseCleanup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KramseCleanup] SET RECOVERY FULL 
GO
ALTER DATABASE [KramseCleanup] SET  MULTI_USER 
GO
ALTER DATABASE [KramseCleanup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KramseCleanup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KramseCleanup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KramseCleanup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KramseCleanup] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KramseCleanup] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KramseCleanup', N'ON'
GO
ALTER DATABASE [KramseCleanup] SET QUERY_STORE = ON
GO
ALTER DATABASE [KramseCleanup] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KramseCleanup]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 2023-03-30 12:24:50 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ContainerType]    Script Date: 2023-03-30 12:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerType](
	[ProperType] [nvarchar](50) NOT NULL,
	[QuestionableType] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2023-03-30 12:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Country] [nvarchar](255) NOT NULL,
	[CountryISO3] [nvarchar](3) NULL,
	[CountryEN] [nvarchar](255) NULL,
 CONSTRAINT [PK_Country_1] PRIMARY KEY CLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Standard', N'Standard')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Protected', N'Protected')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Safe', N'Safe')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Secret', N'Secret')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Anti-Explosion', N'Anti-Explosion')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Anti-Explosion', N'Anti-Explosive')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Refrigeration', N'Refrigeration')
GO
INSERT [dbo].[ContainerType] ([ProperType], [QuestionableType]) VALUES (N'Anti-Explosion', N'anti-explosion')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'BE', N'BEL', N'Belgium   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Belgie', N'BEL', N'Belgium   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'België', N'BEL', N'Belgium   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Belgique', N'BEL', N'Belgium   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Belgium', N'BEL', N'Belgium   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Brazilië', N'BRA', N'Brazil    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Canada', N'CAN', N'Canada    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'China', N'CHN', N'China')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Croatia', N'HRV', N'Croatia   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Denmark', N'DNK', N'Denmark')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Deutschland', N'DEU', N'Germany   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'England', N'GBR', N'United Kingdom')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Estonia', N'EST', N'Estonia   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Finland', N'FIN', N'Finland   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'FR', N'FRA', N'France    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'France', N'FRA', N'France    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Francia', N'FRA', N'France    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Frankrijk', N'FRA', N'France')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Germany', N'DEU', N'Germany   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Gibraltar', N'GIB', N'Gibraltar ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Great Britain', N'GBR', N'United Kingdom')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Greece', N'GRC', N'Greece    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Griekenland', N'GRC', N'Greece    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Hong Kong', N'HKG', N'Hong Kong')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Ireland', N'IRL', N'Ireland   ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Italia', N'ITA', N'Italy     ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Italy', N'ITA', N'Italy     ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Liberia', N'LBR', N'Liberia')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Marshalleilanden', N'MHL', N'Marshall Islands')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Nederland', N'NLD', N'The Netherlands')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Netherlands', N'NLD', N'The Netherlands')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'NL', N'NLD', N'The Netherlands')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Norway', N'NOR', N'Norway    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Panama', N'PAN', N'Panama')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Poland', N'POL', N'Poland    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Polska', N'POL', N'Poland    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Portugal', N'PRT', N'Portugal  ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Rusland', N'RUS', N'Russia    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Scotland', N'GBR', N'United Kingdom')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Spain', N'ESP', N'Spain     ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Sweden', N'SWE', N'Sweden    ')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Switzerland', N'CHE', N'Switzerland')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'UK', N'GBR', N'United Kingdom')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'United Kingdom', N'GBR', N'United Kingdom')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Unknown', N'N.A', N'Unknown')
GO
INSERT [dbo].[Country] ([Country], [CountryISO3], [CountryEN]) VALUES (N'Yougoslavia', N'HRV', N'Croatia   ')
GO
USE [master]
GO
ALTER DATABASE [KramseCleanup] SET  READ_WRITE 
GO
