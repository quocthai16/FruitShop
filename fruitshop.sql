USE [master]
GO
/****** Object:  Database [ShopTraiCay]    Script Date: 3/7/2024 2:32:10 PM ******/
CREATE DATABASE [ShopTraiCay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopTraiCay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopTraiCay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopTraiCay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopTraiCay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopTraiCay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopTraiCay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopTraiCay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopTraiCay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopTraiCay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopTraiCay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopTraiCay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopTraiCay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopTraiCay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopTraiCay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopTraiCay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopTraiCay] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopTraiCay] SET  MULTI_USER 
GO
ALTER DATABASE [ShopTraiCay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopTraiCay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopTraiCay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopTraiCay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopTraiCay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopTraiCay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopTraiCay', N'ON'
GO
ALTER DATABASE [ShopTraiCay] SET QUERY_STORE = OFF
GO
USE [ShopTraiCay]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](100) NOT NULL,
	[pass] [varchar](1000) NOT NULL,
	[fullname] [nvarchar](1000) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isAdmin] [int] NOT NULL,
	[isCus] [int] NOT NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[username] [varchar](100) NULL,
	[pId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total_quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catelogy]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catelogy](
	[cId] [int] NOT NULL,
	[cName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[username] [varchar](100) NOT NULL,
	[message] [varchar](300) NOT NULL,
	[img] [varchar](1000) NULL,
	[response] [varchar](300) NULL,
	[date_message] [datetime] NOT NULL,
	[date_response] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[order_date] [date] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[total_quantity] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[startus] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
	[pay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[pId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[img] [varchar](1000) NOT NULL,
	[des] [nvarchar](1000) NOT NULL,
	[cId] [int] NOT NULL,
	[status] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionVnpay]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionVnpay](
	[code] [varchar](50) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[order_id] [int] NOT NULL,
	[bank_name] [varchar](30) NULL,
	[account_number] [varchar](30) NULL,
	[transaction_date] [datetime] NULL,
	[total_amount] [float] NULL,
	[order_info] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Product] ([pId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Product] ([pId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cId])
REFERENCES [dbo].[Catelogy] ([cId])
GO
ALTER TABLE [dbo].[TransactionVnpay]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[TransactionVnpay]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 3/7/2024 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckLogin]
@username varchar(10),
@password varchar(32)
AS
SELECT username
FROM Account
WHERE username = @username AND pass = @password;
GO
USE [master]
GO
ALTER DATABASE [ShopTraiCay] SET  READ_WRITE 
GO
