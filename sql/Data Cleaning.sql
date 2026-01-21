SELECT
    COUNT(*) Total,
    COUNT(DISTINCT CustomerID) Unique_Customers
FROM Customers;

SELECT *
FROM Customers
WHERE CustomerName IS NULL OR CustomerName = '';

UPDATE Customers
SET
    CustomerName = LTRIM(RTRIM(CustomerName)),
    Segment      = LTRIM(RTRIM(Segment));

ALTER TABLE Customers
ALTER COLUMN CustomerName VARCHAR(100) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT chk_segment
CHECK (Segment IN ('Consumer','Corporate','Home Office'));


SELECT
    COUNT(*) Total,
    COUNT(DISTINCT ProductID) Unique_Products
FROM Products;

SELECT *
FROM Products
WHERE ProductName IS NULL;

UPDATE Products
SET
    ProductName = LTRIM(RTRIM(ProductName)),
    Category    = LTRIM(RTRIM(Category)),
    SubCategory = LTRIM(RTRIM(SubCategory));

ALTER TABLE Products
ALTER COLUMN ProductName VARCHAR(200) NOT NULL;

SELECT ShipModeName, COUNT(*)
FROM Ship_Modes
GROUP BY ShipModeName;

UPDATE Ship_Modes
SET ShipModeName = LTRIM(RTRIM(ShipModeName));

ALTER TABLE Ship_Modes
ADD CONSTRAINT uq_shipmode UNIQUE (ShipModeName);

SELECT *
FROM Locations
WHERE Country IS NULL OR City IS NULL;

UPDATE Locations
SET
    Country    = LTRIM(RTRIM(Country)),
    State      = LTRIM(RTRIM(State)),
    City       = LTRIM(RTRIM(City)),
    PostalCode = LTRIM(RTRIM(PostalCode)),
    Region     = LTRIM(RTRIM(Region));

ALTER TABLE Locations
ALTER COLUMN Country VARCHAR(50) NOT NULL;

ALTER TABLE Locations
ADD CONSTRAINT uq_location UNIQUE
(Country, State, City, PostalCode, Region);

SELECT *
FROM Orders
WHERE ShipDate < OrderDate;

UPDATE Orders
SET ShipDate = OrderDate
WHERE ShipDate < OrderDate;

ALTER TABLE Orders
ADD CONSTRAINT chk_order_dates
CHECK (ShipDate >= OrderDate);

SELECT *
FROM Sales
WHERE Sales < 0 OR Quantity <= 0;

DELETE FROM Sales
WHERE Sales < 0 OR Quantity <= 0;

ALTER TABLE Sales
ADD CONSTRAINT chk_sales_positive
CHECK (Sales >= 0 AND Quantity > 0);
