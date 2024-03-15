-- Customer Geographics and Behavior Analysis

-- 1. Customer Distribution by Country and State
 
 SELECT Country, State, 
 COUNT(CustomerID) AS NumberOfCustomers 
 FROM Customer 
 GROUP BY Country, 
 State ORDER BY NumberOfCustomers DESC;
 
 -- 2. Segment Analysis by Country
 
 SELECT Country, Segment, 
 COUNT(CustomerID) AS NumberOfCustomers
 FROM Customer 
 GROUP BY Country, Segment 
 ORDER BY Country, 
 NumberOfCustomers DESC;
 
-- 3.  Repeat Customers Analysis

SELECT c.CustomerID, c.CustomerName,
 COUNT(o.OrderID) AS OrdersCount 
 FROM Orders o JOIN Customer c ON o.CustomerID = c.CustomerID 
 GROUP BY c.CustomerID, 
 c.CustomerName HAVING OrdersCount > 1 
 ORDER BY OrdersCount DESC;

