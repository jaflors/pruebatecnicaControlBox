USE [master]
GO
/****** Object:  Database [Giros]    Script Date: 25/05/2022 7:33:14 a. m. ******/
CREATE DATABASE [Giros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Giros', FILENAME = N'C:\Users\jaime pc\Giros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Giros_log', FILENAME = N'C:\Users\jaime pc\Giros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Giros] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Giros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Giros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Giros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Giros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Giros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Giros] SET ARITHABORT OFF 
GO
ALTER DATABASE [Giros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Giros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Giros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Giros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Giros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Giros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Giros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Giros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Giros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Giros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Giros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Giros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Giros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Giros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Giros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Giros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Giros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Giros] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Giros] SET  MULTI_USER 
GO
ALTER DATABASE [Giros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Giros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Giros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Giros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Giros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Giros] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Giros] SET QUERY_STORE = OFF
GO
USE [Giros]
GO
/****** Object:  Table [dbo].[CIUDADES]    Script Date: 25/05/2022 7:33:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIUDADES](
	[id_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[id_pais] [int] NOT NULL,
 CONSTRAINT [PK_CIUDADES] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIROS]    Script Date: 25/05/2022 7:33:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIROS](
	[GIR_GIRO_ID] [int] IDENTITY(1,1) NOT NULL,
	[GIR_RECIBO] [varchar](50) NOT NULL,
	[GIR_CIUDAD_ID] [int] NOT NULL,
 CONSTRAINT [PK_GIROS] PRIMARY KEY CLUSTERED 
(
	[GIR_GIRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAISES]    Script Date: 25/05/2022 7:33:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAISES](
	[id_pais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PAISES] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CIUDADES] ON 

INSERT [dbo].[CIUDADES] ([id_ciudad], [nombre], [id_pais]) VALUES (1, N'BARRANQUILLA', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [nombre], [id_pais]) VALUES (2, N'BARRANCABERMEJA', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [nombre], [id_pais]) VALUES (3, N'NEIVA', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [nombre], [id_pais]) VALUES (4, N'BOGOTA', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [nombre], [id_pais]) VALUES (5, N'LIMA', 5)
INSERT [dbo].[CIUDADES] ([id_ciudad], [nombre], [id_pais]) VALUES (6, N'QUITO', 3)
SET IDENTITY_INSERT [dbo].[CIUDADES] OFF
GO
SET IDENTITY_INSERT [dbo].[GIROS] ON 

INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (1, N'RECIBO-XXX', 1)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (3, N'RECIBO-ZZZ', 1)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (5, N'RECIBO-BBB', 2)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (6, N'RECIBO-ÑÑÑ', 1)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (1002, N'RECIBO-KKK', 1)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (1003, N'RECIBO-PPP', 1)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (1004, N'RECIBO-LLLL', 1)
INSERT [dbo].[GIROS] ([GIR_GIRO_ID], [GIR_RECIBO], [GIR_CIUDAD_ID]) VALUES (1005, N'RECIBO-SSSS', 2)
SET IDENTITY_INSERT [dbo].[GIROS] OFF
GO
SET IDENTITY_INSERT [dbo].[PAISES] ON 

INSERT [dbo].[PAISES] ([id_pais], [nombre]) VALUES (1, N'COLOMBIA')
INSERT [dbo].[PAISES] ([id_pais], [nombre]) VALUES (2, N'CHILE')
INSERT [dbo].[PAISES] ([id_pais], [nombre]) VALUES (3, N'ECUADOR')
INSERT [dbo].[PAISES] ([id_pais], [nombre]) VALUES (4, N'PANAMA')
INSERT [dbo].[PAISES] ([id_pais], [nombre]) VALUES (5, N'PERU')
SET IDENTITY_INSERT [dbo].[PAISES] OFF
GO
ALTER TABLE [dbo].[CIUDADES]  WITH CHECK ADD  CONSTRAINT [FK_CIUDADES_PAISES] FOREIGN KEY([id_pais])
REFERENCES [dbo].[PAISES] ([id_pais])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CIUDADES] CHECK CONSTRAINT [FK_CIUDADES_PAISES]
GO
ALTER TABLE [dbo].[GIROS]  WITH CHECK ADD  CONSTRAINT [FK_GIROS_CIUDADES1] FOREIGN KEY([GIR_CIUDAD_ID])
REFERENCES [dbo].[CIUDADES] ([id_ciudad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GIROS] CHECK CONSTRAINT [FK_GIROS_CIUDADES1]
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Cuidades]    Script Date: 25/05/2022 7:33:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_Cuidades]  
    	
AS   
BEGIN
 SET NOCOUNT ON
SELECT  CIUDADES.id_ciudad, CIUDADES.nombre AS CIUDAD, PAISES.nombre AS PAIS
from CIUDADES
INNER JOIN PAISES ON PAISES.id_pais= CIUDADES.id_pais
ORDER BY [id_ciudad]
END;   
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Detale]    Script Date: 25/05/2022 7:33:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_Detale]  
   @p_IdCiudad INT 
AS   
BEGIN
SET NOCOUNT ON
SELECT  GIROS.GIR_GIRO_ID,GIROS.GIR_RECIBO,GIROS.GIR_CIUDAD_ID
from CIUDADES
INNER JOIN GIROS ON CIUDADES.id_ciudad= GIROS.GIR_CIUDAD_ID
WHERE GIROS.GIR_CIUDAD_ID= @p_IdCiudad
ORDER BY [id_ciudad]
OFFSET 0 ROWS
FETCH first 4 ROWS ONLY
END;   

GO
/****** Object:  StoredProcedure [dbo].[MostrarNombreCiudad]    Script Date: 25/05/2022 7:33:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MostrarNombreCiudad]  
   @p_IdCiudad INT 
AS   
BEGIN
SET NOCOUNT ON
SELECT  CIUDADES.nombre 
from CIUDADES
WHERE CIUDADES.id_ciudad=@p_IdCiudad;
END;   

GO
USE [master]
GO
ALTER DATABASE [Giros] SET  READ_WRITE 
GO
