USE [master]
GO
/****** Object:  Database [esite]    Script Date: 02-Mar-21 06:16:49 PM ******/
CREATE DATABASE [esite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'esite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\esite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'esite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\esite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [esite] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [esite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [esite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [esite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [esite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [esite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [esite] SET ARITHABORT OFF 
GO
ALTER DATABASE [esite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [esite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [esite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [esite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [esite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [esite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [esite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [esite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [esite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [esite] SET  ENABLE_BROKER 
GO
ALTER DATABASE [esite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [esite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [esite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [esite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [esite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [esite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [esite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [esite] SET RECOVERY FULL 
GO
ALTER DATABASE [esite] SET  MULTI_USER 
GO
ALTER DATABASE [esite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [esite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [esite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [esite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [esite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [esite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'esite', N'ON'
GO
ALTER DATABASE [esite] SET QUERY_STORE = OFF
GO
USE [esite]
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Line1] [varchar](70) NOT NULL,
	[Line2] [varchar](50) NULL,
	[LandMark] [varchar](50) NULL,
	[PinCode] [varchar](6) NOT NULL,
	[PhoneNo] [varchar](13) NOT NULL,
 CONSTRAINT [PK_tblAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryName] [varchar](20) NOT NULL,
	[IconID] [int] NULL,
	[ProductID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategoryIcon]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategoryIcon](
	[ID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IconName] [varchar](50) NULL,
	[Src] [varchar](70) NOT NULL,
 CONSTRAINT [PK_tblCategoryIcon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCheckout]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCheckout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[AddressID] [int] NULL,
	[CardNo] [varchar](20) NULL,
	[ValidFrom] [smallint] NULL,
	[ValidTo] [smallint] NULL,
	[Cvv] [smallint] NULL,
	[HolderName] [varchar](30) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_tblCheckout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserFirstName] [varchar](50) NOT NULL,
	[UserMiddleName] [varchar](50) NULL,
	[UserLastName] [varchar](50) NOT NULL,
	[ProductID] [int] NULL,
	[OrderTotal] [money] NULL,
	[ValidFrom] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_tbltblOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductImages]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductImages](
	[ID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageName] [varchar](30) NULL,
	[Src] [varchar](70) NOT NULL,
 CONSTRAINT [PK_tblProductImages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductType] [varchar](50) NOT NULL,
	[ImageID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[CategoryName] [varchar](20) NOT NULL,
	[SubCategoryName] [varchar](20) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCatName] [varchar](20) NULL,
	[ProductID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [int] NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[MiddleName] [varchar](30) NULL,
	[LastName] [varchar](30) NOT NULL,
	[IPAddr] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Pasword] [varchar](20) NOT NULL,
	[Statuss] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [def_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [def_ValidTo]  DEFAULT (CONVERT([datetime2](2),'9999-12-31 23:59:59')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[tblAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_tblAddress_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAddress] CHECK CONSTRAINT [FK_tblAddress_UserID]
GO
ALTER TABLE [dbo].[tblCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCategory] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCategory] CHECK CONSTRAINT [FK_tblCategory]
GO
ALTER TABLE [dbo].[tblCategoryIcon]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCategoryIcon] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCategoryIcon] CHECK CONSTRAINT [FK_tblCategoryIcon]
GO
ALTER TABLE [dbo].[tblCheckout]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCheckout] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCheckout] CHECK CONSTRAINT [FK_tblCheckout]
GO
ALTER TABLE [dbo].[tblCheckout]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCheckout_Addr] FOREIGN KEY([AddressID])
REFERENCES [dbo].[tblAddress] ([ID])
GO
ALTER TABLE [dbo].[tblCheckout] CHECK CONSTRAINT [FK_tblCheckout_Addr]
GO
ALTER TABLE [dbo].[tblCheckout]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCheckout_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCheckout] CHECK CONSTRAINT [FK_tblCheckout_user]
GO
ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_tblOrders] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders]
GO
ALTER TABLE [dbo].[tblProductImages]  WITH NOCHECK ADD  CONSTRAINT [FK_tblProductImages_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProductImages] CHECK CONSTRAINT [FK_tblProductImages_ProductID]
GO
ALTER TABLE [dbo].[tblSubCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_tblSubCategory] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProducts] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory]
GO
/****** Object:  StoredProcedure [dbo].[AddressDetails]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[AddressDetails] as
begin
	select *
	from tblAddress
end
GO
/****** Object:  StoredProcedure [dbo].[CategoryDetails]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryDetails] as
begin
	select *
	from tblCategory
end
GO
/****** Object:  StoredProcedure [dbo].[CheckoutDetails]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckoutDetails] as
begin
	select *
	from tblCheckout
end
GO
/****** Object:  StoredProcedure [dbo].[OrderDetails]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrderDetails] as
begin
	select *
	from tblOrders
end
GO
/****** Object:  StoredProcedure [dbo].[ProductDetails]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProductDetails] as
begin
	select *
	from tblProducts
end
GO
/****** Object:  StoredProcedure [dbo].[SpecificAddress]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SpecificAddress](@AddressID int) as
begin
	if exists (Select * from tblAddress where ID = @AddressID)
	begin
		select *
		from tblAddress
		where ID = @AddressID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SpecificCategory]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SpecificCategory](@CategoryID int) as
begin
	if exists (Select * from tblCategory where ID = @CategoryID)
	begin
		select *
		from tblCategory
		where ID = @CategoryID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SpecificCheckout]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SpecificCheckout](@CheckoutID int) as
begin
	if exists (Select * from tblCheckout where ID = @CheckoutID)
	begin
		select *
		from tblCheckout
		where ID = @CheckoutID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SpecificOrder]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SpecificOrder](@OrderID int) as
begin
	if exists (Select * from tblOrders where ID = @OrderID)
	begin
		select *
		from tblOrders
		where ID = @OrderID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SpecificProduct]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SpecificProduct](@ProductID int) as
begin
	if exists (Select * from tblProducts where ID = @ProductID)
	begin
		select *
		from tblProducts
		where ID = @ProductID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[SpecificUser]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SpecificUser](@UserID int) as
begin
	if exists (Select * from tblUser where ID = @UserID)
	begin
		select *
		from tblUser
		where ID = @UserID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[UserDetails]    Script Date: 02-Mar-21 06:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UserDetails] as
begin
	select *
	from tblUser
end
GO
USE [master]
GO
ALTER DATABASE [esite] SET  READ_WRITE 
GO
