USE [master]
GO
/****** Object:  Database [EMPRESA]    Script Date: 14/11/2019 10:07:13 ******/
CREATE DATABASE [EMPRESA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Casas GRUPO 5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Casas GRUPO 5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Casas GRUPO 5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Casas GRUPO 5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EMPRESA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMPRESA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMPRESA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMPRESA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMPRESA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMPRESA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMPRESA] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMPRESA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMPRESA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMPRESA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMPRESA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMPRESA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMPRESA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMPRESA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMPRESA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMPRESA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMPRESA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMPRESA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMPRESA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMPRESA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMPRESA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMPRESA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMPRESA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMPRESA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMPRESA] SET RECOVERY FULL 
GO
ALTER DATABASE [EMPRESA] SET  MULTI_USER 
GO
ALTER DATABASE [EMPRESA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMPRESA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMPRESA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMPRESA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EMPRESA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EMPRESA', N'ON'
GO
ALTER DATABASE [EMPRESA] SET QUERY_STORE = OFF
GO
USE [EMPRESA]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EMPRESA]
GO
/****** Object:  User [alumno]    Script Date: 14/11/2019 10:07:13 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Barrio]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barrio](
	[idBarrio] [int] NOT NULL,
	[Barrio] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inmueble]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmueble](
	[precio] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBarrio] [int] NOT NULL,
	[superficie] [int] NOT NULL,
	[ambientes] [int] NOT NULL,
	[patio] [bit] NOT NULL,
	[terraza] [bit] NOT NULL,
	[idTipo] [int] NOT NULL,
	[idUsuarioReserva] [int] NULL,
	[direccion] [varchar](50) NOT NULL,
	[baños] [int] NOT NULL,
	[habitaciones] [int] NOT NULL,
 CONSTRAINT [PK_Inmueble] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposUsuario]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposUsuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TipoUsuario] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombreDeUsuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[tipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Barrio] ([idBarrio], [Barrio]) VALUES (1, N'Almagro')
INSERT [dbo].[Barrio] ([idBarrio], [Barrio]) VALUES (2, N'Belgrano')
SET IDENTITY_INSERT [dbo].[Inmueble] ON 

INSERT [dbo].[Inmueble] ([precio], [id], [idBarrio], [superficie], [ambientes], [patio], [terraza], [idTipo], [idUsuarioReserva], [direccion], [baños], [habitaciones]) VALUES (550000, 1, 1, 250, 3, 0, 1, 1, NULL, N'Yatay 240', 2, 2)
INSERT [dbo].[Inmueble] ([precio], [id], [idBarrio], [superficie], [ambientes], [patio], [terraza], [idTipo], [idUsuarioReserva], [direccion], [baños], [habitaciones]) VALUES (10000, 2, 2, 100, 2, 0, 0, 2, NULL, N'Av Libertador 2000', 1, 1)
SET IDENTITY_INSERT [dbo].[Inmueble] OFF
SET IDENTITY_INSERT [dbo].[Tipos] ON 

INSERT [dbo].[Tipos] ([id], [tipo]) VALUES (1, N'Casa')
INSERT [dbo].[Tipos] ([id], [tipo]) VALUES (2, N'Departamento')
SET IDENTITY_INSERT [dbo].[Tipos] OFF
SET IDENTITY_INSERT [dbo].[TiposUsuario] ON 

INSERT [dbo].[TiposUsuario] ([id], [TipoUsuario]) VALUES (1, N'Usuario')
INSERT [dbo].[TiposUsuario] ([id], [TipoUsuario]) VALUES (2, N'Agente')
SET IDENTITY_INSERT [dbo].[TiposUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombreDeUsuario], [contraseña], [tipoUsuario]) VALUES (3, N'Joaco', N'Jawer', N'Truff', N'Ðƒ!ÿøÒ£6:RèÊ:: ', 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombreDeUsuario], [contraseña], [tipoUsuario]) VALUES (4, N'Gabi', N'Aran', N'GabitoHDD', N'~Å¹žÛ¼ÆõsÔ‘kï', 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombreDeUsuario], [contraseña], [tipoUsuario]) VALUES (5, N'Matias', N'Goldfarb', N'Mati', N'7ür5£bÂâA´e–`ùÌ', 2)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombreDeUsuario], [contraseña], [tipoUsuario]) VALUES (6, N'Ezequiel', N'Binker', N'EzeBinker', N'’-€ÄD5Êý·®µ‚u', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  StoredProcedure [dbo].[sp_AgregarPropiedad]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AgregarPropiedad]
@precio int,
@superficie int,
@ambientes int,
@patio bit,
@terraza bit,
@tipo int,
@idAgente int,
@direccion varchar(50),
@baños int,
@habitaciones int
as
insert into Inmueble (precio, superficie, ambientes, patio, terraza, idAgente, idUsuarioReserva, direccion, baños, habitaciones, idTipo)
values (@precio, @superficie, @ambientes, @patio, @terraza, @idAgente, @direccion,0, @baños, @habitaciones, @tipo)
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelarReserva]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CancelarReserva]
@id int
as
update Inmueble set idUsuarioReserva = null where id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CrearUsuario]
@usu varchar(50),
@pass varchar(50),
@nom varchar(50),
@ape varchar(50),
@tipo int
as
insert into Usuario (nombreDeUsuario, contraseña, nombre, apellido, tipoUsuario) values (@usu, HASHBYTES('MD5',@pass), @nom, @ape, @tipo)
GO
/****** Object:  StoredProcedure [dbo].[sp_LogIn]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc	[dbo].[sp_LogIn]
@usu varchar(50),
@pass varchar(50)
as
select * from Usuario where nombreDeUsuario = @usu and contraseña = HashBytes('MD5', @pass)
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosBarrios]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ObtenerTodosLosBarrios]
as
select * from Barrio
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosInmueblesReales]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ObtenerTodosLosInmueblesReales]
as
select * from Inmueble
inner join Tipos on Inmueble.idTipo = Tipos.id
inner join Barrio on Inmueble.idBarrio = Barrio.idBarrio
inner join Agente on Inmueble.idAgente = Agente.id
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosTipos]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ObtenerTodosLosTipos]
as
select * from Tipos
GO
/****** Object:  StoredProcedure [dbo].[sp_ReservarPropiedad]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ReservarPropiedad]
@id int,
@idUsuario int
as
update Inmueble set idUsuarioReserva = @idUsuario where id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_TraerUsuarioXid]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TraerUsuarioXid]
@id int
as
select * from Usuario where id = @id
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXambientesMax]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXambientesMax] @amb int
as
select * from Inmueble where ambientes < @amb
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXambientesMin]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXambientesMin] @amb int
as
select * from Inmueble where ambientes > @amb
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXbañosMax]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXbañosMax] @bañ int
as
select * from Inmueble where baños < @bañ
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXbañosMin]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXbañosMin] @bañ int
as
select * from Inmueble where baños > @bañ
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXBarrio]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXBarrio] @barrio int
as
select * from Inmueble where idBarrio = @barrio
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXdireccion]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXdireccion] @dir varchar(50)
as
select * from Inmueble where direccion like '%' + @dir + '%'
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXhabitacionesMax]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXhabitacionesMax] @hab int
as
select * from Inmueble where habitaciones < @hab
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXhabitacionesMin]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXhabitacionesMin] @hab int
as
select * from Inmueble where habitaciones > @hab
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXprecioMax]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXprecioMax] @precio int
as
select * from Inmueble where precio < @precio
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXprecioMin]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXprecioMin] @precio int
as
select * from Inmueble where precio > @precio
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXsupMax]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXsupMax] @sup int
as
select * from Inmueble where superficie < @sup
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXsupMin]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXsupMin] @sup int
as
select * from Inmueble where superficie > @sup
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXtienePatio]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXtienePatio] @patio bit
as
select * from Inmueble where patio = @patio
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXtieneTerraza]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerInmueblesXtieneTerraza] @terraza bit
as
select * from Inmueble where terraza = @terraza
GO
/****** Object:  StoredProcedure [dbo].[traerInmueblesXtipo]    Script Date: 14/11/2019 10:07:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[traerInmueblesXtipo] @tipo int
as
select * from Inmueble where idTipo = @tipo
GO
USE [master]
GO
ALTER DATABASE [EMPRESA] SET  READ_WRITE 
GO
