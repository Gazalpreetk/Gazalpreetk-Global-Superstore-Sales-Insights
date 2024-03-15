-- Order Patterns and Efficiency Analysis

-- 1. Average Shipping Cost by Ship Mode:
SELECT ShipMode, 
AVG(CAST(ShippingCost AS DECIMAL(10,2))) AS AverageShippingCost 
FROM Orders 
GROUP BY ShipMode;

-- 2. Days to Ship Analysis:
SELECT 
  ShipMode, 
  AVG(DATEDIFF(ShipDate, OrderDate)) AS AverageDaysToShip 
FROM 
  Orders 
GROUP BY 
  ShipMode;


-- 3. Monthly Sales and Shipping Costs

SELECT 
  EXTRACT(YEAR FROM OrderDate) AS Year, 
  EXTRACT(MONTH FROM OrderDate) AS Month, 
  SUM(CAST(ShippingCost AS DECIMAL(10,2))) AS TotalShippingCost, 
  COUNT(OrderID) AS TotalOrders 
FROM 
  Orders 
GROUP BY 
  Year, Month 
ORDER BY 
  Year, Month;
  
  
  SELECT 
  ShipMode, 
  AVG(DATEDIFF(ShipDate, OrderDate)) AS AverageDaysToShip, 
  AVG(CAST(ShippingCost AS DECIMAL(10,2))) AS AverageShippingCost 
FROM 
  Orders 
GROUP BY 
  ShipMode 
ORDER BY 
  AverageDaysToShip, AverageShippingCost;
  
  -- 5. Yearly Growth in Number of Orders
  SELECT
  YEAR(OrderDate) AS Year,
  COUNT(OrderID) AS TotalOrders
 FROM
  Orders
GROUP BY
  Year
ORDER BY
  Year;

-- 6. Order Volume by Day of the Week
SELECT
  DAYNAME(OrderDate) AS DayOfWeek,
  COUNT(OrderID) AS NumberOfOrders
FROM
  Orders
GROUP BY
  DayOfWeek
ORDER BY
  FIELD(DayOfWeek, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

