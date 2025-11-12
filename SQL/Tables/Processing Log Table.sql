USE [CustomerFeedbackDB]
GO

/****** Object:  Table [dbo].[processinglog]    Script Date: 11/11/2025 4:52:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[processinglog](
	[logID] [int] IDENTITY(1,1) NOT NULL,
	[feedbackID] [int] NULL,
	[logdate] [datetime] NULL,
	[loglevel] [nvarchar](20) NOT NULL,
	[logmessage] [nvarchar](max) NOT NULL,
	[Source] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[logID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[processinglog] ADD  DEFAULT (getdate()) FOR [logdate]
GO

ALTER TABLE [dbo].[processinglog] ADD  DEFAULT ('N8N_Workflow') FOR [Source]
GO


