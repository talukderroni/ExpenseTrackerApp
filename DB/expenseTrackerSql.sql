USE [master]
GO
/****** Object:  Database [ExpenseTrackerDB]    Script Date: 03-Dec-21 4:36:11 PM ******/
CREATE DATABASE [ExpenseTrackerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpenseTrackerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\ExpenseTrackerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpenseTrackerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER16\MSSQL\DATA\ExpenseTrackerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExpenseTrackerDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpenseTrackerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpenseTrackerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpenseTrackerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpenseTrackerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ExpenseTrackerDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExpenseTrackerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpenseTrackerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpenseTrackerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExpenseTrackerDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExpenseTrackerDB', N'ON'
GO
ALTER DATABASE [ExpenseTrackerDB] SET QUERY_STORE = OFF
GO
USE [ExpenseTrackerDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ExpenseTrackerDB]
GO
/****** Object:  Table [dbo].[ExpenseCatagory]    Script Date: 03-Dec-21 4:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseCatagory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseInfo]    Script Date: 03-Dec-21 4:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseDate] [date] NULL,
	[Amount] [decimal](12, 2) NULL,
	[ExpenseCatagoriID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExpenseInfo]  WITH CHECK ADD FOREIGN KEY([ExpenseCatagoriID])
REFERENCES [dbo].[ExpenseCatagory] ([ID])
GO
USE [master]
GO
ALTER DATABASE [ExpenseTrackerDB] SET  READ_WRITE 
GO
