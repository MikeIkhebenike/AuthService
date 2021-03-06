USE [master]
GO
/****** Object:  Database [Service_Center]    Script Date: 01.12.2021 10:04:44 ******/
CREATE DATABASE [Service_Center]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Service_Center', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Service_Center.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Service_Center_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Service_Center_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Service_Center] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Service_Center].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Service_Center] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Service_Center] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Service_Center] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Service_Center] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Service_Center] SET ARITHABORT OFF 
GO
ALTER DATABASE [Service_Center] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Service_Center] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Service_Center] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Service_Center] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Service_Center] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Service_Center] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Service_Center] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Service_Center] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Service_Center] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Service_Center] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Service_Center] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Service_Center] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Service_Center] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Service_Center] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Service_Center] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Service_Center] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Service_Center] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Service_Center] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Service_Center] SET  MULTI_USER 
GO
ALTER DATABASE [Service_Center] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Service_Center] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Service_Center] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Service_Center] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Service_Center] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Service_Center] SET QUERY_STORE = OFF
GO
USE [Service_Center]
GO
/****** Object:  Table [dbo].[Договор]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Договор](
	[ID_договора] [int] NOT NULL,
	[ФИО_клиента] [nvarchar](50) NOT NULL,
	[ID_заявки] [int] NOT NULL,
	[ID_сотрудника] [int] NOT NULL,
	[ID_работы] [int] NOT NULL,
	[ЭлектроныйДокум] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Договор] PRIMARY KEY CLUSTERED 
(
	[ID_договора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Доставка]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Доставка](
	[ID_доставки] [int] NOT NULL,
	[ID_сотрудника] [int] NOT NULL,
	[ID_договора] [int] NOT NULL,
	[ФИО_клиента] [nvarchar](50) NOT NULL,
	[Контактный_телефон] [nvarchar](50) NOT NULL,
	[Адрес_клиента] [nvarchar](50) NOT NULL,
	[Способо_доставки] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Доставка] PRIMARY KEY CLUSTERED 
(
	[ID_доставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[ID_заявки] [int] NOT NULL,
	[ДатаОткр] [nvarchar](50) NOT NULL,
	[ФИО_клиента] [nvarchar](50) NOT NULL,
	[Техника_клиента] [nvarchar](50) NOT NULL,
	[Количество] [int] NOT NULL,
	[Адрес_клиента] [nvarchar](50) NOT NULL,
	[Описание_проблемы] [nvarchar](50) NOT NULL,
	[Контактный_номер] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Заявка] PRIMARY KEY CLUSTERED 
(
	[ID_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗаявкаНаПоставку]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗаявкаНаПоставку](
	[ID_заявНаПост] [int] NOT NULL,
	[Дата_создания] [nvarchar](50) NOT NULL,
	[Дата_закрытия] [nvarchar](50) NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[ID_сотрудника] [int] NOT NULL,
 CONSTRAINT [PK_ЗаявкаНаПоставку] PRIMARY KEY CLUSTERED 
(
	[ID_заявНаПост] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Комплектующее]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Комплектующее](
	[ID_комплектующего] [int] NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[КоличествоВналич] [int] NOT NULL,
	[СтоимостьШт] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Комплектующее] PRIMARY KEY CLUSTERED 
(
	[ID_комплектующего] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставка]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставка](
	[ID_поставки] [int] NOT NULL,
	[Дата_поставки] [nvarchar](50) NOT NULL,
	[ID_поставщика] [int] NOT NULL,
	[ID_сотрудника] [int] NOT NULL,
	[Стоимость_поставки] [nvarchar](50) NOT NULL,
	[ID_заявНаПост] [int] NOT NULL,
 CONSTRAINT [PK_Поставка] PRIMARY KEY CLUSTERED 
(
	[ID_поставки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщик]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщик](
	[ID_поставщика] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Поставщик] PRIMARY KEY CLUSTERED 
(
	[ID_поставщика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ремонт]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ремонт](
	[ID_работы] [int] NOT NULL,
	[ДатаНач] [nvarchar](50) NOT NULL,
	[ID_заявки] [int] NOT NULL,
	[Характер_ремонта] [nvarchar](50) NOT NULL,
	[ДатаЗаверш] [nvarchar](50) NOT NULL,
	[ID_сотрудника] [int] NOT NULL,
	[ID_статуса] [int] NOT NULL,
	[ID_услуги] [int] NOT NULL,
	[ID_комплектующего] [int] NOT NULL,
 CONSTRAINT [PK_Ремонт] PRIMARY KEY CLUSTERED 
(
	[ID_работы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роль]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роль](
	[ID_роли] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](50) NULL,
 CONSTRAINT [PK_Роль] PRIMARY KEY CLUSTERED 
(
	[ID_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID_сотрудника] [int] NOT NULL,
	[ID_роли] [int] NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Контактный_телефон] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cjnhelybr] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СтатусРабот]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СтатусРабот](
	[ID_статуса] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_СтатусРабот] PRIMARY KEY CLUSTERED 
(
	[ID_статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуга]    Script Date: 01.12.2021 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуга](
	[ID_услуги] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Стоимость] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Услуга] PRIMARY KEY CLUSTERED 
(
	[ID_услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Договор]  WITH CHECK ADD  CONSTRAINT [FK_Договор_Заявка] FOREIGN KEY([ID_заявки])
REFERENCES [dbo].[Заявка] ([ID_заявки])
GO
ALTER TABLE [dbo].[Договор] CHECK CONSTRAINT [FK_Договор_Заявка]
GO
ALTER TABLE [dbo].[Договор]  WITH CHECK ADD  CONSTRAINT [FK_Договор_Ремонт] FOREIGN KEY([ID_работы])
REFERENCES [dbo].[Ремонт] ([ID_работы])
GO
ALTER TABLE [dbo].[Договор] CHECK CONSTRAINT [FK_Договор_Ремонт]
GO
ALTER TABLE [dbo].[Договор]  WITH CHECK ADD  CONSTRAINT [FK_Договор_Сотрудник] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Договор] CHECK CONSTRAINT [FK_Договор_Сотрудник]
GO
ALTER TABLE [dbo].[Доставка]  WITH CHECK ADD  CONSTRAINT [FK_Доставка_Договор] FOREIGN KEY([ID_договора])
REFERENCES [dbo].[Договор] ([ID_договора])
GO
ALTER TABLE [dbo].[Доставка] CHECK CONSTRAINT [FK_Доставка_Договор]
GO
ALTER TABLE [dbo].[Доставка]  WITH CHECK ADD  CONSTRAINT [FK_Доставка_Сотрудник] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Доставка] CHECK CONSTRAINT [FK_Доставка_Сотрудник]
GO
ALTER TABLE [dbo].[ЗаявкаНаПоставку]  WITH CHECK ADD  CONSTRAINT [FK_ЗаявкаНаПоставку_Поставщик] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщик] ([ID_поставщика])
GO
ALTER TABLE [dbo].[ЗаявкаНаПоставку] CHECK CONSTRAINT [FK_ЗаявкаНаПоставку_Поставщик]
GO
ALTER TABLE [dbo].[ЗаявкаНаПоставку]  WITH CHECK ADD  CONSTRAINT [FK_ЗаявкаНаПоставку_Сотрудник] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[ЗаявкаНаПоставку] CHECK CONSTRAINT [FK_ЗаявкаНаПоставку_Сотрудник]
GO
ALTER TABLE [dbo].[Комплектующее]  WITH CHECK ADD  CONSTRAINT [FK_Комплектующее_Поставщик] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщик] ([ID_поставщика])
GO
ALTER TABLE [dbo].[Комплектующее] CHECK CONSTRAINT [FK_Комплектующее_Поставщик]
GO
ALTER TABLE [dbo].[Поставка]  WITH CHECK ADD  CONSTRAINT [FK_Поставка_ЗаявкаНаПоставку] FOREIGN KEY([ID_заявНаПост])
REFERENCES [dbo].[ЗаявкаНаПоставку] ([ID_заявНаПост])
GO
ALTER TABLE [dbo].[Поставка] CHECK CONSTRAINT [FK_Поставка_ЗаявкаНаПоставку]
GO
ALTER TABLE [dbo].[Поставка]  WITH CHECK ADD  CONSTRAINT [FK_Поставка_Поставщик] FOREIGN KEY([ID_поставщика])
REFERENCES [dbo].[Поставщик] ([ID_поставщика])
GO
ALTER TABLE [dbo].[Поставка] CHECK CONSTRAINT [FK_Поставка_Поставщик]
GO
ALTER TABLE [dbo].[Поставка]  WITH CHECK ADD  CONSTRAINT [FK_Поставка_Сотрудник] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Поставка] CHECK CONSTRAINT [FK_Поставка_Сотрудник]
GO
ALTER TABLE [dbo].[Ремонт]  WITH CHECK ADD  CONSTRAINT [FK_Ремонт_Заявка] FOREIGN KEY([ID_заявки])
REFERENCES [dbo].[Заявка] ([ID_заявки])
GO
ALTER TABLE [dbo].[Ремонт] CHECK CONSTRAINT [FK_Ремонт_Заявка]
GO
ALTER TABLE [dbo].[Ремонт]  WITH CHECK ADD  CONSTRAINT [FK_Ремонт_Комплектующее] FOREIGN KEY([ID_комплектующего])
REFERENCES [dbo].[Комплектующее] ([ID_комплектующего])
GO
ALTER TABLE [dbo].[Ремонт] CHECK CONSTRAINT [FK_Ремонт_Комплектующее]
GO
ALTER TABLE [dbo].[Ремонт]  WITH CHECK ADD  CONSTRAINT [FK_Ремонт_Сотрудник] FOREIGN KEY([ID_сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID_сотрудника])
GO
ALTER TABLE [dbo].[Ремонт] CHECK CONSTRAINT [FK_Ремонт_Сотрудник]
GO
ALTER TABLE [dbo].[Ремонт]  WITH CHECK ADD  CONSTRAINT [FK_Ремонт_СтатусРабот] FOREIGN KEY([ID_статуса])
REFERENCES [dbo].[СтатусРабот] ([ID_статуса])
GO
ALTER TABLE [dbo].[Ремонт] CHECK CONSTRAINT [FK_Ремонт_СтатусРабот]
GO
ALTER TABLE [dbo].[Ремонт]  WITH CHECK ADD  CONSTRAINT [FK_Ремонт_Услуга] FOREIGN KEY([ID_услуги])
REFERENCES [dbo].[Услуга] ([ID_услуги])
GO
ALTER TABLE [dbo].[Ремонт] CHECK CONSTRAINT [FK_Ремонт_Услуга]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Роль] FOREIGN KEY([ID_роли])
REFERENCES [dbo].[Роль] ([ID_роли])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Роль]
GO
USE [master]
GO
ALTER DATABASE [Service_Center] SET  READ_WRITE 
GO
