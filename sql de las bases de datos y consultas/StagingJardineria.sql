USE [master]
GO
/****** Object:  Database [StagingJardineria]    Script Date: 23/05/2024 15:40:56 ******/
CREATE DATABASE [StagingJardineria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StagingJardineria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StagingJardineria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StagingJardineria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\StagingJardineria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StagingJardineria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StagingJardineria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StagingJardineria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StagingJardineria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StagingJardineria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StagingJardineria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StagingJardineria] SET ARITHABORT OFF 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StagingJardineria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StagingJardineria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StagingJardineria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StagingJardineria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StagingJardineria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StagingJardineria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StagingJardineria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StagingJardineria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StagingJardineria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StagingJardineria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StagingJardineria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StagingJardineria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StagingJardineria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StagingJardineria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StagingJardineria] SET  MULTI_USER 
GO
ALTER DATABASE [StagingJardineria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StagingJardineria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StagingJardineria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StagingJardineria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StagingJardineria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StagingJardineria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StagingJardineria] SET QUERY_STORE = ON
GO
ALTER DATABASE [StagingJardineria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StagingJardineria]
GO
/****** Object:  Table [dbo].[DIM_CATEGORIA_DEST]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CATEGORIA_DEST](
	[Categoria] [nvarchar](50) NOT NULL,
	[Cantidad_Productos] [int] NULL,
 CONSTRAINT [PKCATE] PRIMARY KEY CLUSTERED 
(
	[Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_PRODUCTO_DEST]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PRODUCTO_DEST](
	[Nombre_Producto] [nvarchar](70) NOT NULL,
	[Total_Vendido] [int] NULL,
 CONSTRAINT [PKPROD] PRIMARY KEY CLUSTERED 
(
	[Nombre_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TIEMPO_DEST]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TIEMPO_DEST](
	[fecha_pedido] [date] NOT NULL,
 CONSTRAINT [PkTIEM] PRIMARY KEY CLUSTERED 
(
	[fecha_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCategoria]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategoria](
	[Categoria] [nvarchar](50) NULL,
	[Cantidad_Productos] [int] NULL,
	[Categoria_Mayusculas] [nvarchar](50) NULL,
	[Categoria_] [nvarchar](102) NULL,
	[Cantidad_Productos_Original] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProducto]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducto](
	[Nombre_Producto] [nvarchar](70) NULL,
	[Total_Vendido] [int] NULL,
	[Valores_Productos_Nulos] [nvarchar](142) NULL,
	[Nombre_productoMayus] [nvarchar](70) NULL,
	[Mayor_Cantidad_Productos] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTiempo]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTiempo](
	[fecha_pedido] [date] NULL,
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[Dia] [int] NULL,
	[DiasemanaNum] [int] NULL,
	[Trimestre] [int] NULL,
	[DiaAño] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactsVentas]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactsVentas](
	[Nombre_Producto] [nvarchar](70) NULL,
	[Categoria] [nvarchar](50) NULL,
	[fecha_pedido] [date] NULL,
	[ID_pedido] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[total_venta] [numeric](26, 2) NULL,
	[Anio_Pedido] [int] NULL,
	[MesPedido] [int] NULL,
	[DiaPedido] [int] NULL,
	[NombreProductosModi] [nvarchar](142) NULL,
	[PrecioRedondeado] [numeric](15, 2) NULL,
	[Total_V_Redondeado] [numeric](26, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[H_VENTAS_DEST]    Script Date: 23/05/2024 15:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[H_VENTAS_DEST](
	[Nombre_Producto] [nvarchar](70) NULL,
	[Categoria] [nvarchar](50) NULL,
	[fecha_pedido] [date] NULL,
	[ID_pedido] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[total_venta] [numeric](26, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[H_VENTAS_DEST]  WITH NOCHECK ADD  CONSTRAINT [fk1] FOREIGN KEY([Nombre_Producto])
REFERENCES [dbo].[DIM_PRODUCTO_DEST] ([Nombre_Producto])
GO
ALTER TABLE [dbo].[H_VENTAS_DEST] CHECK CONSTRAINT [fk1]
GO
ALTER TABLE [dbo].[H_VENTAS_DEST]  WITH NOCHECK ADD  CONSTRAINT [fk2] FOREIGN KEY([Categoria])
REFERENCES [dbo].[DIM_CATEGORIA_DEST] ([Categoria])
GO
ALTER TABLE [dbo].[H_VENTAS_DEST] CHECK CONSTRAINT [fk2]
GO
ALTER TABLE [dbo].[H_VENTAS_DEST]  WITH NOCHECK ADD  CONSTRAINT [fk3] FOREIGN KEY([fecha_pedido])
REFERENCES [dbo].[DIM_TIEMPO_DEST] ([fecha_pedido])
GO
ALTER TABLE [dbo].[H_VENTAS_DEST] CHECK CONSTRAINT [fk3]
GO
USE [master]
GO
ALTER DATABASE [StagingJardineria] SET  READ_WRITE 
GO
