
-- 1. Top 5 Selling Items by Total Sales
SELECT TOP 5 I.ItemType, SUM(S.TotalSales) AS TotalRevenue
FROM Sales S
JOIN Items I ON S.ItemID = I.ItemID
GROUP BY I.ItemType
ORDER BY TotalRevenue DESC;

-- 2. Outlet with Highest Average Rating
SELECT O.OutletID, O.OutletType, AVG(S.Rating) AS AvgRating
FROM Sales S
JOIN Outlets O ON S.OutletID = O.OutletID
GROUP BY O.OutletID, O.OutletType
ORDER BY AvgRating DESC;

-- 3. Count of Items by Fat Content
SELECT ItemFatContent, COUNT(*) AS CountByFatType
FROM Items
GROUP BY ItemFatContent;

-- 4. Average TotalSales by Outlet Type
SELECT O.OutletType, AVG(S.TotalSales) AS AvgSales
FROM Sales S
JOIN Outlets O ON S.OutletID = O.OutletID
GROUP BY O.OutletType;

-- 5. Items with Above Average Sales
SELECT I.ItemType, SUM(S.TotalSales) AS TotalSales
FROM Sales S
JOIN Items I ON S.ItemID = I.ItemID
GROUP BY I.ItemType
HAVING SUM(S.TotalSales) > (SELECT AVG(TotalSales) FROM Sales);

-- 6. Outlet Types with Ratings < 3
SELECT O.OutletType, COUNT(*) AS LowRatingCount
FROM Sales S
JOIN Outlets O ON S.OutletID = O.OutletID
WHERE S.Rating < 3
GROUP BY O.OutletType;

-- 7. Distribution of Sales by Fat Content
SELECT I.ItemFatContent, SUM(S.TotalSales) AS TotalSales
FROM Sales S
JOIN Items I ON S.ItemID = I.ItemID
GROUP BY I.ItemFatContent;

-- 8. Detect Duplicate ItemIDs
SELECT ItemID, COUNT(*) AS DuplicateCount
FROM Items
GROUP BY ItemID
HAVING COUNT(*) > 1;

-- 9. Items with Max and Min Sales
SELECT TOP 1 I.ItemType, SUM(S.TotalSales) AS TotalSales
FROM Sales S
JOIN Items I ON S.ItemID = I.ItemID
GROUP BY I.ItemType
ORDER BY TotalSales DESC;

-- 10. Rank Outlets by Total Sales
SELECT O.OutletID, SUM(S.TotalSales) AS TotalSales,
       RANK() OVER (ORDER BY SUM(S.TotalSales) DESC) AS OutletRank
FROM Sales S
JOIN Outlets O ON S.OutletID = O.OutletID
GROUP BY O.OutletID;
