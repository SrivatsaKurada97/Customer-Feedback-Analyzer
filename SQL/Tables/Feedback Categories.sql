USE [CustomerFeedbackDB]
GO

/****** Object:  Table [dbo].[feedbackcategories]    Script Date: 11/11/2025 4:51:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[feedbackcategories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](50) NOT NULL,
	[categorydescription] [nvarchar](200) NULL,
	[isactive] [bit] NULL,
	[createddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[feedbackcategories] ADD  DEFAULT ((1)) FOR [isactive]
GO

ALTER TABLE [dbo].[feedbackcategories] ADD  DEFAULT (getdate()) FOR [createddate]
GO


