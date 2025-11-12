-- ============================================
-- Generate Sample Customer Feedback Data
-- For Power BI Dashboard Demo
-- ============================================

USE CustomerFeedbackDB;
GO

-- ============================================
-- PART 1: Sample Data Arrays
-- ============================================

-- Create temp table for sample data
CREATE TABLE #SampleData (
    CustomerName NVARCHAR(100),
    CustomerEmail NVARCHAR(100),
    ProductService NVARCHAR(100),
    FeedbackText NVARCHAR(MAX),
    Rating INT,
    SentimentLabel NVARCHAR(20),
    SentimentScore DECIMAL(5,2),
    Category NVARCHAR(50),
    Priority NVARCHAR(20)
);

-- ============================================
-- PART 2: Insert Positive Feedback (50%)
-- ============================================

INSERT INTO #SampleData VALUES
('John Smith', 'john.smith@email.com', 'Product A', 'Excellent product! Very satisfied with the quality and performance. Would definitely recommend to others.', 5, 'Positive', 0.92, 'Product Quality', 'Low'),
('Sarah Johnson', 'sarah.j@email.com', 'Product A', 'Great experience! The customer service team was very helpful and responsive. Product works perfectly.', 5, 'Positive', 0.88, 'Customer Service', 'Low'),
('Michael Brown', 'michael.b@email.com', 'Service X', 'Outstanding service! Quick delivery and everything was as described. Very happy with my purchase.', 5, 'Positive', 0.90, 'Delivery/Shipping', 'Low'),
('Emily Davis', 'emily.d@email.com', 'Product B', 'Love it! Easy to use and exactly what I needed. Great value for money.', 5, 'Positive', 0.87, 'User Experience', 'Low'),
('David Wilson', 'david.w@email.com', 'Service Y', 'Fantastic! Exceeded my expectations. The team went above and beyond.', 5, 'Positive', 0.95, 'Customer Service', 'Low'),
('Jennifer Martinez', 'jennifer.m@email.com', 'Product A', 'Very impressed with the quality. Fast shipping and great packaging. Will buy again.', 5, 'Positive', 0.89, 'Product Quality', 'Low'),
('Robert Garcia', 'robert.g@email.com', 'Service X', 'Excellent service from start to finish. Professional and efficient. Highly recommend.', 5, 'Positive', 0.91, 'Customer Service', 'Low'),
('Mary Rodriguez', 'mary.r@email.com', 'Product B', 'Perfect product for my needs. Works great and arrived quickly. Very satisfied.', 5, 'Positive', 0.86, 'Product Quality', 'Low'),
('James Anderson', 'james.a@email.com', 'Service Y', 'Great experience overall. The interface is intuitive and everything is well organized.', 4, 'Positive', 0.78, 'User Experience', 'Low'),
('Linda Taylor', 'linda.t@email.com', 'Product A', 'Really happy with this purchase. Good quality and reasonable price. Recommend!', 4, 'Positive', 0.82, 'Pricing', 'Low'),
('William Thomas', 'william.t@email.com', 'Service X', 'Solid product. Does exactly what it promises. Customer support is responsive.', 4, 'Positive', 0.75, 'Customer Service', 'Low'),
('Patricia Hernandez', 'patricia.h@email.com', 'Product B', 'Very good product. A few minor improvements could be made but overall satisfied.', 4, 'Positive', 0.72, 'Features', 'Low'),
('Christopher Moore', 'christopher.m@email.com', 'Service Y', 'Good service. Delivery was prompt and the product quality is excellent.', 4, 'Positive', 0.80, 'Delivery/Shipping', 'Low'),
('Barbara Jackson', 'barbara.j@email.com', 'Product A', 'Happy with my purchase. The product meets all my requirements and works well.', 4, 'Positive', 0.77, 'Product Quality', 'Low'),
('Daniel White', 'daniel.w@email.com', 'Service X', 'Good experience. A couple of small issues but customer service resolved them quickly.', 4, 'Positive', 0.74, 'Customer Service', 'Low'),
('Susan Harris', 'susan.h@email.com', 'Product B', 'Nice product. Easy to set up and use. Documentation could be better.', 4, 'Positive', 0.71, 'Documentation', 'Low'),
('Matthew Martin', 'matthew.m@email.com', 'Service Y', 'Pleased with the service. Professional team and good communication throughout.', 4, 'Positive', 0.79, 'Customer Service', 'Low'),
('Nancy Thompson', 'nancy.t@email.com', 'Product A', 'Good value for money. Product quality is solid and it arrived on time.', 4, 'Positive', 0.76, 'Pricing', 'Low'),
('Joseph Lee', 'joseph.l@email.com', 'Service X', 'Satisfied customer here. The product does what I need it to do.', 4, 'Positive', 0.73, 'Product Quality', 'Low'),
('Karen Walker', 'karen.w@email.com', 'Product B', 'Really like the new features. The recent update made it even better.', 4, 'Positive', 0.81, 'Features', 'Low'),
('Steven Hall', 'steven.h@email.com', 'Service Y', 'Good product overall. A few features I wish were included but still happy.', 4, 'Positive', 0.70, 'Features', 'Low'),
('Betty Allen', 'betty.a@email.com', 'Product A', 'Great quality product. Shipping was fast and packaging was secure.', 5, 'Positive', 0.85, 'Delivery/Shipping', 'Low'),
('Edward Young', 'edward.y@email.com', 'Service X', 'Excellent! This is exactly what I was looking for. Very pleased with everything.', 5, 'Positive', 0.93, 'Product Quality', 'Low'),
('Dorothy King', 'dorothy.k@email.com', 'Product B', 'Wonderful product! Easy to use and very effective. Worth every penny.', 5, 'Positive', 0.88, 'User Experience', 'Low'),
('Paul Wright', 'paul.w@email.com', 'Service Y', 'Amazing service! The team was so helpful and went out of their way to assist me.', 5, 'Positive', 0.94, 'Customer Service', 'Low');

-- ============================================
-- PART 3: Insert Neutral Feedback (30%)
-- ============================================

INSERT INTO #SampleData VALUES
('Kevin Lopez', 'kevin.l@email.com', 'Product A', 'It is okay. Does what it is supposed to do but nothing special. Average product.', 3, 'Neutral', 0.15, 'Product Quality', 'Medium'),
('Helen Hill', 'helen.h@email.com', 'Service X', 'Decent service. Some good points and some areas that could be improved.', 3, 'Neutral', 0.10, 'Customer Service', 'Medium'),
('Larry Scott', 'larry.s@email.com', 'Product B', 'Average product. Works fine but the price seems a bit high for what you get.', 3, 'Neutral', 0.05, 'Pricing', 'Medium'),
('Sandra Green', 'sandra.g@email.com', 'Service Y', 'Mixed feelings about this. Some features are great, others need work.', 3, 'Neutral', 0.12, 'Features', 'Medium'),
('Kenneth Adams', 'kenneth.a@email.com', 'Product A', 'It is acceptable. Not amazing but not terrible either. Gets the job done.', 3, 'Neutral', 0.08, 'Product Quality', 'Medium'),
('Donna Baker', 'donna.b@email.com', 'Service X', 'Okay experience overall. Delivery was slow but product quality is decent.', 3, 'Neutral', 0.02, 'Delivery/Shipping', 'Medium'),
('George Nelson', 'george.n@email.com', 'Product B', 'Fair product. Some features work well, others are buggy. Needs improvement.', 3, 'Neutral', -0.05, 'Technical Support', 'Medium'),
('Carol Carter', 'carol.c@email.com', 'Service Y', 'Average service. Nothing to complain about but nothing impressive either.', 3, 'Neutral', 0.18, 'Customer Service', 'Medium'),
('Ronald Mitchell', 'ronald.m@email.com', 'Product A', 'Product is fine. Interface could be more user-friendly. Functional but basic.', 3, 'Neutral', 0.14, 'User Experience', 'Medium'),
('Michelle Roberts', 'michelle.r@email.com', 'Service X', 'Decent but overpriced. Similar products are available for less money.', 3, 'Neutral', -0.02, 'Pricing', 'Medium'),
('Timothy Turner', 'timothy.t@email.com', 'Product B', 'It works. Documentation could be better. Had to figure out some things myself.', 3, 'Neutral', 0.06, 'Documentation', 'Medium'),
('Lisa Phillips', 'lisa.p@email.com', 'Service Y', 'Mediocre experience. Customer service was helpful but the product itself is just okay.', 3, 'Neutral', 0.11, 'Customer Service', 'Medium'),
('Brian Campbell', 'brian.c@email.com', 'Product A', 'Satisfactory. Does the basic functions but lacks advanced features I expected.', 3, 'Neutral', 0.09, 'Features', 'Medium'),
('Sharon Parker', 'sharon.p@email.com', 'Service X', 'Neutral opinion. Some aspects are good, others need attention. Average overall.', 3, 'Neutral', 0.07, 'Product Quality', 'Medium'),
('Jason Evans', 'jason.e@email.com', 'Product B', 'Not bad but not great either. Could use some improvements in several areas.', 3, 'Neutral', 0.04, 'Features', 'Medium');

-- ============================================
-- PART 4: Insert Negative Feedback (20%)
-- ============================================

INSERT INTO #SampleData VALUES
('Angela Edwards', 'angela.e@email.com', 'Product A', 'Very disappointed. Product stopped working after just one week. Poor quality.', 1, 'Negative', -0.85, 'Product Quality', 'High'),
('Mark Collins', 'mark.c@email.com', 'Service X', 'Terrible experience. Customer service never responded to my emails. Extremely frustrated.', 1, 'Negative', -0.92, 'Customer Service', 'High'),
('Deborah Stewart', 'deborah.s@email.com', 'Product B', 'Not happy at all. The product does not work as advertised. Want a refund.', 1, 'Negative', -0.88, 'Product Quality', 'High'),
('Donald Morris', 'donald.m@email.com', 'Service Y', 'Awful. Multiple technical issues and no support. This is unacceptable.', 1, 'Negative', -0.90, 'Technical Support', 'High'),
('Jessica Rogers', 'jessica.r@email.com', 'Product A', 'Complete waste of money. Product broke on the second day. Very poor quality control.', 1, 'Negative', -0.87, 'Product Quality', 'High'),
('Frank Reed', 'frank.r@email.com', 'Service X', 'Horrible service. Delivery was late by 2 weeks. No communication whatsoever.', 2, 'Negative', -0.75, 'Delivery/Shipping', 'High'),
('Ruth Cook', 'ruth.c@email.com', 'Product B', 'Disappointed with this purchase. Does not meet expectations. Considering returning it.', 2, 'Negative', -0.68, 'Product Quality', 'Medium'),
('Raymond Morgan', 'raymond.m@email.com', 'Service Y', 'Not satisfied. Had issues from day one. Support team was not helpful.', 2, 'Negative', -0.72, 'Technical Support', 'High'),
('Kathleen Bell', 'kathleen.b@email.com', 'Product A', 'Poor quality product. Multiple defects right out of the box. Very frustrating.', 2, 'Negative', -0.78, 'Product Quality', 'High'),
('Jeffrey Murphy', 'jeffrey.m@email.com', 'Service X', 'Unhappy customer. The app crashes frequently. Needs serious bug fixes.', 2, 'Negative', -0.70, 'Technical Support', 'High'),
('Amy Bailey', 'amy.b@email.com', 'Product B', 'Below expectations. Several features do not work properly. Disappointed.', 2, 'Negative', -0.65, 'Features', 'Medium'),
('Gary Rivera', 'gary.r@email.com', 'Service Y', 'Not good. Customer service was unhelpful and rude. Poor experience overall.', 2, 'Negative', -0.80, 'Customer Service', 'High'),
('Shirley Cooper', 'shirley.c@email.com', 'Product A', 'Unsatisfied with the quality. Product feels cheap and flimsy. Not worth the price.', 2, 'Negative', -0.67, 'Pricing', 'Medium'),
('Eric Richardson', 'eric.r@email.com', 'Service X', 'Poor experience. Technical issues persist despite multiple support tickets.', 2, 'Negative', -0.73, 'Technical Support', 'High'),
('Anna Cox', 'anna.c@email.com', 'Product B', 'Not recommended. Product malfunctioned within days. Quality control issues evident.', 1, 'Negative', -0.89, 'Product Quality', 'High');

-- ============================================
-- PART 5: Insert Data with Date Distribution
-- ============================================

-- Now insert all the sample data with varied dates over the past 90 days
DECLARE @Counter INT = 1;
DECLARE @TotalRows INT;
DECLARE @RandomDays INT;
DECLARE @SubmissionDate DATETIME;

SELECT @TotalRows = COUNT(*) FROM #SampleData;

DECLARE @FeedbackID INT;

WHILE @Counter <= @TotalRows
BEGIN
    -- Generate random date within last 90 days
    SET @RandomDays = ABS(CHECKSUM(NEWID())) % 90;
    SET @SubmissionDate = DATEADD(DAY, -@RandomDays, GETDATE());
    
    -- Get one row from temp table
    DECLARE @Name NVARCHAR(100);
    DECLARE @Email NVARCHAR(100);
    DECLARE @Product NVARCHAR(100);
    DECLARE @Feedback NVARCHAR(MAX);
    DECLARE @Rating INT;
    DECLARE @Sentiment NVARCHAR(20);
    DECLARE @Score DECIMAL(5,2);
    DECLARE @Cat NVARCHAR(50);
    DECLARE @Pri NVARCHAR(20);
    
    SELECT TOP 1
        @Name = CustomerName,
        @Email = CustomerEmail,
        @Product = ProductService,
        @Feedback = FeedbackText,
        @Rating = Rating,
        @Sentiment = SentimentLabel,
        @Score = SentimentScore,
        @Cat = Category,
        @Pri = Priority
    FROM #SampleData
    ORDER BY NEWID();  -- Random selection
    
    -- Insert using stored procedure
    EXEC usp_InsertCustomerFeedback
        @CustomerName = @Name,
        @CustomerEmail = @Email,
        @ProductService = @Product,
        @FeedbackText = @Feedback,
        @Rating = @Rating,
        @SubmissionDate = @SubmissionDate,
        @SentimentScore = @Score,
        @SentimentLabel = @Sentiment,
        @Category = @Cat,
        @Priority = @Pri,
        @AIExtractedIssues = 'Sample generated data',
        @AISummary = 'This is sample feedback for dashboard demonstration purposes.',
        @NewFeedbackID = @FeedbackID OUTPUT;
    
    SET @Counter = @Counter + 1;
END

-- Clean up
DROP TABLE #SampleData;

-- ============================================
-- PART 6: Verification
-- ============================================

PRINT '============================================';
PRINT 'Sample Data Generation Complete!';
PRINT '============================================';
PRINT '';

-- Show summary statistics
SELECT 
    'Total Records' AS Metric,
    COUNT(*) AS Value
FROM CustomerFeedback
UNION ALL
SELECT 
    'Positive Feedback',
    COUNT(*)
FROM CustomerFeedback
WHERE SentimentLabel = 'Positive'
UNION ALL
SELECT 
    'Neutral Feedback',
    COUNT(*)
FROM CustomerFeedback
WHERE SentimentLabel = 'Neutral'
UNION ALL
SELECT 
    'Negative Feedback',
    COUNT(*)
FROM CustomerFeedback
WHERE SentimentLabel = 'Negative'
UNION ALL
SELECT 
    'High Priority',
    COUNT(*)
FROM CustomerFeedback
WHERE Priority = 'High';

PRINT '';
PRINT 'Date Range:';
SELECT 
    MIN(SubmissionDate) AS OldestFeedback,
    MAX(SubmissionDate) AS NewestFeedback
FROM CustomerFeedback;

PRINT '';
PRINT 'Records by Product:';
SELECT 
    ProductService,
    COUNT(*) AS Count
FROM CustomerFeedback
GROUP BY ProductService
ORDER BY Count DESC;

PRINT '';
PRINT 'Records by Category:';
SELECT 
    Category,
    COUNT(*) AS Count
FROM CustomerFeedback
GROUP BY Category
ORDER BY Count DESC;

PRINT '';
PRINT '============================================';
PRINT 'Your Power BI dashboard is now ready!';
PRINT '============================================';

GO