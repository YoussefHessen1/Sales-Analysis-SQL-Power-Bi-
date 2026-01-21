INSERT INTO Ship_Modes (ShipModeName)
SELECT DISTINCT
    [Ship_Mode]
FROM data;


INSERT INTO Customers(CustomerID, CustomerName, Segment)
SELECT DISTINCT
    [Customer_ID],
    [Customer_Name],
    Segment
FROM data;

MERGE Products AS target
USING (
    SELECT
        Product_ID,
        MAX(LTRIM(RTRIM(Product_Name))) AS Product_Name,
        MAX(LTRIM(RTRIM(Category)))     AS Category,
        MAX(LTRIM(RTRIM(Sub_Category))) AS Sub_Category
    FROM data
    GROUP BY Product_ID
) AS source
ON target.ProductID = source.Product_ID

WHEN NOT MATCHED THEN
    INSERT (ProductID, ProductName, Category, SubCategory)
    VALUES (
        source.Product_ID,
        source.Product_Name,
        source.Category,
        source.Sub_Category
    );


	MERGE Locations AS target
USING (
    SELECT
        Country,
        State,
        City,
        Postal_Code,
        Region
    FROM data
    GROUP BY
        Country,
        State,
        City,
        Postal_Code,
        Region
) AS source
ON  target.Country     = source.Country
AND target.State       = source.State
AND target.City        = source.City
AND target.PostalCode  = source.Postal_Code
AND target.Region      = source.Region

WHEN NOT MATCHED THEN
    INSERT (Country, State, City, PostalCode, Region)
    VALUES (
        source.Country,
        source.State,
        source.City,
        source.Postal_Code,
        source.Region
    );



MERGE Orders AS target
USING (
    SELECT
        d.Order_ID,
        MAX(d.Order_Date) AS Order_Date,
        MAX(d.Ship_Date)  AS Ship_Date,
        sm.ShipModeID,
        d.Customer_ID,
        l.LocationID
    FROM data d
    JOIN Ship_Modes sm
        ON LTRIM(RTRIM(d.Ship_Mode)) = sm.ShipModeName
    JOIN Locations l
        ON d.Country      = l.Country
       AND d.State        = l.State
       AND d.City         = l.City
       AND d.Postal_Code  = l.PostalCode
       AND d.Region       = l.Region
    GROUP BY
        d.Order_ID,
        sm.ShipModeID,
        d.Customer_ID,
        l.LocationID
) AS source
ON target.OrderID = source.Order_ID

WHEN NOT MATCHED THEN
    INSERT (
        OrderID,
        OrderDate,
        ShipDate,
        ShipModeID,
        CustomerID,
        LocationID
    )
    VALUES (
        source.Order_ID,
        source.Order_Date,
        source.Ship_Date,
        source.ShipModeID,
        source.Customer_ID,
        source.LocationID
    );


INSERT INTO Sales (
    RowID,
    OrderID,
    ProductID,
    Sales,
    Quantity,
    Discount,
    Profit
)
SELECT
    d.Row_ID,
    d.Order_ID,
    d.Product_ID,
    d.Sales,
    d.Quantity,
    d.Discount,
    d.Profit
FROM data d
WHERE NOT EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.RowID = d.Row_ID
);
