--Customers table--

create table Customers(
  Customer_Id int primary key,
  Name varchar(20),
  Email varchar(50),
  Address varchar(100)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'rahul@gmail.com', 'Ahmedabad'),
(2, 'charlie', 'priya@gmail.com', 'Surat'),
(3, 'Raj', 'amit@gmail.com', 'Vadodara'),
(4, 'Vishu', 'neha@gmail.com', 'Rajkot'),
(5, 'Jenisha', 'riya@gmail.com', 'Bhavnagar');

select * from Customers;

UPDATE Customers
SET Address = 'Mumbai'
WHERE Customer_ID = 1;

DELETE FROM Customers
WHERE Customer_ID = 5;

SELECT * FROM Customers
WHERE Name = 'Alice';

--Orders table--

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Customer_ID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Orders VALUES
(101, 1, '2026-09-01', 2500.00),
(102, 2, '2026-09-03', 1800.00),
(103, 1, '2026-08-25', 3200.00),
(104, 3, '2026-08-15', 4500.00),
(105, 4, '2026-07-20', 1500.00);

select * from Orders;

UPDATE Orders
SET TotalAmount = 3000
WHERE OrderID = 101;

DELETE FROM Orders
WHERE OrderID = 105;

SELECT * FROM Orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL '30 days';

SELECT 
    MAX(TotalAmount) AS Highest_Order,
    MIN(TotalAmount) AS Lowest_Order,
    AVG(TotalAmount) AS Average_Order
FROM Orders;

--Products table --

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);


INSERT INTO Products VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Mouse', 800.00, 50),
(3, 'Keyboard', 1500.00, 30),
(4, 'Monitor', 12000.00, 15),
(5, 'Headphones', 2500.00, 0);

select * from Products;

SELECT * FROM Products
ORDER BY Price DESC;


UPDATE Products
SET Price = 60000
WHERE ProductID = 1;


DELETE FROM Products
WHERE Stock = 0;


SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;


SELECT
    MAX(Price) AS Most_Expensive,
    MIN(Price) AS Cheapest
FROM Products;

--OrderDetails table--

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails VALUES
(1, 101, 1, 1, 60000.00),
(2, 101, 2, 2, 1600.00),
(3, 102, 3, 1, 1500.00),
(4, 103, 4, 2, 24000.00),
(5, 104, 4, 3, 7500.00);

select * from OrderDetails;

select * from OrderDetails 
where OrderID='101';

select sum(SubTotal) AS Total_Revenue
FROM OrderDetails;

SELECT 
    ProductID,
    SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC
LIMIT 3;

SELECT COUNT(*) AS Times_Sold
FROM OrderDetails
WHERE ProductID = 2;

