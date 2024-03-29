
CREATE DATABASE [ShopTraiCay]

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
/****** Object:  Table [dbo].[Cart]    Script Date: 3/16/2024 6:49:52 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/16/2024 6:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cId] [int] NOT NULL,
	[cName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/16/2024 6:49:52 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/16/2024 6:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[OrderItem]    Script Date: 3/16/2024 6:49:52 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/16/2024 6:49:52 PM ******/
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
/****** Object:  Table [dbo].[TransactionVnpay]    Script Date: 3/16/2024 6:49:52 PM ******/
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
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'baochau', N'202cb962ac59075b964b07152d234b70', N'Bao Chau', N'chauttbce171935@fpt.edu.vn', 0, 1, N'0367123321', N'Can Tho')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'group1', N'202cb962ac59075b964b07152d234b70', N'Group One', N'group01se1709@gmail.com', 1, 0, N'0912345678', N'113 NVC, An Khanh, Ninh Kieu, Can Tho, Vietnam')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'minhngoc', N'202cb962ac59075b964b07152d234b70', N'Minh Ngoc', N'ngocttmce171749@fpt.edu.vn', 0, 1, N'0901234567', N'Can Tho')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'minhnguyet', N'202cb962ac59075b964b07152d234b70', N'Minh Nguyet', N'nguyetnmce171546@fpt.edu.vn', 0, 1, N'0833123456', N'Can Tho')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'quocthai', N'202cb962ac59075b964b07152d234b70', N'Duong Thai', N'thai161003@gmail.com', 0, 1, N'0874985045', N'CT')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'thaidq', N'202cb962ac59075b964b07152d234b70', N'thai', N'lxlthailxl@gmail.com', 0, 1, N'0000000000', N'CT')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'thaine', N'202cb962ac59075b964b07152d234b70', N'Quoc Thai', N'thaidqce171563@fpt.edu.vn', 0, 1, N'0821345678', N'CT')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'thanhthu', N'202cb962ac59075b964b07152d234b70', N'Thu Vo', N'thuvtce170522@fpt.edu.vn', 1, 0, N'+84383395692', N'Ninh Kieu, Can Tho, Viet Nam')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'thune', N'f8d4f7994e1155d8cc5f9f9c7f6f5a7c', N'Thu Vo', N'thuvo464@gmail.com', 0, 1, N'+84383395692', N'Ninh Kieu, Can Tho, Viet Nam')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'trico', N'202cb962ac59075b964b07152d234b70', N'Tri Co', N'codtce171264@fpt.edu.vn', 0, 1, N'0866789012', N'Can Tho')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'yennhi', N'202cb962ac59075b964b07152d234b70', N'Yen Nhi', N'nnhinlyce172006@fpt.edu.vn', 0, 1, N'0852000111', N'Can Tho')
GO
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'thanhthu', 22, 2, 110000)
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'quocthai', 20, 1, 45000)
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'thanhthu', 23, 1, 12000)
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'thanhthu', 25, 2, 90000)
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'thanhthu', 30, 2, 120000)
GO
INSERT [dbo].[Category] ([cId], [cName]) VALUES (1, N'Strawberry')
INSERT [dbo].[Category] ([cId], [cName]) VALUES (2, N'Berry')
INSERT [dbo].[Category] ([cId], [cName]) VALUES (3, N'Lemon')
INSERT [dbo].[Category] ([cId], [cName]) VALUES (4, N'Other')
INSERT [dbo].[Category] ([cId], [cName]) VALUES (5, N'Test')
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'thaine', N'Dich vu rat tot', N'', N'tot', CAST(N'2024-03-06T16:16:45.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 22)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'thaidq', N'moi thu deu rat okla', N'', N'thank you', CAST(N'2024-03-06T16:18:45.000' AS DateTime), CAST(N'2024-03-06T18:02:17.000' AS DateTime), 23)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'thaidq', N'lan sau toi se mua tiep', N'', N'thank you so much', CAST(N'2024-03-06T16:19:04.000' AS DateTime), CAST(N'2024-03-06T18:02:39.000' AS DateTime), 24)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'quocthai', N'Trai cay rat ngon', N'', N'Ok cam on', CAST(N'2024-03-06T18:08:08.000' AS DateTime), CAST(N'2024-03-06T18:09:22.000' AS DateTime), 25)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'thaine', N'', N'a.jpg', NULL, CAST(N'2024-03-06T20:16:07.000' AS DateTime), NULL, 26)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'thaine', N'thai vtau', N'', N'ok', CAST(N'2024-03-06T20:16:23.000' AS DateTime), CAST(N'2024-03-06T21:28:14.000' AS DateTime), 27)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'baochau', N'Trai cay rat ngon, anh shipper dep trai', N'', N'thank you', CAST(N'2024-03-07T12:19:45.000' AS DateTime), CAST(N'2024-03-13T16:08:07.000' AS DateTime), 28)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'minhnguyet', N'Trai cay co doi ', N'khom.jpg', N'Sorry about that, please contact us +84 812345678 to support', CAST(N'2024-03-07T13:36:53.000' AS DateTime), CAST(N'2024-03-13T16:09:10.000' AS DateTime), 29)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'trico', N'chu shop than thien, dep trai', N'', N'thank you so much', CAST(N'2024-03-07T13:39:42.000' AS DateTime), CAST(N'2024-03-13T16:09:32.000' AS DateTime), 30)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'yennhi', N'trai cay tuoi ngon, bo, re, dep, mat, giau vitamin, ', N'', N'thank you', CAST(N'2024-03-07T13:40:55.000' AS DateTime), CAST(N'2024-03-14T00:57:08.000' AS DateTime), 31)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'thaine', N'ok', N'w.jpg', N'thank you', CAST(N'2024-03-13T16:06:16.000' AS DateTime), CAST(N'2024-03-14T00:56:22.000' AS DateTime), 1010)
INSERT [dbo].[Feedback] ([username], [message], [img], [response], [date_message], [date_response], [id]) VALUES (N'quocthai', N'Chat luong trai cat tot', N'', N'thank you', CAST(N'2024-03-14T00:55:03.000' AS DateTime), CAST(N'2024-03-14T00:56:17.000' AS DateTime), 1011)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (1, N'thaidq', CAST(N'2024-03-01' AS Date), CAST(243000.00 AS Decimal(10, 2)), 6, N'thai', N'CT', N'0000000000', 1, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (2, N'thaidq', CAST(N'2024-03-01' AS Date), CAST(243000.00 AS Decimal(10, 2)), 6, N'thai', N'CT', N'0000000000', 0, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (15, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(200000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 0, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (19, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(200000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 1, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (20, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(200000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 1, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (21, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(200000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 1, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (23, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(450000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 1, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (24, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(450000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 1, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (25, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(450000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 2, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (26, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(450000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 0, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (27, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(450000.00 AS Decimal(10, 2)), 10, N'Thai', N'CT', N'01498104244', 2, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (29, N'thaidq', CAST(N'2024-01-01' AS Date), CAST(45000.00 AS Decimal(10, 2)), 1, N'Thai', N'CT', N'01498104244', 2, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (33, N'thune', CAST(N'2024-01-01' AS Date), CAST(45000.00 AS Decimal(10, 2)), 1, N'Thai', N'CT', N'01498104244', 2, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (44, N'thaidq', CAST(N'2024-01-27' AS Date), CAST(45000.00 AS Decimal(10, 2)), 1, N'Thai', N'CT', N'0000000', 0, N'2024-1-1', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (45, N'thaidq', CAST(N'2024-01-27' AS Date), CAST(45000.00 AS Decimal(10, 2)), 1, N'thai', N'CT', N'0000000000', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (46, N'thaidq', CAST(N'2024-01-27' AS Date), CAST(45000.00 AS Decimal(10, 2)), 1, N'thai', N'CT', N'0000000000', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (47, N'thaine', CAST(N'2024-02-06' AS Date), CAST(90000.00 AS Decimal(10, 2)), 2, N'Quoc Thai', N'CT', N'0000000000', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (48, N'thaine', CAST(N'2024-02-06' AS Date), CAST(95000.00 AS Decimal(10, 2)), 2, N'Quoc Thai', N'CT', N'0000000000', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (49, N'quocthai', CAST(N'2024-02-06' AS Date), CAST(76000.00 AS Decimal(10, 2)), 2, N'Duong Thai', N'CT', N'0874985045', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (52, N'quocthai', CAST(N'2024-02-16' AS Date), CAST(178000.00 AS Decimal(10, 2)), 4, N'Duong Thai', N'CT', N'0874985045', 2, N'', 1)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (53, N'thaine', CAST(N'2024-03-06' AS Date), CAST(264000.00 AS Decimal(10, 2)), 7, N'Quoc Thai', N'CT', N'0000000000', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (54, N'minhngoc', CAST(N'2024-03-07' AS Date), CAST(150000.00 AS Decimal(10, 2)), 3, N'Minh Ngoc', N'Can Tho', N'0901234567', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (55, N'minhngoc', CAST(N'2024-03-07' AS Date), CAST(12000.00 AS Decimal(10, 2)), 1, N'Minh Ngoc', N'Can Tho', N'0901234567', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (56, N'yennhi', CAST(N'2024-03-07' AS Date), CAST(88000.00 AS Decimal(10, 2)), 2, N'Yen Nhi', N'Can Tho', N'0852000111', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (57, N'baochau', CAST(N'2024-03-07' AS Date), CAST(94000.00 AS Decimal(10, 2)), 2, N'Bao Chau', N'Can Tho', N'0367123321', 2, N'', 1)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (58, N'baochau', CAST(N'2024-03-07' AS Date), CAST(12000.00 AS Decimal(10, 2)), 1, N'Bao Chau', N'Can Tho', N'0367123321', 2, N'', 1)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (59, N'minhngoc', CAST(N'2024-03-07' AS Date), CAST(105000.00 AS Decimal(10, 2)), 2, N'Minh Ngoc', N'Can Tho', N'0901234567', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (60, N'minhnguyet', CAST(N'2024-03-07' AS Date), CAST(102000.00 AS Decimal(10, 2)), 3, N'Minh Nguyet', N'Can Tho', N'0833123456', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (61, N'trico', CAST(N'2024-03-07' AS Date), CAST(145000.00 AS Decimal(10, 2)), 3, N'Tri Co', N'Can Tho', N'0866789012', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (62, N'yennhi', CAST(N'2024-03-07' AS Date), CAST(95000.00 AS Decimal(10, 2)), 2, N'Yen Nhi', N'Can Tho', N'0852000111', 0, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (63, N'yennhi', CAST(N'2024-03-07' AS Date), CAST(120000.00 AS Decimal(10, 2)), 2, N'Yen Nhi', N'Can Tho', N'0852000111', 2, N'', 0)
INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (1053, N'thaine', CAST(N'2024-03-15' AS Date), CAST(45000.00 AS Decimal(10, 2)), 1, N'Quoc Thai', N'CT', N'0821345678', 1, N'', 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (1, 1, 12, 3, 135000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (2, 1, 11, 2, 28000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (3, 1, 10, 1, 80000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (1027, 1053, 20, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (7, 19, 1, 10, 1230)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (8, 20, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (9, 21, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (10, 23, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (13, 26, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (15, 29, 20, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (16, 33, 20, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (18, 46, 20, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (19, 47, 25, 2, 90000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (20, 48, 20, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (21, 48, 21, 1, 50000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (24, 52, 4, 1, 50000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (25, 52, 21, 2, 100000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (26, 52, 15, 1, 28000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (27, 53, 25, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (28, 53, 20, 2, 90000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (29, 53, 22, 1, 55000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (30, 53, 23, 2, 24000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (31, 53, 14, 1, 50000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (32, 54, 22, 1, 55000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (33, 54, 21, 1, 50000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (34, 54, 25, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (35, 55, 23, 1, 12000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (36, 56, 30, 1, 60000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (37, 56, 15, 1, 28000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (41, 59, 22, 1, 55000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (42, 59, 21, 1, 50000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (43, 60, 23, 1, 12000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (44, 60, 20, 2, 90000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (11, 24, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (12, 25, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (14, 27, 12, 10, 450000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (17, 45, 20, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (22, 49, 22, 1, 55000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (23, 49, 18, 1, 21000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (38, 57, 11, 1, 14000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (39, 57, 10, 1, 80000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (40, 58, 23, 1, 12000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (45, 61, 21, 2, 100000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (46, 61, 25, 1, 45000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (49, 63, 30, 2, 120000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (47, 62, 4, 1, 50000)
INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (48, 62, 5, 1, 45000)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (1, N'thanh thu', 123, N'assets/img/products/hero-bg-3.jpg', N'Huhu', 1, 0, -4)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (2, N'Berry', 70, N'assets/img/products/product-img-2_2.jpg', N'Grapes are small, sweet, and juicy fruits with a crisp skin and succulent pulp. They come in various colors, offering a delightful blend of flavors. Grapes are versatile, perfect for snacking, winemaking, and culinary uses. They''re not only delicious but also nutritious, rich in vitamins and antioxidants.', 2, 0, 15)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (3, N'Lemon', 35, N'assets/img/products/product-img-3.jpg', N'Lemons are small, yellow citrus fruits known for their tart, refreshing taste and versatility in cooking and beverages. They''re a rich source of vitamin C and add brightness to many dishes.', 3, 0, 10)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (4, N'Kiwi', 50000, N'assets/img/products/product-img-4.jpg', N'Avocado is a creamy, green fruit known for its buttery texture and mild, nutty flavor. It''s often used in salads, spreads, and as a topping for various dishes. Avocado is also a good source of healthy fats and essential nutrients.', 4, 1, 7)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (5, N'Green Apple', 45000, N'assets/img/products/product-img-5.jpg', N'Green apples are crisp, tart fruits with a bright green skin. They offer a refreshing and slightly sour taste, making them popular for snacking and use in pies and salads. Green apples are known for their firm texture and are a good source of dietary fiber and essential vitamins.', 4, 1, 8)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (6, N'Strawberry', 80, N'assets/img/products/product-img-6.jpg', N'Strawberries are vibrant red, heart-shaped berries known for their sweet and juicy flavor. They are a popular fruit for snacking, desserts, and preserves. Strawberries are celebrated for their delicious taste and high vitamin C content.', 1, 0, 10)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (9, N'Raspberry', 120000, N'assets/img/products/product-img-6_1.jpg', N'Strawberries are vibrant red, heart-shaped berries known for their sweet and juicy flavor. They are a popular fruit for snacking, desserts, and preserves. Strawberries are celebrated for their delicious taste and high vitamin C content.', 2, 1, 30)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (10, N'Avocado 034', 80000, N'assets\img\products\bo034.jpg', N'Avocado 034 is an avocado variety that is considered a type of avocado that produces fruit in the main season and off-season, has high yield, and has the best fruit quality among current avocado varieties.', 1, 1, 28)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (11, N'Cau Duc Pineapple', 14000, N'assets\img\products\khom.jpg', N'Cau Duc pineapple belongs to the Queen variety. The unique feature of this variety is that the fruit has an elegant shape, short stem, small core, bulging eyes, slightly deep eye pits, dark yellow flesh, little fiber, little juice, crunchy and sweet. In particular, Cau Duc pineapple can be left for about 10-15 days without rotting.', 3, 1, 12)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (12, N'Hoa Loc Mango', 45000, N'assets\img\products\xoai.jpg', N'Hoa Loc mangoes are usually eaten when ripe. When eating a piece of mango in the mouth, the mango has a rich, pleasant aroma, the flesh is golden yellow, not at all greasy, the sweetness is deep, the aftertaste is good, and after eating, the mouth still smells. fragrant scent for an hour.', 1, 1, 100)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (13, N'Longan', 45000, N'assets\img\products\nhan.jpg', N'Longan is a longan variety that produces the largest fruit. The rice of the longan fruit is easy to recognize because it is ivory yellow, crunchy and very delicious.', 1, 1, 22)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (14, N'Luc Ngan Lychee', 50000, N'assets\img\products\vai.jpg', N'When ripe, Luc Ngan lychee is bright red, has small seeds, thick pulp, sweet and rich in nutrients. Lychees here are larger and have a unique flavor that is different from lychees in other lands.', 1, 1, 79)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (15, N'Nam Roi Pomelo', 28000, N'assets\img\products\buoi5roi.jpg', N'Nam Roi Pomelo is pear-shaped, can peel off its skin, has many succulent segments, is sweet, and has no seeds. Each year, this pomelo variety is harvested twice in August and December.', 2, 1, 18)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (16, N'Ri 6 Durian', 90000, N'assets\img\products\sr.jpg', N'Ri 6 durian is popular for its unique aroma, thick rice, flat seeds, sweet taste, and moderate fat.', 1, 1, 60)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (17, N'Star apple', 50000, N'assets\img\products\vs.jpg', N'Star apple is commonly grown in the orchards of central and southern parts of Viet Nam,it has sweet, tropical flavor and creamy, jellylike fruit flesh.', 2, 1, 43)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (18, N'Thai jackfruit', 21000, N'assets\img\products\mit.jpg', N'Thai jackfruit has large, thick segments that are sweet and have a subtle aroma when eaten. If you want to enjoy a lot of crunch, you can preserve and serve cold.', 1, 1, 39)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (19, N'Avocado', 75000, N'assets\img\products\bo.jpg', N'Avocado is a famous specialty fruit of the highlands. The avocado here stands out for its deliciousness and nutritional value. Avocados have outstanding advantages compared to regular avocados: the fruit is large and not rough, the fruit is not too round but not too long, and the skin of the avocado is plump when almost ripe but still a bit rough and very firm to hold.', 1, 2, 62)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (20, N'Sapoche', 45000, N'assets\img\products\spc.jpg', N'With a thin, light brown skin, fragrant, very sweet and succulent when ripe, saboche is an ideal fruit for dessert or refreshment. Saboche has a sweet taste because it contains a lot of fructose and sucrose, so this is a natural food that helps increase the body energy.', 2, 1, 25)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (21, N'Mangosteen', 50000, N'assets\img\products\mc.jpg', N'When ripe, mangosteen fruit has a thick, dark purple-red outer skin. The flesh is ivory white and divided into many segments, has a sweet and sour taste and an attractive aroma. Mangosteen contains a lot of protein, calcium, iron, phosphorus, etc., so it is very good for health.', 1, 1, 55)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (22, N'Thai Rambutan', 55000, N'assets\img\products\cc.jpg', N'Rambutan is as small as a golf ball with a hairy red and blue shell that looks a bit like a sea urchin. When eating rambutan, the clear white flesh has a mild sweet taste and has seeds in the center.', 1, 1, 90)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (23, N'Orange', 12000, N'assets\img\products\cx.jpg', N'Orange is a fruit tree in the same family as grapefruit. It has a fruit smaller than a grapefruit, with thin skin. Depending on the type, it is orange or green when ripe, with a sweet or slightly sour taste.', 1, 1, 89)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (24, N'Persimmon', 80000, N'assets\img\products\hong.jpg', N'Persimmons are orange-yellow to red depending on the variety. The fruit is spherical, heart-shaped, or flattened tomato-shaped. The calyx often sticks to the fruit when ripe.', 1, 2, 63)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (25, N'Tangerine', 45000, N'assets\img\products\qd.jpg', N'Lai Vung tangerines are succulent and sweet, a famous specialty of Lai Vung - Dong Thap. Characterized by a peel with a pleasant aroma like essential oils, large round fruit, thin and shiny peel that is easy to peel, super succulent tangerine segments, sweet taste mixed with a slight sourness.', 1, 1, 82)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (26, N'Dragon Fruit', 20000, N'assets\img\products\tl.jpg', N'Dragon fruit is an orchid tree, the fruit is oval in shape, has many green leaves, green skin, when ripe it turns purple and then dark red, many black seeds, mild sweet taste.', 1, 2, 77)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (27, N'Rose Apple', 13000, N'assets\img\products\man.jpg', N' The skin color of the fruit can be paled red, greenish-white, or cream-colored. The skin is thin and waxy. Inside the white flesh is spongy and dry, but can be juicy and crispy depending on the variety. it, have a mild, watery sweetness, although them and they can be bland or sour at times.', 2, 2, 64)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (28, N'Dalat strawberry', 200000, N'assets/img/products/product-img-1_1.jpg', N'Strawberries are red, succulent, have a sweet candy aroma and have a rich, sweet taste, different from all other types of strawberries being grown in Da Lat and surrounding areas today:', 1, 1, 100)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (29, N'Areca Banana.', 20000, N'assets\img\products\chuoi.jpg', N'Originally called areca banana because it has a small, round shape, is thick and fat like an areca fruit in Vietnam. Currently, in our country market, areca bananas are grown the most in Tien Giang province. Areca bananas have more fruit density, smooth skin, rounder fruit and usually no beard at the top of the fruit. When the banana peel is ripe, it will turn yellow and have a sweet taste and characteristic aroma.', 2, 2, 77)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (30, N'Strawberry', 60000, N'assets/img/products/dau.jpg', N'A strawberry is both a low-growing, flowering plant and also the name of the fruit that it produces. Strawberries are soft, sweet, bright red berries. They''re also delicious. Strawberries have tiny edible seeds, which grow all over their surface.', 1, 1, 101)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (31, N'HI', 100000, N'https://mdbootstrap.com/img/Photos/Others/placeholder.jpg', N'aaaaaaa', 2, 0, 10)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (32, N'HI', 13, N'https://mdbootstrap.com/img/Photos/Others/placeholder.jpg', N'133', 2, 0, 1333)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (1032, N'sdsd', 123, N'https://mdbootstrap.com/img/Photos/Others/placeholder.jpg', N'123', 1, 0, 123)
SET IDENTITY_INSERT [dbo].[Product] OFF
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Product] ([pId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cId])
REFERENCES [dbo].[Category] ([cId])
GO
ALTER TABLE [dbo].[TransactionVnpay]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[TransactionVnpay]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 3/16/2024 6:49:52 PM ******/
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
/****** Object:  Trigger [dbo].[MyTriggerName]    Script Date: 3/16/2024 6:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[MyTriggerName]
ON [dbo].[Cart]
AFTER update
AS
BEGIN
    UPDATE t1
    SET t1.total_quantity = t1.quantity * t2.price
    FROM Cart t1
    INNER JOIN Product t2 ON t1.pId = t2.pId
END;
GO
ALTER TABLE [dbo].[Cart] ENABLE TRIGGER [MyTriggerName]
GO
/****** Object:  Trigger [dbo].[MyTriggerOrderItem]    Script Date: 3/16/2024 6:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[MyTriggerOrderItem]
ON [dbo].[OrderItem]
AFTER insert
AS
BEGIN
    UPDATE t1
    SET t1.amount = t1.quantity * t2.price
    FROM OrderItem t1
    INNER JOIN Product t2 ON t1.pId = t2.pId
END;
GO
ALTER TABLE [dbo].[OrderItem] ENABLE TRIGGER [MyTriggerOrderItem]
GO
/****** Object:  Trigger [dbo].[OrderID]    Script Date: 3/16/2024 6:49:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[OrderID]
ON [dbo].[OrderItem] 
AFTER INSERT
AS
BEGIN
    UPDATE OrderItem 
	SET OrderItem.order_id = (SELECT [Order].order_id FROM [Order] WHERE [Order].order_id = (SELECT SCOPE_IDENTITY()))
	WHERE OrderItem.order_id = (SELECT SCOPE_IDENTITY());
END;
GO
ALTER TABLE [dbo].[OrderItem] ENABLE TRIGGER [OrderID]
GO
/****** Object:  Trigger [dbo].[UpdateOrderID]    Script Date: 3/16/2024 6:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[UpdateOrderID]
ON [dbo].[OrderItem]
AFTER INSERT
AS
BEGIN
    DECLARE @MaxOrderID INT;
    SELECT @MaxOrderID = MAX(order_id) FROM [Order];
    
    UPDATE OrderItem
    SET order_id = @MaxOrderID
    FROM inserted
    WHERE OrderItem.order_item_id = inserted.order_item_id;
END;
GO
ALTER TABLE [dbo].[OrderItem] ENABLE TRIGGER [UpdateOrderID]
GO
/****** Object:  Trigger [dbo].[UpdateProductQuantity]    Script Date: 3/16/2024 6:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   TRIGGER [dbo].[UpdateProductQuantity]
ON [dbo].[OrderItem]
AFTER INSERT
AS
BEGIN
  UPDATE p
  SET quantity = p.quantity - i.quantity
  FROM Product p
  INNER JOIN inserted i ON p.pId = i.pId;
END
GO
ALTER TABLE [dbo].[OrderItem] ENABLE TRIGGER [UpdateProductQuantity]
GO
/****** Object:  Trigger [dbo].[update_product_status2]    Script Date: 3/16/2024 6:49:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[update_product_status2]
ON [dbo].[Product]
AFTER UPDATE
AS
BEGIN
  IF UPDATE(quantity)
  BEGIN
    UPDATE Product
    SET status = 0
    FROM Product AS p
    INNER JOIN inserted AS i ON p.pId = i.pId
    WHERE i.quantity <= 0;
  END
END;

GO
ALTER TABLE [dbo].[Product] ENABLE TRIGGER [update_product_status2]
GO
USE [master]
GO
ALTER DATABASE [ShopTraiCay] SET  READ_WRITE 
GO
