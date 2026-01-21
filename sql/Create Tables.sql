-- Make Tables for the normalization
CREATE TABLE Customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50)
);

CREATE TABLE Products (
    ProductID VARCHAR(20) PRIMARY KEY,
    ProductName VARCHAR(200),
    Category VARCHAR(50),
    SubCategory VARCHAR(50)
);

CREATE TABLE Ship_Modes (
    ShipModeID INT IDENTITY PRIMARY KEY,
    ShipModeName VARCHAR(50) UNIQUE
);

CREATE TABLE Locations (
    LocationID INT IDENTITY PRIMARY KEY,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(20),
    Region VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE,
    ShipDate DATE,
    ShipModeID INT,
    CustomerID VARCHAR(20),
    LocationID INT,
    FOREIGN KEY (ShipModeID) REFERENCES Ship_Modes(ShipModeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Sales (
    RowID INT PRIMARY KEY,
    OrderID VARCHAR(20),
    ProductID VARCHAR(20),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


