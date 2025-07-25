USE [master]
GO
/****** Object:  Database [HomeCinema]    Script Date: 11/9/2015 7:15:12 PM ******/
CREATE DATABASE [HomeCinema]
GO
ALTER DATABASE [HomeCinema] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeCinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeCinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeCinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeCinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeCinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeCinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeCinema] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HomeCinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeCinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeCinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeCinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeCinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeCinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeCinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeCinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeCinema] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeCinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeCinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeCinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeCinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeCinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeCinema] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HomeCinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeCinema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomeCinema] SET  MULTI_USER 
GO
ALTER DATABASE [HomeCinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeCinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeCinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeCinema] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HomeCinema]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[IdentityCard] [nvarchar](50) NOT NULL,
	[UniqueKey] [uniqueidentifier] NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Mobile] [nvarchar](10) NULL,
	[RegistrationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Error]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Error] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Genre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[GenreId] [int] NOT NULL,
	[Director] [nvarchar](100) NOT NULL,
	[Writer] [nvarchar](50) NOT NULL,
	[Producer] [nvarchar](50) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Rating] [tinyint] NOT NULL,
	[TrailerURI] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.Movie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rental]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StockId] [int] NOT NULL,
	[RentalDate] [datetime] NOT NULL,
	[ReturnedDate] [datetime] NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_dbo.Rental] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[UniqueKey] [uniqueidentifier] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Stock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[HashedPassword] [nvarchar](200) NOT NULL,
	[Salt] [nvarchar](200) NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/9/2015 7:15:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201511091712006_initial', N'HomeCinema.Data.Migrations.Configuration', 0x1F8B0800000000000400ED5DCD6EE4B811BE07C83B083A2581D76D7BB0C0C668EFC2D3F6EC36763C1EB83D9BDC0C5AA2DBC2E8A757A21C1BC13E590E79A4BC42288994F82B91925A6D7B8CB9B449F1E34F158B554556CDFFFEF3DFF94F8F51E83CC0340B92F8C43DDC3F701D187B891FC4EB13374777DFFDE0FEF4E39FFF343FF7A347E737FADDBBE23BDC32CE4EDC7B8436C7B359E6DDC30864FB51E0A54996DCA17D2F8966C04F664707077F9F1D1ECE2086703196E3CCAFF21805112CFFC07F2E92D8831B9483F022F1619891725CB32A519D4F2082D90678F0C4FD2589E0228871E9FE1940C0754EC300E061AC6078E73A208E1304101EE4F1970CAE509AC4EBD5061780F0FA6903F1777720CC2019FC71F3B9E93C0E8E8A79CC9A8614CACB339444968087EFC8C2CCC4E6BD96D7AD170E2FDD395E62F454CCBA5CBE137751760153D7113B3B5E8469F121B7BA65FB0066FBB4DD9EA3A8DDAB9902F34EF16FCF59E421CA537812C31CA520DC733EE7B761E0FD0A9FAE93AF303E89F33064478AC78AEBB8025CF4394D3630454F57F08E8C7F79E63A33BEDD4C6C583763DA54335BC6E8DD91EB7CC29D83DB10D68CC0ACC20A2529FC19C6300508FA9F014230C5745CFAB05C4AA977A1AF0F419AA1E227ED12B31FDE46AE73011E3FC2788DEEF1063BC01BE743F0087D5A4286F1250EF0AEC38D509A43C530DBBBFE0876D5F3790482B0A5DBA3ED744B69B200A9DFD2FBF75BE91CB7FE3D8798F568CF3FE7816F8D82A517BCBC7B1FA4E89EE21445D741643FA28BE43608DBA96FB410EDBD5CC17590E12D5D6C9662A896C39ECF1A91D42AA8CED334B1965265A33711D5C12730CBC0BA8D51F0CF1138658580F7F53AC507F6D6BB2A986F91C26239B6C58F78BD5368CB8F65A3377E6C275EC7993592F8FE041E8275395E496C3E607AB8CE150CCBEAEC3ED8549AE47E59754328FF214DA2AB24A42DAAE29B6B90AE21C2C34FE4BA5592A75E5F7E2B816CF9AD6CF4C66FEDFC761DA08E63722B0AC319CCBC34D8547A7D9BAAB41D5D299A42E4977CBFF4BB68D9B150410A3D541CFE5393E81F6980605BBFDB5125F19F7EEEEDA0632CF220C8600F354E8185F76631E80AE6FD13B287C0BA025660D32F57CB116C0953F14FA47B3FE94F25BC4AFAD393C1742058AA795FDBCE21FA813894AA5C331652A91A8CF1515462D81E4565A3B7A3A8CB64C3341A2A2FC7B14497D9E903DE7E458B7A13279891403C54B752B274C91E37A4BEE168A6586268B6CE76735D617AE0A1B70CA5FE421C0CA9D00C87D60EDA601588ED0EAB5ABD6DB176BEA68ECBA1BBAC24F750908A64E39CB710933386BE1AACD332477936DC53D45B2E9013A5FF6614CD2EF556EDB71993D0DAEE2ADABC6DC49D9BF9C634FE92C1B40F9D69BB375A77A824D970815BACB335865E0128A9AD103894A437D5178DC0E12AA4D39FAF1D74FA17507D18F18D09BB9930FE96EEC37E01D97DB14E59F6AFA4F5466C4BFDAF408876700B987DC4677FE3F837B65A46BB4368933B544EA84D8FA2F686F984973E4D8D52FC30D536F2E734CB122F2847C25A69C4D1C14FEB3CF69D16AF4745E9DA4381A98D454DB0C1C205F77BE2FE4D5A26355EADCC3578C4EBC2E31DBAA250BA8CCF600811744EBDEAB9C502641EF065FAE0B5F0F9122CC7605A0812102E304DB0640C62240BBD20F6820D08F5A3169A184ACA624835B858730637302E849C7EED4D7AAD9DB172D7750FC22A752DCA7CC6704F3B53B106BE8E0994D67EC304C44A30672A9587A08B4977CF548A514FC0548AB537E9B5F658ED90A9A875D8CE0692DFA683B1466504DD60145C499D3F5D6C3E80B784A5988CBB84599BF45BBB5976C25F9CA3BDFDE812BDEE538A19CD5814CC652842071C86FC3A4C761AF2537EFE928B373375E4D4D89C0D3D1BC785F9A9A836555909A400DCFDB1A81CF604FCA5A48149BFD461B133FE622C89365E5099153C874D24BC34464C2F76EFCD62F26A4CC463F2CC4D3AA69EB50998AC321F711B845BC0943A196A9F5351031F91C275850749BC571931EA451628905710097734AB82FC8DD54A98A079B22E89381EA67CFDA9C620AF493B004A8B490D400CD20E80F28C510310ADA003A03CD6D400E428EF00A8542E3502D534BB20304F6A00CAADD8D19CB2B51AA2D9D106307A08A939C3C30239E80B0EE60BC5030F713BB57B3EEAC1B22497B664BBB783C168F84E949EFCB40CA6CCDDABCB53D65AE59D763933DC86495BA6ACB2C50D96ADF794EB2B43DDA49556A381DDD86FE2A2C1C7A0305B74F0DCF997413A16571934DD264D3F26176C1183D5EB316DE1D2469E778BBA6DA0703383E6A459CBE4D54A364B753548CFC9B34E63F5EC75CAA0893A28CCDF64EE0A3DCE6C155B16807AB06B15A4AE9BCFAA984052309F698207E71760B309E235134C484A9C551549B8F86E651F65175518338F5B5B5161AA7B42490AD650A8C55DE39196E1624508E32D286E15167E247D262B5C9A8393F627EB5432E9E8914ADB14BF45FDAE0CAD6CB42F593B258D3FE0D945856E5BDED73154D737758AA04E108254713DB848C23C8AF56AB6BE35137BC78230C5E6584D301D0BD5949A2391CB401686149963F0916EDC0A7135E688CCA341168E2936C7E282D85834AEC21C8F06B2B150B4CC1C450E5463F1E45A19793E13385CB2B9A48D2419BFFCDE34DAB9B5193364DB56068FFD9ED5B4DBCE86AD23D1384AD342731C36D28C8562CBEDD8B9BE0816D9B9AE7836EC521B0F43D845690419B08BA6DD76D84596C73A59BC2352D46AF21052288D33035268DA6D871424868A05204516FB8C0D88E2F6195B61714846922C2145E618F59D398BA2BD486F995B1DC3C44DAC2E3547A231492C0E2D334769428C589CA6D4E658656286F81395A9B0C02371431C1429B3E047267488634AA6FCD98889DA101E22262A77A0BD98D0B4DBD2014FEFDC78554E7311A7C719535BE5025DB8A9B115CF86591A6FD1106E21AE5F7B76D135DC0EBFB0C11A2C0A5B6EA31692B704BC4EA87960A0C761A3367889D794DBA0B1811B3C1E5B63A5FE96E11C82EA5B963D1F3E26EE9F415CAC70E699F0B0B2D937AAA3B2AEB821B4A82F72ECE9A16FBA1D9AD03B53EEE8D0DCA3EA51E8F53EB7633557FE3BA5EE1894ED49D529291A4B3BAD299DD63B27BEBB67C1C43A0BA95EBEA6E7647A5962A3E9D097F1BC9A434B5FB84B44BA1E103FA97BAFAF0984EB803971CD77271C947CF5D527AE8317EA21F00B3FFDEA29433022CAF9EFE1220CF07C9B0F2E401CDCC10C553137EED1C1E19190B6F0F9A4109C65991F2AAE36547904797A4D10381414ABDA191A6419FC21A5ED8B1F40EADD83540E171A98956F34602EC848897AD4035595534F09FEBD3DB694A8202F0B82B2CBBBA0F0430C4F9FE7E322343C7D9E864C2CEA906C7986A3B4CC96F73AF6A2909F8E52E22F1178FCABEDFACB39E806C12962C4C6A6A42A0CEBA552B253EE750A11CB7469AF63D9B80465A39D178AFC63BA53A3C7B1118DB563851462E5024B0F4C97B10F1F4FDC7F976D8E9DE53F6F48B33DE732C5CAD6B173E0FC3138F1D8684BCFE7151BEB38FD2CA40D1B0B579115ACF7A1CA6705C3BF9F4A820E4E0C66A2EFC8DC6699F1EA75481321C794E98622CD066DA8F1153E4596AADBA08BA16CF330BD0EBACB898FFA6C3D21ED9129F7906683B8474E96D45F0C299225A9C00C554A267992819D308823E568B197CA8F132A836A07F38B5D393E9B8EE916AC5A0DDB815C0A1ED38EAB56161DDB65CA793D348D5F8E5B489D5A6634783673CC78AE2C21314CB7A23085C1DF2FFD0A89619A34438A10D9D127DF4BAFA84CDD5BC4ED4492BF92542A8624DA66928B69130F4C96C5E2052417B0488BB2B33C2834F874D2CC27533089F669D5CB4D6EF22647BE4D396296A4A48AB99C327F881C6639659608CD2BA7AD251E7955C94676995B646A46D13C9CDA2DA3EC3C61881CE62AD24C9D0CA4351348F5FC061B63B709A6706584D9E509D1270951615BE40FD1270F51015BE415D1271551015BE41BD1271B5101DBE421694942A282B64850A2CD4EA2C4B5C95BD29AB444856E95D2449BCF44872CA16E2FD309C7BE4C789F2C3B247D9169A366BC1D6532311C9E4A09956266C69AD258994ABA87A834C0E4E08EE1131B330DC9B3A1D668494658A9D20424B44D4A9445FCB3F971A636620A116998934CCE223D88FCCE17AB39CC7F3F8E55AC2C583710C57F461E438F5370EA6F96F15D42F52C6144F413E9451B023ED67E4E5314DC010FE16A0F6659F932E23710E6A5DBFE16FACBF832479B1CE129C3E836E4C2DA0A7DADADFF32070A3FE6F965F9DA271B630A789841E1F9BE8CDFE741E8D7E3FEA0F07C6B200A4590DCA014B42C5E45C2F5538DF429890D81C8F2D5FAEB358C362106CB2EE31578807DC686D9EF235C03EF893ED7D6837413825FF6F95900D629883282D1B4C77F621EF6A3C71FFF0F91114602857F0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (1, N'Royal', N'Gerhold', N'kobe_nicolas@keebler.uk', N'842fb4c4-ae70-424d-ad56-0fa8dd9841f6', N'40e6b0a3-6ae6-4a9b-8c58-85539037653a', CAST(N'1985-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-09 19:12:21.000' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (2, N'Candice', N'Windler', N'jettie_erdman@virginie.ca', N'999810e9-d84c-40bc-8b07-728a77e573b4', N'cef63426-cf30-430b-9118-980533314f8c', CAST(N'1985-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-10 19:12:21.000' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (3, N'Daren', N'Willms', N'alda_russel@mitchellmante.ca', N'729b605c-65f7-4ef7-ae80-e02cad05897e', N'8ce0cd7e-20e7-4d00-8d20-fbdc9a2ebfaa', CAST(N'1985-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-11 19:12:21.000' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (4, N'Sasha', N'Schimmel', N'jett.zieme@tromplesch.name', N'85fc42f9-dbca-407c-b336-4c1563212995', N'62bee216-9f0a-4f89-b461-addfa5116d9a', CAST(N'1986-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-12 19:12:21.000' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (5, N'Wava', N'O''Hara', N'annette@pourosflatley.ca', N'6c056af3-46da-4ee5-9305-465e82747adf', N'3be0d2ea-5a72-48a7-8877-3d5a68732002', CAST(N'1986-03-02 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-13 19:12:21.000' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (6, N'Laurence', N'DuBuque', N'sarina.stracke@grimesdaugherty.ca', N'c516d4a3-6534-44b3-b2f2-d74e61346916', N'6b746f6b-3fc6-4fdf-8a89-ff984320add8', CAST(N'1986-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-14 19:12:21.000' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (7, N'Anita', N'Streich', N'reyna.swaniawski@cummings.co.uk', N'9a22ed51-34a6-4701-b78b-739d30d0c2ea', N'eb0ace5a-9428-4fdf-b25d-7f9c99d7d86a', CAST(N'1986-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-15 19:12:21.013' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (8, N'Gregory', N'Ernser', N'annabelle@leilani.biz', N'63275657-cd88-4aca-a0d4-c58c06bb1250', N'011f16eb-c07a-411b-bff2-515163cd3d49', CAST(N'1986-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-16 19:12:21.013' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (9, N'Mekhi', N'Kuhic', N'julien_altenwerth@mullerabbott.uk', N'9b650475-dd7e-4e72-9e62-9c5699a958cd', N'977c163b-1503-4273-b46b-2cde6a69910a', CAST(N'1986-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-17 19:12:21.013' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (10, N'Monserrate', N'Thiel', N'rebeca@skiles.us', N'087b1272-e9dd-415a-8e4f-c725c7e64893', N'3a5ebdaf-2daa-406c-851a-5975cdba4a6f', CAST(N'1986-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-18 19:12:21.013' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (11, N'Cade', N'Koepp', N'pamela@marksflatley.co.uk', N'642483b6-5d65-4169-bcce-736a3bc174b4', N'b57c5dd1-5583-47ef-9ca3-6c9d295d1af0', CAST(N'1986-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-19 19:12:21.013' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (12, N'Gaetano', N'Schmidt', N'saul_eichmann@macejkovic.co.uk', N'89dc3fdc-59d7-42fb-9ad6-e93fd5f7561a', N'd129afe1-6441-4f99-ae19-a32c314e3df0', CAST(N'1986-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-20 19:12:21.013' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (13, N'Delphine', N'Hauck', N'reanna_frami@pacocha.co.uk', N'9cebf684-7de1-4e79-bebc-ceb246b08a19', N'8aa5f7ee-6007-4e65-93a6-994d24b48ca5', CAST(N'1986-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-21 19:12:21.030' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (14, N'Easton', N'Jacobson', N'darion@fisher.co.uk', N'a37d5585-fe4e-4aa8-866b-715b07b6353c', N'93219b93-3f2d-42ab-a41d-fb044a71ad02', CAST(N'1986-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-22 19:12:21.030' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (15, N'Gene', N'Waelchi', N'dedric@towne.ca', N'35aa9135-5b82-40f8-a87d-ba49ae8cdc96', N'e5bcfba8-6a59-4342-a281-34c18353ea1b', CAST(N'1986-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-23 19:12:21.030' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (16, N'Nya', N'Christiansen', N'jordi_lueilwitz@whitemcdermott.us', N'a9d6ea9c-c0a8-4aa8-a2e0-2ef8aa430505', N'ff530379-c5b8-49eb-96a9-0b31a241eb5c', CAST(N'1987-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-24 19:12:21.030' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (17, N'Nasir', N'Hansen', N'bernice_pouros@cartwright.name', N'3a8b3181-edd1-4920-b8bd-392f160387a3', N'c31cc3c8-dbe5-4668-8bdd-d8133bdef331', CAST(N'1987-03-02 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-25 19:12:21.030' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (18, N'Gust', N'Murazik', N'jack_waters@lowe.co.uk', N'a59e8436-1a45-4b6b-9d32-5a97a655ab4e', N'6f3b4f5e-5f0c-4960-ad85-8072d01dce35', CAST(N'1987-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-26 19:12:21.030' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (19, N'Amiya', N'Renner', N'diamond@creminterry.name', N'45b076e2-897d-4f7a-9e05-3f25c1fe80d2', N'ba74a4fe-9d21-420a-8a90-1516e55ef203', CAST(N'1987-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-27 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (20, N'Edwin', N'Reinger', N'isaac@zemlakkunde.com', N'3c30ec52-e332-4c7e-9bf2-34c3d0c05e81', N'867f6549-e8b4-4cb8-a7c0-56414dbf533d', CAST(N'1987-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-28 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (21, N'Jaqueline', N'Gleichner', N'hermann@crooks.biz', N'b558072f-cc22-4c6e-98aa-bb965e727a58', N'f395966b-3f72-4c2a-91a9-89ceb5a66795', CAST(N'1987-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-29 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (22, N'Carley', N'Conn', N'everette_turcotte@schimmelabernathy.ca', N'06a82f50-ca0e-42b0-ad86-65f198f7bec3', N'2b6e6bb5-ab71-438c-bfd3-7bdddf9c2f57', CAST(N'1987-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-11-30 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (23, N'Earl', N'Anderson', N'garth@hermanschumm.us', N'914d2c06-b2c1-4d60-a4a6-eb2b5b620dc0', N'9d83154e-4c4b-48e0-a59e-a3055952885a', CAST(N'1987-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-01 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (24, N'River', N'Bosco', N'victor_lowe@justyn.com', N'9cb9678d-46df-4354-8399-0eb93a8a73e4', N'67b13604-7a0f-4a32-bc8e-cff87883c87f', CAST(N'1987-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-02 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (25, N'Josianne', N'Weissnat', N'maggie_breitenberg@mantelehner.co.uk', N'7bf30c7c-cc52-4354-85cc-b3a36fcefafa', N'a845bef1-3fcf-4f4d-804b-ee90a76593b8', CAST(N'1987-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-03 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (26, N'Gerson', N'Hermann', N'iliana@rath.co.uk', N'6896af12-e260-4fa1-872f-88f39822560e', N'f02bcd71-bb17-4117-8b46-4347571593e9', CAST(N'1987-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-04 19:12:21.047' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (27, N'Avery', N'Nienow', N'lenny@erna.com', N'8136c2a3-6bef-40f8-9241-2cdc5765b7dc', N'050cd9da-aeeb-4e84-8d80-96b30da916a2', CAST(N'1987-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-05 19:12:21.060' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (28, N'Carlo', N'Bartoletti', N'dorothy@klingokon.uk', N'55ebbc27-9d18-46fb-bf1b-3eaf22336ceb', N'615b30b9-b5d7-4f26-a700-befccfc27d6c', CAST(N'1988-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-06 19:12:21.060' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (29, N'Louie', N'Howell', N'lucas@green.us', N'a0e3d588-f999-4299-8ed3-4e540b66c1f6', N'cc9227b6-5f31-48a0-af4c-805296f848a0', CAST(N'1988-03-01 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-07 19:12:21.060' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (30, N'Darby', N'Kihn', N'luella_volkman@jannie.us', N'0731d51e-4abd-49e8-a6bc-b516ae3ce32f', N'6943d7d0-6382-4df2-95b5-55221737d0bc', CAST(N'1988-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-08 19:12:21.060' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (31, N'Arch', N'Veum', N'kendall@neil.ca', N'17a02e11-c6d6-4ce8-94d6-13589c57eaf5', N'74086a5d-cca0-4740-a51f-bfa8da84db24', CAST(N'1988-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-09 19:12:21.060' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (32, N'Caden', N'Schinner', N'stanton_williamson@handcollier.uk', N'9697c7a1-2195-4c55-9591-cf7b106424ae', N'9b15a354-dc50-421e-a3dc-a24d07b5b3af', CAST(N'1988-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-10 19:12:21.060' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (33, N'Rhea', N'Heidenreich', N'enoch@thompsonfisher.co.uk', N'853157a0-01d3-4bde-a9ea-32a6f43c320a', N'90e5f701-42a7-4555-91e7-833c7751c394', CAST(N'1988-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-11 19:12:21.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (34, N'Mariam', N'Flatley', N'taurean@arnold.ca', N'7cbbf68a-a502-4be6-a136-12e2f06f457e', N'04e7bd6f-7759-477e-b8bb-98ce63c9ede4', CAST(N'1988-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-12 19:12:21.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (35, N'Jacynthe', N'Senger', N'silas.braun@conn.ca', N'83bd2c39-48e4-4e66-9a67-890d8ca1c9d1', N'daae9b86-2112-4089-ba22-cae9a9f46ed5', CAST(N'1988-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-13 19:12:21.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (36, N'Rodrick', N'Barton', N'jaylin_hauck@lemke.info', N'7531fccb-635c-42e3-b8c2-f2ada23a1223', N'b4dfdd80-5ec6-43c5-8d94-7ad1c3317496', CAST(N'1988-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-14 19:12:21.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (37, N'Laisha', N'Oberbrunner', N'ignatius_feest@ewald.info', N'1dd68967-2593-472f-b95a-c4606f705fc5', N'48f7c311-46fa-4579-a3f6-d6fa065d526c', CAST(N'1988-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-15 19:12:21.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (38, N'Milton', N'Balistreri', N'wava@koelpinkunde.uk', N'ec958a16-b7e3-47c1-9b69-ed8da728c312', N'e5819317-113e-4f05-9479-242f77ece577', CAST(N'1988-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-16 19:12:21.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (39, N'Deja', N'Barrows', N'bailey@jacobsonboehm.co.uk', N'75b67a02-05d4-4882-b66b-c8803c335387', N'30fac090-5b54-4a4b-989a-7fdc7cff5d8d', CAST(N'1988-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-17 19:12:21.093' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (40, N'Noemi', N'Osinski', N'maddison_friesen@willie.com', N'f08b4c5f-1e6c-43fe-99e9-9aa782431756', N'9786ea78-53e4-4dff-8e84-d3a34c789c3c', CAST(N'1989-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-18 19:12:21.093' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (41, N'Devon', N'Cartwright', N'sunny@guy.co.uk', N'a14e6c50-862c-4ebf-9451-6fb7b94fceda', N'd1c8c224-3f9e-4675-ba85-63ef69cb1529', CAST(N'1989-03-02 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-19 19:12:21.093' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (42, N'Chad', N'Lakin', N'sean@bergnaumparker.info', N'4a3d10e5-696a-400d-87e4-7102be637b70', N'3af983df-9f42-4fbe-ae64-b41fc63064d1', CAST(N'1989-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-20 19:12:21.093' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (43, N'Gunner', N'Littel', N'alice@cartwrightdavis.biz', N'ed89062b-28b5-4e79-b7ae-204761f87fe0', N'1aea1cf3-66eb-4739-9c47-6a061cbef532', CAST(N'1989-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-21 19:12:21.093' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (44, N'Madilyn', N'Hilpert', N'jane@jakubowski.us', N'3a25d089-7518-4e84-a0c6-99c24a383429', N'31a329a5-72b0-4a48-b280-b5ac648d3f26', CAST(N'1989-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-22 19:12:21.093' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (45, N'Darrin', N'Feest', N'armani@gorczany.biz', N'e7fc4dda-f61d-4247-a094-9a1f3938acbc', N'ab396824-34ef-4fb0-b7c7-8a1e138ec98d', CAST(N'1989-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-23 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (46, N'Edgar', N'Blanda', N'demetrius_prohaska@kub.co.uk', N'1aecbc98-7383-4f1b-8a96-0fd8806e666d', N'd4fda5a4-01f1-4e09-90f9-63c3eb7d426f', CAST(N'1989-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-24 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (47, N'Kirk', N'Gleason', N'claude_abbott@darlene.us', N'90658e6a-c63c-49ab-9f94-6fbdd3ed5ff9', N'6bd222d8-11c8-4593-8b00-2b850ff7ca28', CAST(N'1989-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-25 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (48, N'Lyla', N'Runolfsdottir', N'fatima_nikolaus@ratkemills.biz', N'75926ec4-6e58-4880-b9ae-3a6c8d745e9e', N'a3284722-801b-4b4f-9b49-b205e9ba173d', CAST(N'1989-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-26 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (49, N'Brandyn', N'Stehr', N'newton.daugherty@aida.info', N'23fb1f13-3e1d-4658-8b37-d299f7013ee4', N'0bcbdbb2-a533-494b-8bae-98d45c8bc40b', CAST(N'1989-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-27 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (50, N'Stephany', N'Fay', N'solon_baumbach@heidenreichboyle.name', N'f54908ed-68ea-4160-bede-c1f2c909187f', N'a4d8bc57-c026-47aa-a60a-751888ce709b', CAST(N'1989-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-28 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (51, N'Alek', N'Okuneva', N'louie@daniel.name', N'03421af2-c253-4396-87ca-574010a4b743', N'cb96a1c1-badb-44f5-8467-6ca0390fd858', CAST(N'1989-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-29 19:12:21.107' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (52, N'Angel', N'O''Conner', N'virgie.kilback@gibsonkertzmann.com', N'76e4cfa7-f497-4f44-8f76-08655c266eff', N'fecdf7a0-73f3-4a12-a444-4397b00253bf', CAST(N'1990-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-30 19:12:21.123' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (53, N'Reina', N'Becker', N'eleanore@joe.name', N'2cec5050-255f-4246-9eb6-1bda7aacba97', N'76bd33dc-f702-474b-8692-b22bf2b2af93', CAST(N'1990-03-02 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2015-12-31 19:12:21.123' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (54, N'Izaiah', N'Connelly', N'sadie.kutch@bailey.co.uk', N'7fc07145-24b2-4a24-9051-1d8b85eeec8d', N'0d2dde89-6d04-4d09-96a6-ce0e2871dea3', CAST(N'1990-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-01 19:12:21.123' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (55, N'Cary', N'Abernathy', N'alden@marshall.info', N'f9014096-e3d1-4f0f-892e-8fbea4421acd', N'4e209e22-ba32-4bf9-b383-d33bc272f410', CAST(N'1990-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-02 19:12:21.123' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (56, N'Gennaro', N'Kris', N'leila@leffler.biz', N'74639fc6-9fd5-458e-84cd-5cdbc583a84a', N'9f7fec85-d685-4721-b54c-16a2b9bfbf3e', CAST(N'1990-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-03 19:12:21.123' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (57, N'Moshe', N'Windler', N'sidney_feest@stehrkoelpin.info', N'6e1c12a4-8969-4523-a09c-553fd9d81287', N'cdd458a1-14b0-4362-a1a5-7fa1011720f5', CAST(N'1990-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-04 19:12:21.140' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (58, N'Gwen', N'Koch', N'favian.bosco@blick.co.uk', N'8d04f8f0-35ac-402d-9b77-4739b5b98753', N'dbe584fb-26b8-424b-9f97-12ff14c5e3b0', CAST(N'1990-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-05 19:12:21.140' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (59, N'Clair', N'Jacobi', N'izabella@malinda.name', N'9ff5562a-2570-46dd-9ff7-74aacf082fc4', N'eeb6aebe-d6d0-447e-a28e-133c25b1dbed', CAST(N'1990-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-06 19:12:21.140' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (60, N'Zack', N'Mayert', N'jaeden.hilll@gottlieb.uk', N'6f980326-2bd0-4732-9946-8b1e7c0637ef', N'fe299806-e952-4959-a499-23e2e56075bf', CAST(N'1990-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-07 19:12:21.140' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (61, N'Obie', N'Marvin', N'hollie@luther.co.uk', N'61d8326c-d59a-4e93-a032-3ab937ef545c', N'897bb778-52e1-47c6-8e19-5294378593ce', CAST(N'1990-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-08 19:12:21.140' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (62, N'Devin', N'Cummerata', N'cora@adrienne.name', N'0ab83347-ff09-4298-859b-9e016a38e5bc', N'6bda11a8-bdef-4d1c-b4d1-b0a9d4fd664c', CAST(N'1990-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-09 19:12:21.140' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (63, N'Ignacio', N'Block', N'marianne@wittingkonopelski.com', N'f2d2a8f2-29f7-4d6e-ac28-a82b11bfd9bf', N'd4358f19-2704-4389-a8a1-7ce63ea7a39e', CAST(N'1990-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-10 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (64, N'Keyon', N'Abbott', N'william_schroeder@pollich.uk', N'ff7a6a78-2c11-47b9-ad16-61fd34b249d1', N'4bc46a46-4fd0-4942-87f8-2653d386e2a7', CAST(N'1991-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-11 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (65, N'Adrienne', N'Wisoky', N'quinn@jacobsonleffler.biz', N'ba9b68a2-0eb3-4e48-8f68-a55adf08ed14', N'db567ff6-7c3d-4696-89a1-3a60fdc97ba5', CAST(N'1991-03-02 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-12 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (66, N'Michale', N'Rath', N'brannon@medhurstbarton.us', N'4d6329d8-63db-49f5-b46e-790c19431850', N'fea96462-3dad-4931-b808-34c1e48cbff2', CAST(N'1991-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-13 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (67, N'Rogelio', N'Corkery', N'assunta@douglas.biz', N'd5c475d3-d353-4aca-8d8a-6fa7e3eeb33a', N'98ceb9ee-3680-4236-af11-b2b76c004898', CAST(N'1991-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-14 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (68, N'Arely', N'Kovacek', N'amara.hermann@langworth.ca', N'bdffb5ab-a169-4f97-9fb9-123747903a14', N'b80b6cfe-f0c7-4ffd-94a0-469de76000fd', CAST(N'1991-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-15 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (69, N'Janis', N'Hickle', N'lorine_quigley@runte.info', N'aef1f9b8-dbf7-4963-b637-2fd34e54ff1f', N'ef775951-f469-46e2-b48e-4d4b86a89b75', CAST(N'1991-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-16 19:12:21.157' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (70, N'Roel', N'Kessler', N'toney_rath@valentina.us', N'7e0438b2-73ca-43cd-8b88-6d6efe3104d1', N'dc746abf-4224-41dd-9fa0-459b3b5daca1', CAST(N'1991-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-17 19:12:21.170' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (71, N'Raphael', N'Abshire', N'monroe@marcos.us', N'97b63ea0-874b-4b8b-a5ad-acb39b8569a2', N'c508d993-6821-4806-b9ce-0342efceaea8', CAST(N'1991-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-18 19:12:21.170' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (72, N'Junius', N'Steuber', N'shany@ortiz.com', N'55716cd0-c186-46e5-8179-cc156eaf94e1', N'1da56bd1-b910-4796-89bc-225a25b81644', CAST(N'1991-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-19 19:12:21.170' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (73, N'Gunner', N'Macejkovic', N'erika_doyle@lorenza.co.uk', N'6adcf244-002c-4699-95e4-725e53d1f820', N'd905b402-6809-4205-a5c8-490a7db1972f', CAST(N'1991-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-20 19:12:21.170' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (74, N'Keaton', N'Hoeger', N'autumn@columbus.uk', N'c0548e52-9a17-4cf7-857f-dc5b1a325731', N'1a816ef4-2c58-46ba-a458-ada054674534', CAST(N'1991-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-21 19:12:21.170' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (75, N'Sydnee', N'Thompson', N'marcos@tremblay.name', N'99e4cc91-51a4-4fa4-b4f7-f12928b276a0', N'318b5761-aa4f-4c09-8748-1e0323310623', CAST(N'1991-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-22 19:12:21.170' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (76, N'Ward', N'Pacocha', N'dovie.runte@stiedemannbahringer.co.uk', N'067d5170-8e64-447e-9073-6caac0f3333f', N'd8c7bbe3-b91f-4456-9c45-6a13382b51d4', CAST(N'1992-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-23 19:12:21.187' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (77, N'Sammy', N'Schmidt', N'augustus_stroman@thompsonwolff.us', N'a1670045-9227-44e2-ae2d-5e43f7121f9e', N'97db7ae9-c953-4589-ad44-e7f63bfabb93', CAST(N'1992-03-01 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-24 19:12:21.187' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (78, N'Noel', N'Ryan', N'jamar.anderson@ledner.us', N'48279680-fcd1-4a26-9d91-d2ab100c437f', N'2c265ee9-84ce-40f3-8ace-7dfe6dbc6fad', CAST(N'1992-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-25 19:12:21.187' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (79, N'Zoey', N'Bechtelar', N'sandrine_fisher@rey.biz', N'5b4034eb-abd4-4cf7-b22c-a6f13909589c', N'b57a9af5-b4f1-471c-9943-0c041cc5245a', CAST(N'1992-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-26 19:12:21.187' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (80, N'Dawson', N'Pacocha', N'pauline@stammschulist.name', N'7ee68826-f64b-4711-bad9-daf3773c3ff8', N'bb49077e-269e-4af8-b65e-2086843a3e98', CAST(N'1992-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-27 19:12:21.187' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (81, N'Ceasar', N'Greenholt', N'telly@dalton.us', N'df26d586-a202-4408-ac1b-770acec8b329', N'7334d416-6f69-48f1-8279-50f3cf850d1d', CAST(N'1992-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-28 19:12:21.187' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (82, N'Virginie', N'Gleichner', N'aimee@rolfson.info', N'7eceb976-6c5d-4a21-ab7a-6f0f6a31d3cd', N'd17c57c4-02af-4d4f-8c72-998f494d6f48', CAST(N'1992-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-29 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (83, N'Reuben', N'Purdy', N'mckayla@katheryn.ca', N'ca86babc-fbd9-42b3-bd41-b545efbd2f9e', N'48619fc3-1cba-4ea9-8147-4b0762661803', CAST(N'1992-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-30 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (84, N'Josue', N'Bradtke', N'margarette_cruickshank@mclaughlinhermann.name', N'c5ff50b9-ee1c-4884-a556-698478e1530d', N'f1d431a8-6a96-4a5f-8460-7b5b23e68d02', CAST(N'1992-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-01-31 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (85, N'Katherine', N'Collins', N'lulu@franeckioconnell.info', N'f48ff22d-4480-4eac-88af-4e66e76e3673', N'7170204d-c0f7-40df-b7d8-5c32bc428b78', CAST(N'1992-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-01 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (86, N'Adeline', N'Conn', N'sydney_connelly@mozelle.com', N'23f5c233-1195-4463-951f-f9f348154a4c', N'7bba5836-5c2e-4451-a124-a6f90368cc1b', CAST(N'1992-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-02 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (87, N'Eldridge', N'Rodriguez', N'katharina.prohaska@kuhic.com', N'c375497a-a186-42bd-96f9-28a6f6d0d05b', N'8a08d8dc-06e3-4e79-ad25-fe4ac80397b1', CAST(N'1992-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-03 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (88, N'Beau', N'Zemlak', N'weston@jaylon.co.uk', N'b4c25f61-5510-41ad-8d94-708924432c70', N'58491ff7-d47d-46af-a739-465f2df5cb8a', CAST(N'1993-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-04 19:12:21.203' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (89, N'Viva', N'Kling', N'mary@farrellweimann.ca', N'2147f2df-10be-4c97-9cd9-21d87db122dc', N'545e03d6-b60a-41c7-bd1c-845c007dfc5c', CAST(N'1993-03-02 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-05 19:12:21.217' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (90, N'Chelsie', N'Hilll', N'aidan.bradtke@beierfarrell.biz', N'51e517f8-9d81-40e3-985a-6b8c39da381b', N'b1f38de6-fd2c-4229-8a5b-1f154dff306d', CAST(N'1993-03-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-06 19:12:21.217' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (91, N'Kylee', N'Reichert', N'fredrick_wolff@ullrichconsidine.com', N'066f7e38-05dc-4072-bd48-a12a165a45b4', N'7b02b0bb-2150-4b0a-8bb1-b882ba3c5fd7', CAST(N'1993-04-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-07 19:12:21.217' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (92, N'Tomasa', N'Connelly', N'elenora_bode@rutherfordbernhard.co.uk', N'0e77948e-ce6c-471b-99d5-e6166847bfd6', N'3733e4ef-5e11-4d80-8a88-736798574c7a', CAST(N'1993-05-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-08 19:12:21.217' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (93, N'Derek', N'Hamill', N'ashlynn@blake.co.uk', N'64d40f64-c703-495b-ae80-c7533d0d98e8', N'72845668-0bb8-4b5f-92e8-e4f4b1d6423e', CAST(N'1993-06-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-09 19:12:21.217' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (94, N'Sincere', N'Bergstrom', N'kathryne_botsford@carroll.biz', N'9861654d-5adb-4639-8499-d01cf2f9712b', N'08cdf084-093b-4b10-9532-e643df1d2e54', CAST(N'1993-07-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-10 19:12:21.217' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (95, N'Delmer', N'Bayer', N'art_parker@rath.co.uk', N'5411c533-6c9c-4427-9e1e-032b039a20bc', N'3424019a-4433-48c9-ba3a-dcd664f88056', CAST(N'1993-08-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-11 19:12:21.233' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (96, N'Turner', N'Paucek', N'zackary.kilback@hayes.uk', N'cff9a09c-75e6-48ce-a762-984bd6c5a391', N'be7091bd-4c77-4c51-8fd2-3466409ab699', CAST(N'1993-09-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-12 19:12:21.233' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (97, N'Lucienne', N'Abernathy', N'rey@damore.ca', N'2032046f-a710-4691-9591-a66bcdd417a8', N'dfe52e17-164c-4d3b-a1c1-f8a836d8b1ed', CAST(N'1993-10-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-13 19:12:21.233' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (98, N'Selena', N'Doyle', N'viola_blick@adella.biz', N'75410956-e155-4af6-8d0d-61e137baee02', N'c84b902a-8cca-40fc-b2f3-2e510fc25f22', CAST(N'1993-11-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-14 19:12:21.233' AS DateTime))
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (99, N'Gust', N'Thiel', N'kiley@conn.uk', N'4bb3bd8f-8050-4aae-aac4-aab307116ec8', N'e6ce3d64-8ef7-4e0a-b78a-53b1a1c80e74', CAST(N'1993-12-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-15 19:12:21.233' AS DateTime))
GO
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Email], [IdentityCard], [UniqueKey], [DateOfBirth], [Mobile], [RegistrationDate]) VALUES (100, N'Theodore', N'Hodkiewicz', N'rhea@devante.com', N'c3395f75-a41a-4ecb-b5c5-224f9d227699', N'5db0c3a9-aea0-432b-b72e-77228b9ce2ec', CAST(N'1994-01-30 00:00:00.000' AS DateTime), N'1234567890', CAST(N'2016-02-16 19:12:21.250' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([ID], [Name]) VALUES (1, N'Comedy')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (2, N'Sci-fi')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (3, N'Action')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (4, N'Horror')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (5, N'Romance')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (6, N'Comedy')
INSERT [dbo].[Genre] ([ID], [Name]) VALUES (7, N'Crime')
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (1, N'Minions', N'Minions Stuart, Kevin and Bob are recruited by Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world.', N'minions.jpg', 1, N'Kyle Bald', N'Brian Lynch', N'Janet Healy', CAST(N'2015-07-10 00:00:00.000' AS DateTime), 3, N'https://www.youtube.com/watch?v=Wfql_DoHRKc')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (2, N'Ted 2', N'Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he''s a person in a court of law.', N'ted2.jpg', 1, N'Seth MacFarlane', N'Seth MacFarlane', N'Jason Clark', CAST(N'2015-06-27 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=S3AVcCggRnU')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (3, N'Trainwreck', N'Having thought that monogamy was never possible, a commitment-phobic career woman may have to face her fears when she meets a good guy.', N'trainwreck.jpg', 2, N'Judd Apatow', N'Amy Schumer', N'Judd Apatow', CAST(N'2015-07-17 00:00:00.000' AS DateTime), 5, N'https://www.youtube.com/watch?v=2MxnhBPoIx4')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (4, N'Inside Out', N'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.', N'insideout.jpg', 1, N'Pete Docter', N'Pete Docter', N'John Lasseter', CAST(N'2015-06-19 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=seMwpP0yeu4')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (5, N'Home', N'Oh, an alien on the run from his own people, lands on Earth and makes friends with the adventurous Tip, who is on a quest of her own.', N'home.jpg', 1, N'Tim Johnson', N'Tom J. Astle', N'Suzanne Buirgy', CAST(N'2015-05-27 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=MyqZf8LiWvM')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (6, N'Batman v Superman: Dawn of Justice', N'Fearing the actions of a god-like Super Hero left unchecked, Gotham City''s own formidable, forceful vigilante takes on Metropolis most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it''s ever known before.', N'batmanvssuperman.jpg', 2, N'Zack Snyder', N'Chris Terrio', N'Wesley Coller', CAST(N'2015-03-25 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=0WWzgGyAH6Y')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (7, N'Ant-Man', N'Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, plan and pull off a heist that will save the world.', N'antman.jpg', 2, N'Payton Reed', N'Edgar Wright', N'Victoria Alonso', CAST(N'2015-07-17 00:00:00.000' AS DateTime), 5, N'https://www.youtube.com/watch?v=1HpZevFifuo')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (8, N'Jurassic World', N'A new theme park is built on the original site of Jurassic Park. Everything is going well until the park''s newest attraction--a genetically modified giant stealth killing machine--escapes containment and goes on a killing spree.', N'jurassicworld.jpg', 2, N'Colin Trevorrow', N'Rick Jaffa', N'Patrick Crowley', CAST(N'2015-06-12 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=RFinNxS5KN4')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (9, N'Fantastic Four', N'Four young outsiders teleport to an alternate and dangerous universe which alters their physical form in shocking ways. The four must learn to harness their new abilities and work together to save Earth from a former friend turned enemy.', N'fantasticfour.jpg', 2, N'Josh Trank', N'Simon Kinberg', N'Avi Arad', CAST(N'2015-08-07 00:00:00.000' AS DateTime), 2, N'https://www.youtube.com/watch?v=AAgnQdiZFsQ')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (10, N'Mad Max: Fury Road', N'In a stark desert landscape where humanity is broken, two rebels just might be able to restore order: Max, a man of action and of few words, and Furiosa, a woman of action who is looking to make it back to her childhood homeland.', N'madmax.jpg', 2, N'George Miller', N'George Miller', N'Bruce Berman', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 3, N'https://www.youtube.com/watch?v=hEJnMQG9ev8')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (11, N'True Detective', N'An anthology series in which police investigations unearth the personal and professional secrets of those involved, both within and outside the law.', N'truedetective.jpg', 6, N'Nic Pizzolatto', N'Bill Bannerman', N'Richard Brown', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=TXwCoNwBSkQ')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (12, N'The Longest Ride', N'After an automobile crash, the lives of a young couple intertwine with a much older man, as he reflects back on a past love.', N'thelongestride.jpg', 5, N'Nic Pizzolatto', N'George Tillman Jr.', N'Marty Bowen', CAST(N'2015-05-15 00:00:00.000' AS DateTime), 5, N'https://www.youtube.com/watch?v=FUS_Q7FsfqU')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (13, N'The Walking Dead', N'Sheriff''s Deputy Rick Grimes leads a group of survivors in a world overrun by zombies.', N'thewalkingdead.jpg', 4, N'Frank Darabont', N'David Alpert', N'Gale Anne Hurd', CAST(N'2015-03-28 00:00:00.000' AS DateTime), 5, N'https://www.youtube.com/watch?v=R1v0uFms68U')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (14, N'Southpaw', N'Boxer Billy Hope turns to trainer Tick Willis to help him get his life back on track after losing his wife in a tragic accident and his daughter to child protection services.', N'southpaw.jpg', 3, N'Antoine Fuqua', N'Kurt Sutter', N'Todd Black', CAST(N'2015-08-17 00:00:00.000' AS DateTime), 4, N'https://www.youtube.com/watch?v=Mh2ebPxhoLs')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Image], [GenreId], [Director], [Writer], [Producer], [ReleaseDate], [Rating], [TrailerURI]) VALUES (15, N'Specter', N'A cryptic message from Bond''s past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.', N'spectre.jpg', 3, N'Sam Mendes', N'Ian Fleming', N'Zakaria Alaoui', CAST(N'2015-11-05 00:00:00.000' AS DateTime), 5, N'https://www.youtube.com/watch?v=LTDaET-JweU')
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (1, 1, N'44eb7275-248b-40bf-a420-cc401240e597', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (2, 1, N'452099fb-cbf9-4431-a441-a5e314bb5dc4', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (3, 1, N'e564e5ea-e6a8-4172-9ca9-1fd772dc37a0', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (4, 2, N'8262a407-7901-4859-9bf7-78257cd08a66', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (5, 2, N'7ac59b6f-e226-4e31-82e5-b2e2e823ff70', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (6, 2, N'23c9757e-ef47-4577-aef9-2d07b6539942', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (7, 3, N'41ab0b0c-9fa7-410c-9c01-caac0ae254d0', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (8, 3, N'bebd2201-c9b8-4188-aa93-5ea93601c535', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (9, 3, N'd6a7bf55-0413-4483-8e06-34667061348d', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (10, 4, N'689183c5-083a-4858-b412-235ccbecd667', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (11, 4, N'20c05100-6ccb-48b0-acb0-606b42eb5427', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (12, 4, N'955f9187-5e53-4c73-b571-71f527f2e100', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (13, 5, N'4b3a90b3-5233-48db-a551-5bc07ff411a4', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (14, 5, N'70ccd2ee-89f4-40f4-ac95-06b13fbd9b6b', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (15, 5, N'a3e41fd1-1bee-4e04-9af8-c92946ac6200', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (16, 6, N'0fe18c23-1429-4d21-8e8d-3e5b0f72260d', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (17, 6, N'd2aa7983-ae0c-4c65-b439-a18e3ba6a286', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (18, 6, N'a603ee40-6eff-4c7f-9fa1-0f2aeea8f1ab', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (19, 7, N'3bff95f9-7cc5-486a-86f2-a3c0d404a451', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (20, 7, N'4a50574c-8f15-47e1-921d-a584be6789ad', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (21, 7, N'b96d6080-4c35-449d-943c-402e776bc8f1', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (22, 8, N'0092620f-38d6-4952-a279-d6e861e8393f', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (23, 8, N'b05b14e5-3027-4add-be5a-c03b4573a85a', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (24, 8, N'9bf3512e-1d4f-4b97-93d3-9b96741bc35b', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (25, 9, N'4d9f610b-3f37-4bd8-be40-341702bdee2d', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (26, 9, N'70546a29-21f8-48bc-9368-b6d18aeb17c6', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (27, 9, N'1b72f9d0-c9ff-4842-aab4-bb5247d4cbec', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (28, 10, N'd3da1719-3103-4480-90d7-e3159a6a98ec', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (29, 10, N'72f65da8-fbda-4011-be14-cfe5e0c0db39', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (30, 10, N'1d590dfc-aed6-45e4-b35b-8f5e16771827', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (31, 11, N'f1b7ce5b-9462-4e79-bc69-7244ac580005', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (32, 11, N'96b1c39f-3fe3-4f86-a870-4bc9a3286fe2', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (33, 11, N'd541e1a4-c961-4ed2-9bf0-44c80265fd72', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (34, 12, N'3439eedd-4638-4e21-b1cb-f783ea8d619d', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (35, 12, N'ec5876bd-e10b-4599-8b54-d929b03108bd', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (36, 12, N'0fd5faea-ec33-410e-b153-e00bc6b3b3bb', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (37, 13, N'036945b0-581b-44ed-a4d4-80108d5e4f3b', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (38, 13, N'4cfcffc8-9e51-4c49-b4f7-442d71cadc2a', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (39, 13, N'fdb39ed7-20af-46f7-a430-df1beb555883', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (40, 14, N'37629817-7541-4024-b783-9b9c54cf8119', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (41, 14, N'0732d7d5-9095-4cb6-9c1b-e9cb111784b7', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (42, 14, N'0fc1d3dc-0035-406d-a87f-42c41df95dee', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (43, 15, N'e3300cee-0e23-441c-8845-b3528921a403', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (44, 15, N'1356dcfa-9449-46de-bbbb-827b35d9ac86', 1)
INSERT [dbo].[Stock] ([ID], [MovieId], [UniqueKey], [IsAvailable]) VALUES (45, 15, N'80b092ce-4ef6-4a88-bd7f-5dc48128cec0', 1)
SET IDENTITY_INSERT [dbo].[Stock] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Email], [HashedPassword], [Salt], [IsLocked], [DateCreated]) VALUES (1, N'homecinema', N'kroudim@gmail.com', N'miAPvH6RTwbAA5hhReYcNqyj9ruPv0Q3+dsDSyGxeg8=', N'1dQfQG2jv7QOd+Eo3j9aWQ==', 0, CAST(N'2015-11-09 19:12:21.687' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([ID], [UserId], [RoleId]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
/****** Object:  Index [IX_GenreId]    Script Date: 11/9/2015 7:15:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_GenreId] ON [dbo].[Movie]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StockId]    Script Date: 11/9/2015 7:15:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_StockId] ON [dbo].[Rental]
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieId]    Script Date: 11/9/2015 7:15:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieId] ON [dbo].[Stock]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/9/2015 7:15:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/9/2015 7:15:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Movie_dbo.Genre_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_dbo.Movie_dbo.Genre_GenreId]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rental_dbo.Stock_StockId] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_dbo.Rental_dbo.Stock_StockId]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Stock_dbo.Movie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_dbo.Stock_dbo.Movie_MovieId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId]
GO
USE [master]
GO
ALTER DATABASE [HomeCinema] SET  READ_WRITE 
GO
