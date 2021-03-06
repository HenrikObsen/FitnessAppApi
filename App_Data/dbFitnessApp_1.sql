USE [dbFitnessApp_1]
GO
ALTER TABLE [dbo].[SessionWeight] DROP CONSTRAINT [SessionWeight_fk0]
GO
ALTER TABLE [dbo].[SessionItem] DROP CONSTRAINT [SessionItem_fk1]
GO
ALTER TABLE [dbo].[SessionItem] DROP CONSTRAINT [SessionItem_fk0]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [Session_fk0]
GO
ALTER TABLE [dbo].[Program] DROP CONSTRAINT [Program_fk0]
GO
ALTER TABLE [dbo].[Exercise] DROP CONSTRAINT [Exercise_fk0]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[SessionWeight]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[SessionWeight]
GO
/****** Object:  Table [dbo].[SessionItem]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[SessionItem]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[Program]
GO
/****** Object:  Table [dbo].[MuscleGroup]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[MuscleGroup]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 11-04-2018 08:25:45 ******/
DROP TABLE [dbo].[Exercise]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MuscleGroupID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Image] [varchar](255) NULL,
	[Video] [varchar](255) NULL,
 CONSTRAINT [PK_EXERCISE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MuscleGroup]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuscleGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MUSCLEGROUP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Program]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Created] [date] NOT NULL,
	[Notes] [text] NOT NULL,
 CONSTRAINT [PK_PROGRAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sorting] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[Notes] [text] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_SESSION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionItem]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[ExerciseID] [int] NOT NULL,
	[Sets] [int] NOT NULL,
	[Reps] [int] NULL,
	[Pause] [int] NOT NULL,
	[Notes] [text] NULL,
	[LastRun] [date] NULL,
 CONSTRAINT [PK_SESSIONITEM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionWeight]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionWeight](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionItemID] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_SESSIONWEIGHT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11-04-2018 08:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Role] [varchar](255) NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Exercise] ON 

INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (1, 1, N'Squat', N'Squat.jpg', N'https://www.youtube.com/embed/Dy28eq2PjcM')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (2, 1, N'Lunges', N'lunges.jpg', N'https://www.youtube.com/embed/D7KaRcUTQeE')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (3, 1, N'Calf raises', N'calf-raises.jpg', N'https://www.youtube.com/embed/3UWi44yN-wM')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (4, 1, N'Dødløft', N'Dødløft.jpg', N'https://www.youtube.com/embed/91TMWH1AYAM')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (5, 2, N'Bænkpress (smalt greb)', N'Bænkpress-med-smalt-greb.jpg', N'https://www.youtube.com/embed/yeRhu9DdihM')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (6, 2, N'Bænkpress', N'Bænkpres.jpg', N'https://www.youtube.com/embed/uhOr-YfMaL4')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (7, 2, N'Armbøjninger', N'Armbøjninger.jpg', N'https://www.youtube.com/embed/IODxDxX7oi4')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (8, 3, N'Rows', N'Rows.jpg', N'https://www.youtube.com/embed/-koP10y1qZI')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (9, 3, N'Chinups', N'Chinups.jpg', N'https://www.youtube.com/embed/bd_A0kDAyK4')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (10, 3, N'Træk-til-bryst', N'træk-til-bryst.jpg', N'https://www.youtube.com/embed/Zxh8DNcRq50')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (11, 4, N'Dumbell Press', N'Dumbell-press.jpg', N'https://www.youtube.com/embed/VmB1G1K7v94')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (12, 4, N'Bent-over lateral raises', N'Bentover-lateral-raises.jpg', N'https://www.youtube.com/embed/ttvfGg9d76c')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (13, 4, N'Shoulder shrugs', N'skuldre-shugs.jpg', N'https://www.youtube.com/embed/cJRVVxmytaM')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (14, 5, N'Triceps extensions', N'Triceps-extensions.jpg', N'https://www.youtube.com/embed/_gsUck-7M74')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (15, 5, N'Biceps curls', N'Biceps_curls.png', N'https://www.youtube.com/embed/yTWO2th-RIY')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (16, 5, N'Triceps kickbacks', N'Triceps-kickbacks.jpg', N'https://www.youtube.com/embed/6SS6K3lAwZ8')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (17, 6, N'Hanging leg raises', N'hanging-leg-raises.jpg', N'https://www.youtube.com/embed/hdng3Nm1x_E')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (18, 6, N'Mavebøjninger', N'mavebojninger.jpg', N'https://www.youtube.com/embed/30PDah8JGZI')
INSERT [dbo].[Exercise] ([ID], [MuscleGroupID], [Name], [Image], [Video]) VALUES (19, 6, N'Chrunches', N'Crunches.jpg', N'https://www.youtube.com/embed/Xyd_fa5zoEU')
SET IDENTITY_INSERT [dbo].[Exercise] OFF
SET IDENTITY_INSERT [dbo].[MuscleGroup] ON 

INSERT [dbo].[MuscleGroup] ([ID], [Name]) VALUES (1, N'Ben')
INSERT [dbo].[MuscleGroup] ([ID], [Name]) VALUES (2, N'Bryst')
INSERT [dbo].[MuscleGroup] ([ID], [Name]) VALUES (3, N'Ryg')
INSERT [dbo].[MuscleGroup] ([ID], [Name]) VALUES (4, N'Skulder')
INSERT [dbo].[MuscleGroup] ([ID], [Name]) VALUES (5, N'Arme')
INSERT [dbo].[MuscleGroup] ([ID], [Name]) VALUES (6, N'Mave')
SET IDENTITY_INSERT [dbo].[MuscleGroup] OFF
SET IDENTITY_INSERT [dbo].[Program] ON 

INSERT [dbo].[Program] ([ID], [UserID], [Name], [Created], [Notes]) VALUES (2, 1, N'Begynder', CAST(N'2016-10-10' AS Date), N'Mit begynder program')
INSERT [dbo].[Program] ([ID], [UserID], [Name], [Created], [Notes]) VALUES (4, 1, N'Advarnced', CAST(N'2017-10-10' AS Date), N'Avanceret Program')
INSERT [dbo].[Program] ([ID], [UserID], [Name], [Created], [Notes]) VALUES (5, 1, N'Hårdkogt', CAST(N'2018-10-10' AS Date), N'Det jeg køre nu')
SET IDENTITY_INSERT [dbo].[Program] OFF
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([ID], [Name], [Sorting], [ProgramID], [Notes], [UserID]) VALUES (5, N'Mandag', 1, 2, N'Mandag', 1)
INSERT [dbo].[Session] ([ID], [Name], [Sorting], [ProgramID], [Notes], [UserID]) VALUES (6, N'Onsdag', 2, 2, N'Onsdag', 1)
INSERT [dbo].[Session] ([ID], [Name], [Sorting], [ProgramID], [Notes], [UserID]) VALUES (7, N'Fredag', 3, 2, N'Lørdag', 1)
SET IDENTITY_INSERT [dbo].[Session] OFF
SET IDENTITY_INSERT [dbo].[SessionItem] ON 

INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (2, 5, 1, 4, 10, 120, N'Husk, fokus på teknikken', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (3, 5, 5, 2, 12, 60, N'', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (4, 5, 6, 2, 12, 60, N'', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (5, 5, 8, 4, 12, 45, N'Husk, du trækker mod hoften og ikke brystet!', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (6, 5, 11, 4, 12, 45, N'Laver du altid dumbell press siddende?  Så prøv dem stående', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (7, 5, 16, 3, 12, 45, N'', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (8, 5, 17, 4, 12, 45, N'Hård, men powerful øvelse.', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (9, 6, 2, 3, 12, 90, N'', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (10, 6, 3, 3, 8, 60, N'Lav 8 reps eller indtil dine lægger brænder', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (11, 6, 6, 4, 10, 45, N'', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (12, 6, 7, 4, NULL, 45, N'Hold 12 sekunders pause mellem Bænkpres og Armbøjninger.', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (13, 6, 9, 4, NULL, 60, N'Skift mellem overhåndsgreb for at variere øvelsen', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (14, 6, 15, 3, 12, 45, N'Kør curls og kickbacks skiftevis (fx curl, kickbacks, pause - gentag!)', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (15, 6, 16, 3, 12, 45, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (16, 6, 18, 3, NULL, 45, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (17, 7, 4, 5, 5, 180, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (18, 7, 5, 5, 5, 120, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (19, 7, 10, 4, 6, 120, N'Øg vægten når der laves færre gentagelser, fx 60, 70, 80, 55', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (20, 7, 12, 3, 8, 90, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (21, 7, 13, 3, 8, 90, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (22, 7, 14, 2, 8, 90, NULL, CAST(N'2018-04-09' AS Date))
INSERT [dbo].[SessionItem] ([ID], [SessionID], [ExerciseID], [Sets], [Reps], [Pause], [Notes], [LastRun]) VALUES (23, 7, 19, 3, 12, 90, N'Brug eventielt ekstra vægt!', CAST(N'2018-04-09' AS Date))
SET IDENTITY_INSERT [dbo].[SessionItem] OFF
SET IDENTITY_INSERT [dbo].[SessionWeight] ON 

INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (1, 4, 50, CAST(N'2018-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (3, 4, 60, CAST(N'2018-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (4, 4, 70, CAST(N'2018-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (5, 4, 80, CAST(N'2018-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (6, 6, 100, CAST(N'2018-04-08T13:57:14.137' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (7, 6, 80, CAST(N'2018-04-08T13:57:21.560' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (8, 6, 60, CAST(N'2018-04-08T13:59:02.387' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (9, 6, 70, CAST(N'2018-04-08T13:59:53.813' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (10, 6, 80, CAST(N'2018-04-08T14:00:00.390' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (11, 3, 50, CAST(N'2018-04-08T17:03:07.573' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (12, 3, 55, CAST(N'2018-04-08T17:03:14.563' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (13, 3, 60, CAST(N'2018-04-08T17:03:18.187' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (14, 3, 65, CAST(N'2018-04-08T17:03:24.583' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (15, 14, 10, CAST(N'2018-04-08T17:30:55.387' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (16, 4, 80, CAST(N'2018-04-09T09:04:05.200' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (17, 4, 80, CAST(N'2018-04-09T09:04:08.973' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (18, 4, 80, CAST(N'2018-04-09T09:04:09.503' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (19, 4, 80, CAST(N'2018-04-09T09:04:09.890' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (20, 4, 80, CAST(N'2018-04-09T09:04:10.080' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (21, 4, 100, CAST(N'2018-04-09T09:04:20.093' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (22, 11, 80, CAST(N'2018-04-09T09:05:40.633' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (23, 17, 22, CAST(N'2018-04-09T09:18:01.733' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (24, 17, 44, CAST(N'2018-04-09T09:18:06.873' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (25, 17, 55, CAST(N'2018-04-09T09:18:11.830' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (26, 17, 70, CAST(N'2018-04-09T09:18:18.367' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (27, 16, 8, CAST(N'2018-04-09T12:31:49.550' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (28, 16, 10, CAST(N'2018-04-09T12:31:57.087' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (29, 2, 50, CAST(N'2018-04-09T15:00:39.967' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (30, 3, 40, CAST(N'2018-04-09T15:03:35.807' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (31, 3, 50, CAST(N'2018-04-09T15:05:31.263' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (32, 4, 50, CAST(N'2018-04-09T15:11:36.213' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (33, 4, 50, CAST(N'2018-04-09T15:11:44.810' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (34, 4, 80, CAST(N'2018-04-09T15:11:48.210' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (35, 4, 80, CAST(N'2018-04-09T15:11:48.880' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (36, 4, 80, CAST(N'2018-04-09T15:11:49.050' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (37, 4, 80, CAST(N'2018-04-09T15:11:49.223' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (38, 4, 50, CAST(N'2018-04-09T15:11:53.170' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (39, 4, 50, CAST(N'2018-04-09T15:12:31.550' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (40, 5, 12, CAST(N'2018-04-09T15:18:41.607' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (41, 6, 80, CAST(N'2018-04-09T15:24:03.347' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (42, 6, 40, CAST(N'2018-04-09T15:24:08.690' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (43, 6, 28, CAST(N'2018-04-09T15:31:56.943' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (44, 4, 50, CAST(N'2018-04-09T15:32:29.160' AS DateTime))
INSERT [dbo].[SessionWeight] ([ID], [SessionItemID], [Weight], [Time]) VALUES (45, 7, 10, CAST(N'2018-04-09T15:33:01.333' AS DateTime))
SET IDENTITY_INSERT [dbo].[SessionWeight] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Username], [Password], [Email], [Role]) VALUES (1, N'Henrik Obsen', N'Obsen', N'Obsen', N'hto@e-train.dk', N'User')
INSERT [dbo].[User] ([ID], [Name], [Username], [Password], [Email], [Role]) VALUES (2, N'Test', N'Test', N'Test', N'test@test2.dk', N'User')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Exercise]  WITH CHECK ADD  CONSTRAINT [Exercise_fk0] FOREIGN KEY([MuscleGroupID])
REFERENCES [dbo].[MuscleGroup] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Exercise] CHECK CONSTRAINT [Exercise_fk0]
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [Program_fk0] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [Program_fk0]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [Session_fk0] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [Session_fk0]
GO
ALTER TABLE [dbo].[SessionItem]  WITH CHECK ADD  CONSTRAINT [SessionItem_fk0] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SessionItem] CHECK CONSTRAINT [SessionItem_fk0]
GO
ALTER TABLE [dbo].[SessionItem]  WITH CHECK ADD  CONSTRAINT [SessionItem_fk1] FOREIGN KEY([ExerciseID])
REFERENCES [dbo].[Exercise] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SessionItem] CHECK CONSTRAINT [SessionItem_fk1]
GO
ALTER TABLE [dbo].[SessionWeight]  WITH CHECK ADD  CONSTRAINT [SessionWeight_fk0] FOREIGN KEY([SessionItemID])
REFERENCES [dbo].[SessionItem] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SessionWeight] CHECK CONSTRAINT [SessionWeight_fk0]
GO
