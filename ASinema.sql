USE [master]
GO
/****** Object:  Database [ASinema]    Script Date: 26.04.2023 16:29:32 ******/
CREATE DATABASE [ASinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ASinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ASinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ASinema] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASinema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASinema] SET  MULTI_USER 
GO
ALTER DATABASE [ASinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASinema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASinema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASinema] SET QUERY_STORE = ON
GO
ALTER DATABASE [ASinema] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ASinema]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[FilmNo] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[Tur] [varchar](50) NULL,
	[Sure] [int] NULL,
	[Ucret] [money] NULL,
	[Puan] [int] NULL,
	[VizyonTarihi] [datetime] NULL,
	[SNo] [int] NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[AdSoyad] [varchar](50) NULL,
	[Gorev] [nchar](10) NULL,
	[SubeNo] [int] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salon](
	[SalonNo] [int] IDENTITY(1,1) NOT NULL,
	[SalonAd] [varchar](50) NULL,
	[KoltukSayisi] [int] NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[SalonNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sube]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sube](
	[SubeNo] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NULL,
	[SalonSayisi] [int] NULL,
	[CalisanSayisi] [int] NULL,
	[SalonNo] [int] NULL,
 CONSTRAINT [PK_Sube] PRIMARY KEY CLUSTERED 
(
	[SubeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (3, N'Inception', N'Aksiyon', 148, 25.0000, 8, CAST(N'2010-07-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (4, N'Little Miss Sunshine', N'Komedi', 101, 25.0000, 7, CAST(N'2007-04-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (5, N'Your Name', N'Animasyon', 106, 25.0000, 8, CAST(N'2017-08-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (6, N'Charlie and the Chocolate Factory', N'Macera', 110, 25.0000, 7, CAST(N'2005-08-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (7, N'Amelie', N'Komedi', 120, 25.0000, 8, CAST(N'2005-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (8, N'Groundhog Day', N'Komedi', 100, 25.0000, 8, CAST(N'1993-09-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (9, N'Terminal', N'Dram', 100, 25.0000, 8, CAST(N'2004-09-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Film] ([FilmNo], [Ad], [Tur], [Sure], [Ucret], [Puan], [VizyonTarihi], [SNo]) VALUES (10, N'Jumanji: Welcome to the Jungle', N'Aksiyon', 120, 25.0000, 7, CAST(N'2017-12-29T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [Gorev], [SubeNo]) VALUES (1, N'admin', N'123', N'aleyna', N'müdür     ', 1)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [Gorev], [SubeNo]) VALUES (1003, N'adm', N'1234', N'mustafa', N'müdür     ', 2)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [Sifre], [AdSoyad], [Gorev], [SubeNo]) VALUES (1005, N'adm1', N'1234', N'ece', N'yardımcı  ', 3)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Salon] ON 

INSERT [dbo].[Salon] ([SalonNo], [SalonAd], [KoltukSayisi]) VALUES (1, N'Mavi', 50)
INSERT [dbo].[Salon] ([SalonNo], [SalonAd], [KoltukSayisi]) VALUES (3, N'Kırmızı', 90)
SET IDENTITY_INSERT [dbo].[Salon] OFF
GO
SET IDENTITY_INSERT [dbo].[Sube] ON 

INSERT [dbo].[Sube] ([SubeNo], [Ad], [SalonSayisi], [CalisanSayisi], [SalonNo]) VALUES (1, N'Üsküdar', 8, 10, 1)
INSERT [dbo].[Sube] ([SubeNo], [Ad], [SalonSayisi], [CalisanSayisi], [SalonNo]) VALUES (2, N'Ümraniye', 5, 8, 1)
INSERT [dbo].[Sube] ([SubeNo], [Ad], [SalonSayisi], [CalisanSayisi], [SalonNo]) VALUES (4, N'Beyoğlu', 3, 6, 3)
SET IDENTITY_INSERT [dbo].[Sube] OFF
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Salon] FOREIGN KEY([SNo])
REFERENCES [dbo].[Salon] ([SalonNo])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Salon]
GO
/****** Object:  StoredProcedure [dbo].[FAra]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FAra] 
@Ad varchar(50)
as begin 
select * from Film where Ad = @Ad
end
GO
/****** Object:  StoredProcedure [dbo].[FEkle]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FEkle]
@Ad varchar(50),
@Tur varchar(50),
@Sure int,
@Ucret money,
@Puan int,
@VizyonTarihi datetime
as begin 
insert into Film (Ad,Tur,Sure,Ucret,Puan,VizyonTarihi)
	values (@Ad,@Tur,@Sure,@Ucret,@Puan,@VizyonTarihi)
end
GO
/****** Object:  StoredProcedure [dbo].[FListele]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FListele]
as begin 
select * from Film
end
GO
/****** Object:  StoredProcedure [dbo].[FSil]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FSil]
@FilmNo int
as begin
delete from Film where FilmNo = @FilmNo
end
GO
/****** Object:  StoredProcedure [dbo].[FYenile]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FYenile] 
@FilmNo int,
@Ad varchar(50),
@Tur varchar(50),
@Sure int,
@Ucret money,
@Puan int,
@VizyonTarihi datetime
as begin 
update Film set
	Ad = @Ad, Tur = @Tur, Sure = @Sure, Ucret = @Ucret, Puan = @Puan, VizyonTarihi = @VizyonTarihi where FilmNo = @FilmNo
end
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Giris] (
@kadi varchar(50),
@sifre varchar(50)
)
as begin 
select * from Kullanici where 
	KullaniciAd = @kadi and Sifre = @sifre
end
GO
/****** Object:  StoredProcedure [dbo].[KAra]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KAra] 
@KullaniciAd varchar(50)
as begin 
select * from Kullanici where KullaniciAd = @KullaniciAd
end
GO
/****** Object:  StoredProcedure [dbo].[KEkle]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KEkle]
@KullaniciAd varchar(50),
@Sifre varchar(50),
@AdSoyad varchar(50),
@Gorev varchar(50),
@SubeNo int
as begin
insert into Kullanici (KullaniciAd,Sifre,AdSoyad,Gorev,SubeNo)
	values (@KullaniciAd,@Sifre,@AdSoyad,@Gorev,@SubeNo)
end
GO
/****** Object:  StoredProcedure [dbo].[KListele]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KListele]
as begin
select * from Kullanici
end
GO
/****** Object:  StoredProcedure [dbo].[KSil]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KSil]
@KullaniciNo int
as begin
delete from Kullanici where KullaniciNo = @KullaniciNo
end
GO
/****** Object:  StoredProcedure [dbo].[KYenile]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KYenile] 
@KullaniciNo int,
@KullaniciAd varchar(50),
@Sifre varchar(50),
@AdSoyad varchar(50),
@Gorev nchar(10),
@SubeNo int
as begin 
update Kullanici set
	KullaniciAd = @KullaniciAd, Sifre = @Sifre, AdSoyad = @AdSoyad, Gorev = @Gorev, SubeNo = @SubeNo where KullaniciNo = @KullaniciNo
end
GO
/****** Object:  StoredProcedure [dbo].[SAra]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SAra] 
@SalonAd varchar(50)
as begin 
select * from Salon where SalonAd = @SalonAd
end
GO
/****** Object:  StoredProcedure [dbo].[SEkle]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SEkle]
@SalonAd varchar(50),
@KoltukSayisi int
as begin 
insert into Salon(SalonAd,KoltukSayisi)
	values (@SalonAd,@KoltukSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[SListele]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SListele]
as begin 
select * from Salon
end
GO
/****** Object:  StoredProcedure [dbo].[SSil]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SSil]
@SalonNo int
as begin
delete from Salon where SalonNo = @SalonNo
end
GO
/****** Object:  StoredProcedure [dbo].[SubeAra]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeAra] 
@Ad varchar(50)
as begin 
select * from Sube where Ad = @Ad
end
GO
/****** Object:  StoredProcedure [dbo].[SubeEkle]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeEkle]
@Ad varchar(50),
@SalonSayisi int,
@CalisanSayisi int
as begin 
insert into Sube(Ad,SalonSayisi,CalisanSayisi)
	values (@Ad,@SalonSayisi,@CalisanSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[SubeListele]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeListele]
as begin 
select * from Sube
end
GO
/****** Object:  StoredProcedure [dbo].[SubeSil]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeSil]
@SubeNo int
as begin
delete from Sube where SubeNo = @SubeNo
end
GO
/****** Object:  StoredProcedure [dbo].[SubeYenile]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeYenile] 
@SubeNo int,
@Ad varchar(50),
@SalonSayisi int,
@CalisanSayisi int
as begin 
update Sube set
	Ad = @Ad, SalonSayisi = @SalonSayisi,  CalisanSayisi = @CalisanSayisi
	where SubeNo = @SubeNo
end
GO
/****** Object:  StoredProcedure [dbo].[SYenile]    Script Date: 26.04.2023 16:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SYenile] 
@SalonNo int,
@SalonAd varchar(50),
@KoltukSayisi int
as begin 
update Salon set
	SalonAd = @SalonAd, KoltukSayisi = @KoltukSayisi
	where SalonNo = @SalonNo
end
GO
USE [master]
GO
ALTER DATABASE [ASinema] SET  READ_WRITE 
GO
