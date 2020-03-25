SELECT
COUNT(*),
COUNT(id),
COUNT(ProductId),
COUNT(UserId),
COUNT(ProfileName),
COUNT(HelpfulnessNumerator),
COUNT(HelpfulnessDenominator),
COUNT(Score),
COUNT(Time),
COUNT(Summary),
COUNT(Text)

FROM foodReviews

SELECT TOP 10 *
FROM foodReviews

--change unix time to datetime format
--we can see that 2012-10-16 is the date when the most people wrote the review
 SELECT 
 Time,
 (DATEADD(s,Time,'19700101')) AS ReviewTime,
 COUNT(Time) As Num
 FROM foodReviews
 GROUP BY Time
 ORDER BY COUNT(Time) DESC


 --find out average sales per product
 SELECT 
 COUNT(DISTINCT ProductId) AS ProductCategory,
 COUNT(ProductId) AS TotalProducts,
 COUNT( ProductId)/COUNT(DISTINCT ProductId) AS AverageSales
 FROM foodReviews

 --change Score data type from nvarchar to float
 ALTER TABLE foodReviews ALTER COLUMN Score float 

 --find out top 100 most popular products and their average score
 SELECT TOP 100
 ProductId,
 COUNT(ProductId) AS SalesQuantity,
 ROUND(AVG(Score),2) AS AverageScore
 FROM foodReviews
 GROUP BY ProductId
 ORDER BY COUNT(ProductId) DESC


--find out the top 100 products' sales proportion in total sales. in this case is 0%. should use top 10000.
SELECT
SUM(number) AS TOP100SalesNum,
TotalSalesNum = (SELECT COUNT(PRODUCTID) FROM foodReviews),
ROUND(SUM(number)/(SELECT COUNT(PRODUCTID) FROM foodReviews),2) AS TOP100SalesPercentage
FROM TOP100Analysis






