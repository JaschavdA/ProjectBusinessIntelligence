USE [master]
GO
/****** Object:  Database [KramseODS]    Script Date: 2023-03-30 12:29:46 ******/
CREATE DATABASE [KramseODS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KramseODS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseODS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KramseODS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLDEV2022\MSSQL\DATA\KramseODS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KramseODS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KramseODS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KramseODS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KramseODS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KramseODS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KramseODS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KramseODS] SET ARITHABORT OFF 
GO
ALTER DATABASE [KramseODS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KramseODS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KramseODS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KramseODS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KramseODS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KramseODS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KramseODS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KramseODS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KramseODS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KramseODS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KramseODS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KramseODS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KramseODS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KramseODS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KramseODS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KramseODS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KramseODS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KramseODS] SET RECOVERY FULL 
GO
ALTER DATABASE [KramseODS] SET  MULTI_USER 
GO
ALTER DATABASE [KramseODS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KramseODS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KramseODS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KramseODS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KramseODS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KramseODS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KramseODS', N'ON'
GO
ALTER DATABASE [KramseODS] SET QUERY_STORE = ON
GO
ALTER DATABASE [KramseODS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KramseODS]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 2023-03-30 12:29:46 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[D_Consignor]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Consignor](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[CountryISO3] [nvarchar](3) NOT NULL,
	[Discount] [int] NOT NULL,
	[Date_Effective] [date] NOT NULL,
	[Date_Expired] [date] NULL,
 CONSTRAINT [PK_Consignor] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Container]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Container](
	[ContainerRowId] [int] IDENTITY(1,1) NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Refrigerated] [bit] NOT NULL,
	[USD_Price_Per_KM] [decimal](18, 2) NOT NULL,
	[TEU] [int] NOT NULL,
	[Date_Effective] [date] NOT NULL,
	[Date_Expired] [date] NULL,
 CONSTRAINT [PK_D_Container] PRIMARY KEY CLUSTERED 
(
	[ContainerRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Item]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Item](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Storage_Type] [nvarchar](50) NOT NULL,
	[Hazard_Flag] [nvarchar](50) NOT NULL,
	[Date_Effective] [date] NOT NULL,
	[Date_Expired] [date] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Port]    Script Date: 2023-03-30 12:29:46 ******/
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
 CONSTRAINT [PK_D_Port_1] PRIMARY KEY CLUSTERED 
(
	[PortId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Ship]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Ship](
	[ShipRowId] [int] IDENTITY(1,1) NOT NULL,
	[Ship_Name] [nvarchar](255) NOT NULL,
	[ShipId] [int] NOT NULL,
	[Max_TEU] [int] NOT NULL,
	[Speed_In_Knots] [int] NOT NULL,
	[Speed_In_Kmh] [int] NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[CountryISO3] [nvarchar](3) NOT NULL,
	[Yearly_Fixed_Costs] [int] NOT NULL,
	[Avg_Fuel_Use_Per_Km_In_Kg] [decimal](18, 2) NOT NULL,
	[Fuel_Co2_Ratio] [decimal](18, 2) NOT NULL,
	[Date_Effective] [date] NOT NULL,
	[Date_Expired] [date] NULL,
	[Ship_Length] [int] NULL,
	[Ship_Width] [int] NULL,
 CONSTRAINT [PK_D_Ship_1] PRIMARY KEY CLUSTERED 
(
	[ShipRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[D_Time]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Half_Year] [datetime] NULL,
	[Half_Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Trimester] [datetime] NULL,
	[Trimester_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Ten_Days] [datetime] NULL,
	[Ten_Days_Name] [nvarchar](50) NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Half_Year] [int] NULL,
	[Day_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Trimester] [int] NULL,
	[Day_Of_Trimester_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Day_Of_Ten_Days] [int] NULL,
	[Day_Of_Ten_Days_Name] [nvarchar](50) NULL,
	[Day_Of_Week] [int] NULL,
	[Day_Of_Week_Name] [nvarchar](50) NULL,
	[Week_Of_Year] [int] NULL,
	[Week_Of_Year_Name] [nvarchar](50) NULL,
	[Ten_Days_Of_Year] [int] NULL,
	[Ten_Days_Of_Year_Name] [nvarchar](50) NULL,
	[Ten_Days_Of_Half_Year] [int] NULL,
	[Ten_Days_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Ten_Days_Of_Trimester] [int] NULL,
	[Ten_Days_Of_Trimester_Name] [nvarchar](50) NULL,
	[Ten_Days_Of_Quarter] [int] NULL,
	[Ten_Days_Of_Quarter_Name] [nvarchar](50) NULL,
	[Ten_Days_Of_Month] [int] NULL,
	[Ten_Days_Of_Month_Name] [nvarchar](50) NULL,
	[Month_Of_Year] [int] NULL,
	[Month_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Half_Year] [int] NULL,
	[Month_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Trimester] [int] NULL,
	[Month_Of_Trimester_Name] [nvarchar](50) NULL,
	[Month_Of_Quarter] [int] NULL,
	[Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_Of_Year] [int] NULL,
	[Quarter_Of_Year_Name] [nvarchar](50) NULL,
	[Quarter_Of_Half_Year] [int] NULL,
	[Quarter_Of_Half_Year_Name] [nvarchar](50) NULL,
	[Trimester_Of_Year] [int] NULL,
	[Trimester_Of_Year_Name] [nvarchar](50) NULL,
	[Half_Year_Of_Year] [int] NULL,
	[Half_Year_Of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_D_Time] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_ShipFuelConsumption]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_ShipFuelConsumption](
	[ShipRowId] [int] NOT NULL,
	[CurrentPort] [int] NOT NULL,
	[NextPort] [int] NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[FuelConsumptionInKg] [decimal](18, 2) NOT NULL,
	[Distance] [int] NOT NULL,
	[TEU] [int] NOT NULL,
	[FuelUsePerTEU] [float] NOT NULL,
	[FuelCosts] [int] NOT NULL,
	[Co2Emissions] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_F_ShipFuelConsumption] PRIMARY KEY CLUSTERED 
(
	[ShipRowId] ASC,
	[CurrentPort] ASC,
	[NextPort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_ShipPortStay]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_ShipPortStay](
	[ShipRowId] [int] NOT NULL,
	[CurrentPort] [int] NOT NULL,
	[NextPort] [int] NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[StayDays] [int] NOT NULL,
	[PortCosts] [decimal](18, 2) NULL,
 CONSTRAINT [PK_F_ShipPortStay] PRIMARY KEY CLUSTERED 
(
	[ShipRowId] ASC,
	[CurrentPort] ASC,
	[NextPort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_VoyageShipment]    Script Date: 2023-03-30 12:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_VoyageShipment](
	[ShipRowId] [int] NOT NULL,
	[VoyageId] [int] NOT NULL,
	[Current_Port] [int] NOT NULL,
	[Next_Port] [int] NOT NULL,
	[TEU] [int] NOT NULL,
	[LoadPercentage] [decimal](18, 5) NOT NULL,
	[Start_Port] [int] NOT NULL,
	[End_Port] [int] NOT NULL,
	[ConsignorID] [int] NOT NULL,
	[Distance] [int] NOT NULL,
	[ContainerRowId] [int] NOT NULL,
	[ShipmentId] [int] NOT NULL,
	[ItemRowId] [int] NOT NULL,
	[ArrivalToNextPort] [datetime] NOT NULL,
	[DepartureFromCurrentPort] [datetime] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsRightContainerType] [bit] NOT NULL,
 CONSTRAINT [PK_F_VoyageShipment] PRIMARY KEY CLUSTERED 
(
	[ShipRowId] ASC,
	[VoyageId] ASC,
	[Current_Port] ASC,
	[Next_Port] ASC,
	[Start_Port] ASC,
	[End_Port] ASC,
	[ConsignorID] ASC,
	[ContainerRowId] ASC,
	[ShipmentId] ASC,
	[ItemRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[D_Consignor] ADD  CONSTRAINT [df_ConsignorDateEffective]  DEFAULT (getdate()) FOR [Date_Effective]
GO
ALTER TABLE [dbo].[D_Consignor] ADD  CONSTRAINT [df_ConsignorDateExpired]  DEFAULT (NULL) FOR [Date_Expired]
GO
ALTER TABLE [dbo].[D_Container] ADD  CONSTRAINT [df_DateEffective]  DEFAULT (getdate()) FOR [Date_Effective]
GO
ALTER TABLE [dbo].[D_Container] ADD  CONSTRAINT [df_DateExpired]  DEFAULT (NULL) FOR [Date_Expired]
GO
ALTER TABLE [dbo].[D_Ship] ADD  CONSTRAINT [df_ShipEffective]  DEFAULT (getdate()) FOR [Date_Effective]
GO
ALTER TABLE [dbo].[D_Ship] ADD  CONSTRAINT [df_ShipExpired]  DEFAULT (NULL) FOR [Date_Expired]
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipFuelConsumption_D_Port] FOREIGN KEY([CurrentPort])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption] CHECK CONSTRAINT [FK_F_ShipFuelConsumption_D_Port]
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipFuelConsumption_D_Port1] FOREIGN KEY([NextPort])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption] CHECK CONSTRAINT [FK_F_ShipFuelConsumption_D_Port1]
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipFuelConsumption_D_Ship] FOREIGN KEY([ShipRowId])
REFERENCES [dbo].[D_Ship] ([ShipRowId])
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption] CHECK CONSTRAINT [FK_F_ShipFuelConsumption_D_Ship]
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipFuelConsumption_D_Time] FOREIGN KEY([ArrivalDate])
REFERENCES [dbo].[D_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption] CHECK CONSTRAINT [FK_F_ShipFuelConsumption_D_Time]
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipFuelConsumption_D_Time1] FOREIGN KEY([DepartureDate])
REFERENCES [dbo].[D_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_ShipFuelConsumption] CHECK CONSTRAINT [FK_F_ShipFuelConsumption_D_Time1]
GO
ALTER TABLE [dbo].[F_ShipPortStay]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipPortStay_D_Port] FOREIGN KEY([CurrentPort])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_ShipPortStay] CHECK CONSTRAINT [FK_F_ShipPortStay_D_Port]
GO
ALTER TABLE [dbo].[F_ShipPortStay]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipPortStay_D_Port1] FOREIGN KEY([NextPort])
REFERENCES [dbo].[D_Port] ([PortId])
GO
ALTER TABLE [dbo].[F_ShipPortStay] CHECK CONSTRAINT [FK_F_ShipPortStay_D_Port1]
GO
ALTER TABLE [dbo].[F_ShipPortStay]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipPortStay_D_Ship] FOREIGN KEY([ShipRowId])
REFERENCES [dbo].[D_Ship] ([ShipRowId])
GO
ALTER TABLE [dbo].[F_ShipPortStay] CHECK CONSTRAINT [FK_F_ShipPortStay_D_Ship]
GO
ALTER TABLE [dbo].[F_ShipPortStay]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipPortStay_D_Time] FOREIGN KEY([ArrivalDate])
REFERENCES [dbo].[D_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_ShipPortStay] CHECK CONSTRAINT [FK_F_ShipPortStay_D_Time]
GO
ALTER TABLE [dbo].[F_ShipPortStay]  WITH CHECK ADD  CONSTRAINT [FK_F_ShipPortStay_D_Time1] FOREIGN KEY([DepartureDate])
REFERENCES [dbo].[D_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_ShipPortStay] CHECK CONSTRAINT [FK_F_ShipPortStay_D_Time1]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Consignor1] FOREIGN KEY([ConsignorID])
REFERENCES [dbo].[D_Consignor] ([RowId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Consignor1]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Container] FOREIGN KEY([ContainerRowId])
REFERENCES [dbo].[D_Container] ([ContainerRowId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Container]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Item] FOREIGN KEY([ItemRowId])
REFERENCES [dbo].[D_Item] ([RowId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Item]
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
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Ship] FOREIGN KEY([ShipRowId])
REFERENCES [dbo].[D_Ship] ([ShipRowId])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Ship]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Time] FOREIGN KEY([ArrivalToNextPort])
REFERENCES [dbo].[D_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Time]
GO
ALTER TABLE [dbo].[F_VoyageShipment]  WITH CHECK ADD  CONSTRAINT [FK_F_VoyageShipment_D_Time1] FOREIGN KEY([DepartureFromCurrentPort])
REFERENCES [dbo].[D_Time] ([PK_Date])
GO
ALTER TABLE [dbo].[F_VoyageShipment] CHECK CONSTRAINT [FK_F_VoyageShipment_D_Time1]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Half_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Half_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Trimester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Trimester_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Half_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Half_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Trimester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Trimester_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Ten_Days'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Ten_Days' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Ten_Days'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Ten_Days_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Ten_Days_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Ten_Days_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Half_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Half_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Trimester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Trimester_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Ten_Days_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Ten_Days_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Half_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Half_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Trimester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Trimester'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Trimester_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Trimester_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Half_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Half_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Half_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Half_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Trimester_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Trimester_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Trimester_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Half_Year_Of_Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Half_Year_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'COLUMN',@level2name=N'Half_Year_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time', @level2type=N'CONSTRAINT',@level2name=N'PK_D_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'D_Time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'559ed144-b7e1-409c-88c9-a1f21e60bdf8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'D_Time'
GO
USE [master]
GO
ALTER DATABASE [KramseODS] SET  READ_WRITE 
GO
