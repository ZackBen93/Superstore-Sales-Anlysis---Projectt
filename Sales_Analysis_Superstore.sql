--Overview of superstore sales Analysis
SELECT
COUNT(order_id) AS Total_Orders,  --Total Orders
COUNT(DISTINCT country) AS Total_countries,  --Countries
COUNT(DISTINCT product_name) AS Total_products,  --Total Products
COUNT(DISTINCT category) AS Total_categories,   --Total categories
COUNT(DISTINCT sub_category) AS Total_subcategories, --Total Subcategories
COUNT(DISTINCT year) AS Total_Years,  
SUM(sales) AS Total_Sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_profit,
AVG(discount) AS Total_discount
FROM dbo.[SuperStoreOrders Dataset]

-- Sales Performance Analysis
--calculates the total sales and total quantity sold for each product
-- within different categories.
-- based on the total sales, providing a summary of the highest-selling products.
SELECT TOP 10
product_name,
category,
SUM(sales) AS Tot_Sales,
SUM(quantity) AS Tot_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY product_name,
category
ORDER BY
SUM(sales) DESC    

--Sales Over Year
SELECT
year,
SUM(sales) AS Tot_Sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY year
ORDER BY SUM(sales) DESC

--Customer Segmentation
SELECT
segment,
COUNT(DISTINCT customer_name) AS Tot_Customers,
SUM(sales) AS Tot_Sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY segment
ORDER BY SUM(sales) DESC

-- Shipping and order management
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(profit) AS AVG_Profit
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode
ORDER BY AVG(profit) DESC

--Time Analysis
SELECT
ship_mode,
AVG(DATEDIFF(DAY,order_date, ship_date)) AS Avg_Time_Gape
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode

--Profitability and Cost Analysis
SELECT
product_name,
category,
sub_category,
AVG(profit) AS AVG_Profit,
AVG(discount) AS AVG_discount
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC

--Global Sales & Quantity Overview
SELECT
country,
SUM(sales) AS Tot_Sales,
SUM(quantity) AS Tot_quantity
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY country
ORDER BY SUM(sales) DESC

--State Level Category exploration
SELECT
product_name,
category,
SUM(quantity) AS Tot_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY
product_name,
category
ORDER BY SUM(quantity) DESC

-- Regional sub-Category analysis
SELECT
region,
sub_category,
SUM(quantity) AS Tot_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY
region,
sub_category
ORDER BY SUM(quantity) DESC