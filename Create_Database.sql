CREATE DATABASE Global_Superstore;
Use Global_Superstore;
-- Customer Table
CREATE TABLE Customer(
    CustomerID VARCHAR(255) PRIMARY KEY,
    CustomerName VARCHAR(255),
    Segment VARCHAR(255),
	City VARCHAR(255),
	State VARCHAR(255),
    Country VARCHAR(255)
    
    
);
-- Product Table
CREATE TABLE Product (
    OrderID VARCHAR(255),
    ProductID VARCHAR(255) PRIMARY KEY,
    Category VARCHAR(255),
    SubCategory VARCHAR(255),
    ProductName VARCHAR(255),
    Sales Integer(255),
    Quantity DECIMAL(10, 2),
    Discount Decimal(10,2),
    Profit Decimal(10,4)
    
);
-- Order Table
CREATE TABLE Orders(
    RowID Varchar(255),
    OrderID VARCHAR(255) PRIMARY KEY,
    OrderDate DATE,
    ShipDate VARCHAR(255),
	ShipMode VARCHAR(255),
    CustomerID VARCHAR(255),
    ProductID VARCHAR(255),
    Market VARCHAR(255),
    Region VARCHAR(255),
    ShippingCost VARCHAR(255),
    OrderPriority VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    Foreign Key (ProductID) references Product(ProductID)
    
);
SHOW VARIABLES LIKE "secure_file_priv";






