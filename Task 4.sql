CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);

INSERT INTO sales_sample VALUES
(101, 'East', '2024-01-10', 200),
(101, 'East', '2024-02-15', 250),
(102, 'West', '2024-01-12', 300),
(102, 'West', '2024-03-05', 350),
(103, 'North', '2024-01-20', 400),
(101, 'South', '2024-01-25', 180),
(103, 'East', '2024-02-28', 220),
(102, 'North', '2024-03-10', 310),
(101, 'West', '2024-02-17', 290),
(103, 'South', '2024-01-30', 270);

--a)
SELECT 
    Region, 
    Product_Id, 
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;


--b)
SELECT 
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP (Region, Product_Id)
ORDER BY Region, Product_Id;

--c)
SELECT 
    Region,
    Product_Id,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Region, Product_Id, Date)
ORDER BY Region, Product_Id, Date;

--d)
SELECT * FROM sales_sample
WHERE Region = 'East';
SELECT * FROM sales_sample
WHERE Date BETWEEN '2024-01-01' AND '2024-01-31';

--e)
SELECT * FROM sales_sample
WHERE Product_Id = 101
  AND Region = 'East'
  AND Date BETWEEN '2024-02-01' AND '2024-02-29';



