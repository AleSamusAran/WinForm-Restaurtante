USE [Restaurante]
GO
/****** Object:  Table [dbo].[atencion]    Script Date: 16/08/2018 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atencion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMesa] [int] NULL,
	[IdEmpleado] [int] NULL,
	[Activa] [bit] NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_atencion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[atencionplatos]    Script Date: 16/08/2018 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atencionplatos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAtencion] [int] NULL,
	[IdPlato] [int] NULL,
 CONSTRAINT [PK_atencionplatos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleados]    Script Date: 16/08/2018 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [nvarchar](150) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[dni] [int] NOT NULL,
 CONSTRAINT [PK_empleados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mesas]    Script Date: 16/08/2018 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mesas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NULL,
 CONSTRAINT [PK_mesas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[platos]    Script Date: 16/08/2018 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NULL,
 CONSTRAINT [PK_platos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [apellido], [nombre], [dni]) VALUES (1, N'Villa', N'Andrés', 12312312)
SET IDENTITY_INSERT [dbo].[empleados] OFF
SET IDENTITY_INSERT [dbo].[mesas] ON 

INSERT [dbo].[mesas] ([id], [nombre]) VALUES (2, N'Mesa Pared')
INSERT [dbo].[mesas] ([id], [nombre]) VALUES (3, N'Mesa Entrada Izq.')
SET IDENTITY_INSERT [dbo].[mesas] OFF
ALTER TABLE [dbo].[atencion]  WITH CHECK ADD  CONSTRAINT [FK_atencion_empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[atencion] CHECK CONSTRAINT [FK_atencion_empleados]
GO
ALTER TABLE [dbo].[atencionplatos]  WITH CHECK ADD  CONSTRAINT [FK_atencionplatos_platos] FOREIGN KEY([IdAtencion])
REFERENCES [dbo].[platos] ([Id])
GO
ALTER TABLE [dbo].[atencionplatos] CHECK CONSTRAINT [FK_atencionplatos_platos]
GO
USE [master]
GO
ALTER DATABASE [Restaurante] SET  READ_WRITE 
GO
