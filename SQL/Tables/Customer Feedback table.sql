USE [CustomerFeedbackDB]
GO

/****** Object:  Table [dbo].[customerfeedback]    Script Date: 11/11/2025 4:51:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customerfeedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[submissiondate] [datetime] NULL,
	[customername] [nvarchar](100) NOT NULL,
	[customeremail] [nvarchar](100) NOT NULL,
	[productservice] [nvarchar](100) NOT NULL,
	[feedbacktext] [nvarchar](max) NOT NULL,
	[rating] [int] NOT NULL,
	[sentimentscore] [decimal](5, 2) NULL,
	[sentimentlabel] [nvarchar](20) NULL,
	[category] [nvarchar](50) NULL,
	[priority] [nvarchar](20) NULL,
	[aiextractedissues] [nvarchar](max) NULL,
	[aisummary] [nvarchar](500) NULL,
	[processeddate] [datetime] NULL,
	[processingstatus] [nvarchar](20) NULL,
	[errormessage] [nvarchar](max) NULL,
	[createdby] [nvarchar](100) NULL,
	[modifieddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[customerfeedback] ADD  DEFAULT (getdate()) FOR [submissiondate]
GO

ALTER TABLE [dbo].[customerfeedback] ADD  DEFAULT ('Pending') FOR [processingstatus]
GO

ALTER TABLE [dbo].[customerfeedback] ADD  DEFAULT ('N8N_Automation') FOR [createdby]
GO

ALTER TABLE [dbo].[customerfeedback] ADD  DEFAULT (getdate()) FOR [modifieddate]
GO

ALTER TABLE [dbo].[customerfeedback]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO


