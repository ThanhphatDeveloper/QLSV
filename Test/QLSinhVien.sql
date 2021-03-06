USE [QLSinhVien]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 19/03/20 9:30:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 19/03/20 9:30:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MSSV] [nvarchar](10) NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[MaLop] [varchar](10) NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[TrangThai] [smallint] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'1', N'CĐ TH 17A')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'2', N'CĐ TH 17B')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'3', N'CĐN QTM 18C')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'4', N'TCTH 19')
SET IDENTITY_INSERT [dbo].[SinhVien] ON 

INSERT [dbo].[SinhVien] ([ID], [MSSV], [Ho], [Ten], [MaLop], [NgaySinh], [DiaChi], [TrangThai]) VALUES (1, N'0306181122', N'Nguyễn Văn', N'A', N'1', CAST(0x1D230B00 AS Date), N'Tân An - Long An', 1)
INSERT [dbo].[SinhVien] ([ID], [MSSV], [Ho], [Ten], [MaLop], [NgaySinh], [DiaChi], [TrangThai]) VALUES (2, N'0306191253', N'Lê Thị', N'B', N'2', CAST(0x73220B00 AS Date), N'Bến Lức - Long An', 1)
INSERT [dbo].[SinhVien] ([ID], [MSSV], [Ho], [Ten], [MaLop], [NgaySinh], [DiaChi], [TrangThai]) VALUES (3, N'0306171266', N'Phạm Quang', N'C', N'3', CAST(0xA3240B00 AS Date), N'Tân Trụ - Long An', 1)
INSERT [dbo].[SinhVien] ([ID], [MSSV], [Ho], [Ten], [MaLop], [NgaySinh], [DiaChi], [TrangThai]) VALUES (4, N'0306171256', N'Trần Đình', N'D', N'4', CAST(0x4A180B00 AS Date), N'Đức Hoà - Long An', 1)
INSERT [dbo].[SinhVien] ([ID], [MSSV], [Ho], [Ten], [MaLop], [NgaySinh], [DiaChi], [TrangThai]) VALUES (6, N'0306191152', N'Vũ Trung', N'E', N'3', CAST(0x04220B00 AS Date), N'Kiến Tường - Long An', 1)
SET IDENTITY_INSERT [dbo].[SinhVien] OFF
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Lop]
GO
