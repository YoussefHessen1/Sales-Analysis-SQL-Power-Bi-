/* ---------------------------------------------------------
   Overall Business Performance
   Purpose:
   Understand total sales, profit, and order volume.
--------------------------------------------------------- */


-- Purpose:
-- Provide a high-level overview of business performance.
-- This query is typically used as an executive summary.

SELECT
    SUM(Sales)  AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT OrderID) AS Total_Orders
FROM Sales;

-- Purpose:
-- Analyze profitability at the category level.
-- Helps identify categories with high revenue but low profit.

SELECT
    p.Category,
    SUM(s.Sales)  AS Sales,
    SUM(s.Profit) AS Profit,
    ROUND(SUM(s.Profit) / NULLIF(SUM(s.Sales),0), 2) AS Profit_Margin
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Profit;

-- Purpose:
-- Evaluate the impact of discounts on profitability.
-- Used to assess whether discounting strategy is sustainable.

SELECT
    Discount,
    COUNT(*) AS Orders,
    SUM(Profit) AS Profit
FROM Sales
GROUP BY Discount
ORDER BY Discount;

-- Purpose:
-- Identify orders that resulted in an overall loss.
-- These orders represent direct financial risk.

SELECT
    OrderID,
    SUM(Profit) AS Order_Profit
FROM Sales
GROUP BY OrderID
HAVING SUM(Profit) < 0;

-- Purpose:
-- Rank products by sales within each category.
-- Helps identify top-performing products per category.

SELECT *
FROM (
    SELECT
        p.Category,
        p.ProductName,
        SUM(s.Sales) AS Sales,
        RANK() OVER (
            PARTITION BY p.Category
            ORDER BY SUM(s.Sales) DESC
        ) AS Rank_In_Category
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    GROUP BY p.Category, p.ProductName
) t
WHERE Rank_In_Category <= 5;


SELECT
    c.CustomerName,
    SUM(s.Sales) AS Sales,
    ROUND(
        SUM(s.Sales) * 100.0 /
        SUM(SUM(s.Sales)) OVER (), 2
    ) AS Contribution_Percentage
FROM Sales s
JOIN Orders o ON s.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY Sales DESC;

SELECT
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(s.Sales) AS Sales,
    SUM(s.Profit) AS Profit
FROM Sales s
JOIN Orders o ON s.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year, Month;


SELECT
    sm.ShipModeName,
    AVG(DATEDIFF(DAY, o.OrderDate, o.ShipDate)) AS Avg_Delivery_Days,
    SUM(s.Profit) AS Profit
FROM Orders o
JOIN Ship_Modes sm ON o.ShipModeID = sm.ShipModeID
JOIN Sales s ON o.OrderID = s.OrderID
GROUP BY sm.ShipModeName;


