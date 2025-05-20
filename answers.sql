-- Question 1 Achieving 1NF (First Normal Form) 🛠️
-- First, create a new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert data from the original table, splitting the multi-valued Products column
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Query to view the transformed 1NF table
SELECT * FROM ProductDetail_1NF;

-- Question 2 Achieving 2NF (Second Normal Form) 🧩
-- Create the Orders table (to store order-specific information)
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the OrderDetails table (to store product-specific information for each order)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Insert data into the Orders table
INSERT INTO Orders_2NF (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Query to view the Orders table
SELECT * FROM Orders_2NF;

-- Query to view the OrderDetails table
SELECT * FROM OrderDetails_2NF;

-- Query to join the tables and retrieve the original data structure
SELECT o.OrderID, o.CustomerName, od.Product, od.Quantity
FROM Orders_2NF o
JOIN OrderDetails_2NF od ON o.OrderID = od.OrderID;
