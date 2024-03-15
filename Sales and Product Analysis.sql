-- Sales and Product Performance Analysis 
-- 1. Total Sales and Average Discount by Segment:
  SELECT 
  c.Segment, 
  SUM(p.Sales) AS TotalSales, 
  AVG(p.Discount) AS AverageDiscount
FROM 
  Product p
JOIN 
  Orders o ON p.RowID= o.RowID
JOIN 
  Customer c ON o.RowID = c.RowID
GROUP BY 
  c.Segment;
  
  --  2. Monthly Sales Trend:
  SELECT 
  EXTRACT(YEAR FROM o.OrderDate) AS Year, 
  EXTRACT(MONTH FROM o.OrderDate) AS Month, 
  SUM(p.Sales) AS TotalSales
FROM 
  Orders o
JOIN 
  Product p ON o.ProductID = p.ProductID
GROUP BY 
  Year, Month
ORDER BY 
  Year, Month;
  -- 3. Sales Contribution by SubCategory
  
  SELECT 
  p.SubCategory, 
  SUM(p.Sales) AS TotalSales
FROM 
  Product p
GROUP BY 
  p.SubCategory
ORDER BY 
  TotalSales DESC;
  
  -- Total Sales by category
  SELECT 
  p.Category, 
  SUM(p.Sales) AS TotalSales
FROM 
  Product p
GROUP BY 
  p.Category;
  
 -- 5. Profit Margin Analysis by Category:
 SELECT 
  Category, 
  SUM(Sales) AS TotalSales, 
  SUM(Profit) AS TotalProfit, 
  (SUM(Profit) / SUM(Sales)) * 100 AS ProfitMarginPercentage
FROM 
  Product
GROUP BY 
  Category
ORDER BY 
  ProfitMarginPercentage DESC;
  
 -- 6. Discount Impact on Sales Volume:
 
 SELECT 
  Discount, 
  SUM(Quantity) AS TotalQuantitySold
FROM 
  Product
GROUP BY 
  Discount
ORDER BY 
  Discount;
  
  -- 7. Products Never Ordered:
  SELECT 
  p.ProductID, 
  p.ProductName
FROM 
  Product p
LEFT JOIN 
  Orders o ON p.ProductID = o.ProductID
WHERE 
  o.OrderID IS NULL;
  -- 8. Top 5 Profitable Products
  SELECT 
  p.ProductName, 
  p.Profit
FROM 
  Product p
ORDER BY 
  p.Profit DESC
LIMIT 5;

-- 9 Sales and Profit Comparison by Year
SELECT
  YEAR(o.OrderDate) AS Year,
  SUM(p.Sales) AS TotalSales,
  SUM(p.Profit) AS TotalProfit
FROM
  Orders o
JOIN
  Product p ON o.ProductID = p.ProductID
GROUP BY
  Year
ORDER BY
  Year;

