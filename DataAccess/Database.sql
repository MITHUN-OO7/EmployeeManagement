 
/****** Object:  Database [Employee-Management]    Script Date: 6/5/2022 11:41:06 AM ******/
CREATE DATABASE [Employee-Management]
  
ALTER DATABASE [Employee-Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee-Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee-Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee-Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee-Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee-Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee-Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee-Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee-Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee-Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee-Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee-Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee-Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee-Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee-Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee-Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee-Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Employee-Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee-Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee-Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee-Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee-Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee-Management] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Employee-Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee-Management] SET RECOVERY FULL 
GO
ALTER DATABASE [Employee-Management] SET  MULTI_USER 
GO
ALTER DATABASE [Employee-Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee-Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee-Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee-Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee-Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Employee-Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Employee-Management', N'ON'
GO
ALTER DATABASE [Employee-Management] SET QUERY_STORE = OFF
GO
USE [Employee-Management]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/5/2022 11:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6/5/2022 11:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [int] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[DOB] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[EmploymentDate] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSkills]    Script Date: 6/5/2022 11:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSkills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeSkills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payrolls]    Script Date: 6/5/2022 11:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payrolls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Basic] [decimal](18, 2) NOT NULL,
	[TA] [decimal](18, 2) NOT NULL,
	[DA] [decimal](18, 2) NOT NULL,
	[Bonus] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Payrolls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 6/5/2022 11:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605045205_init', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [EmployeeCode], [FirstName], [LastName], [DOB], [Email], [EmploymentDate], [Address], [City], [State], [Country]) VALUES (6, 1, N'Rajeev', N'Varma1', CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'rajeev@gmail.com', CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'Etawah', N'Etawah', N'Uttar Pradesh', N'India')
INSERT [dbo].[Employees] ([Id], [EmployeeCode], [FirstName], [LastName], [DOB], [Email], [EmploymentDate], [Address], [City], [State], [Country]) VALUES (7, 2, N'Mithun', N'Kumar', CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'mithunkiet@gmail.com', CAST(N'2022-06-05T00:00:00.0000000' AS DateTime2), N'Heonra', N'Etawah', N'Uttar Pradesh', N'India')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeSkills] ON 

INSERT [dbo].[EmployeeSkills] ([Id], [EmployeeId], [SkillId]) VALUES (10, 6, 1)
INSERT [dbo].[EmployeeSkills] ([Id], [EmployeeId], [SkillId]) VALUES (11, 6, 3)
INSERT [dbo].[EmployeeSkills] ([Id], [EmployeeId], [SkillId]) VALUES (12, 6, 5)
INSERT [dbo].[EmployeeSkills] ([Id], [EmployeeId], [SkillId]) VALUES (13, 7, 2)
INSERT [dbo].[EmployeeSkills] ([Id], [EmployeeId], [SkillId]) VALUES (14, 7, 5)
SET IDENTITY_INSERT [dbo].[EmployeeSkills] OFF
GO
SET IDENTITY_INSERT [dbo].[Payrolls] ON 

INSERT [dbo].[Payrolls] ([Id], [EmployeeId], [Basic], [TA], [DA], [Bonus]) VALUES (2, 8, CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)))
INSERT [dbo].[Payrolls] ([Id], [EmployeeId], [Basic], [TA], [DA], [Bonus]) VALUES (4, 6, CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Payrolls] ([Id], [EmployeeId], [Basic], [TA], [DA], [Bonus]) VALUES (5, 7, CAST(121.00 AS Decimal(18, 2)), CAST(1212.00 AS Decimal(18, 2)), CAST(212.00 AS Decimal(18, 2)), CAST(2112.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Payrolls] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (1, N'DotNet Core', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (2, N'Dot Net', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (3, N'Java Script', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (4, N'Java', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (5, N'JQuery', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (6, N'CSS', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (7, N'Angular', NULL)
INSERT [dbo].[Skills] ([Id], [Name], [EmployeeId]) VALUES (8, N'React', NULL)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
/****** Object:  Index [IX_EmployeeSkills_EmployeeId]    Script Date: 6/5/2022 11:41:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeSkills_EmployeeId] ON [dbo].[EmployeeSkills]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeSkills_SkillId]    Script Date: 6/5/2022 11:41:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeSkills_SkillId] ON [dbo].[EmployeeSkills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payrolls_EmployeeId]    Script Date: 6/5/2022 11:41:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Payrolls_EmployeeId] ON [dbo].[Payrolls]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Skills_EmployeeId]    Script Date: 6/5/2022 11:41:07 AM ******/
CREATE NONCLUSTERED INDEX [IX_Skills_EmployeeId] ON [dbo].[Skills]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeSkills]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkills_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeSkills] CHECK CONSTRAINT [FK_EmployeeSkills_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeSkills]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkills_Skills_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeSkills] CHECK CONSTRAINT [FK_EmployeeSkills_Skills_SkillId]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Employees_EmployeeId]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Employee]    Script Date: 6/5/2022 11:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Proc_Employee]
@Id int=0,
@FirstName Varchar(500)=NULL,
@LastName Varchar(500)=NULL,
@DOB DateTime =NULL,
@Email Varchar(150) =NULL,
@EmploymentDate DateTime =NULL,
@Address Varchar(500) =NULL,
@City  Varchar(500) =NULL,
@State  Varchar(500) =NULL,
@Country Varchar(500) =NULL,
@Skills Varchar(500) =NULL,
@Basic Decimal(18,2),
@TA Decimal(18,2),
@DA Decimal(18,2),
@Bonus Decimal(18,2),

@Flag int=0
AS
Declare @EmployeeCode int, @NewEmpID int
BEGIN
	IF @Flag = 0
		BEGIN
			IF NOT EXISTS (Select Id from Employees where Email=@Email)
				BEGIN
					Select @EmployeeCode=ISNULL(MAX(EmployeeCode),0)+1 from Employees 
					Insert into Employees([EmployeeCode], [FirstName], [LastName], [DOB], [Email], [EmploymentDate], [Address], [City], [State], [Country])
					Values(@EmployeeCode,@FirstName, @LastName,@DOB,@Email,@EmploymentDate,@Address,@City,@State,@Country)
					Set @NewEmpID=@@IDENTITY
					Insert into EmployeeSkills(EmployeeID, SkillId) SELECT @NewEmpID ,value FROM STRING_SPLIT(@Skills, ',')
					if not Exists(Select Id from Payrolls where EmployeeId=@NewEmpID)
						BEGIN
							Insert into Payrolls(EmployeeId,Basic, TA, DA, Bonus)
							Values(@NewEmpID, @Basic,@TA,@DA,@Bonus)
						END
				END
		END
	IF @Flag = 1
		BEGIN
			IF EXISTS (Select Id from Employees where Email=@Email)
				BEGIN
					Update Employees SET [FirstName]=@FirstName, [LastName]=@LastName, [DOB]=@DOB, [Email]=@Email, [EmploymentDate]=@EmploymentDate, 
					[Address]=@Address, [City]=@City, [State]=@State, [Country]=@Country where Id=@Id;
				END
		END
	IF @Flag = 2
		BEGIN
			IF EXISTS (Select Id from Employees where id=@Id)
				BEGIN
					Delete from Employees where Id=@Id;
					Delete from EmployeeSkills where EmployeeId=@Id;
					Delete from Payrolls where EmployeeId=@Id;
				END
		END
END
GO
USE [master]
GO
ALTER DATABASE [Employee-Management] SET  READ_WRITE 
GO
