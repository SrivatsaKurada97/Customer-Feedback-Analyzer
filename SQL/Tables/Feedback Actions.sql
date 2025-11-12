USE [CustomerFeedbackDB]
GO

/****** Object:  Table [dbo].[feedbackactions]    Script Date: 11/11/2025 4:51:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[feedbackactions](
	[actionid] [int] IDENTITY(1,1) NOT NULL,
	[feebdackID] [int] NULL,
	[actiontype] [nvarchar](50) NOT NULL,
	[actiondate] [datetime] NULL,
	[actiondetails] [nvarchar](500) NULL,
	[performedby] [nvarchar](100) NULL,
	[actionstatus] [nvarchar](20) NULL,
	[receiptemail] [nvarchar](120) NULL,
PRIMARY KEY CLUSTERED 
(
	[actionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[feedbackactions] ADD  DEFAULT (getdate()) FOR [actiondate]
GO

ALTER TABLE [dbo].[feedbackactions] ADD  DEFAULT ('System') FOR [performedby]
GO

ALTER TABLE [dbo].[feedbackactions] ADD  DEFAULT ('Completed') FOR [actionstatus]
GO

ALTER TABLE [dbo].[feedbackactions]  WITH CHECK ADD FOREIGN KEY([feebdackID])
REFERENCES [dbo].[customerfeedback] ([feedbackID])
GO


