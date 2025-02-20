-- Total Revenue
SELECT CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue FROM pizza_sales;

-- Total Revenue by Pizza Name (Top 5)
SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_revenue DESC;

-- Total Revenue by Pizza Name (Bottom 5)
SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_revenue;

-- Average Order Value (AOV)
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS AOV FROM pizza_sales;

-- Total Number of Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales;

-- Total Number of Pizzas Sold by Pizza Name (Top 5)
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_pizzas_sold DESC;

-- Total Number of Pizzas Sold by Pizza Name (Bottom 5)
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizzas_sold 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY total_pizzas_sold;

-- Total Number of Orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;

-- Average Order Size (AOS)
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS AOS FROM pizza_sales;

-- Monthly Orders
SELECT DATENAME(MONTH, order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY DATENAME(MONTH, order_date) 
ORDER BY total_orders DESC;

-- Daily Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY DATENAME(DW, order_date) 
ORDER BY total_orders DESC;

-- Percentage of Revenue by Pizza Size
SELECT pizza_size, 
    CAST((SUM(total_price) * 100.0) / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct 
FROM pizza_sales 
GROUP BY pizza_size 
ORDER BY pct DESC;

-- Total Number of Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS total_pizza_sold 
FROM pizza_sales 
GROUP BY pizza_category 
ORDER BY total_pizza_sold DESC;

-- Hourly Orders
SELECT DATEPART(HOUR, order_time) AS order_hour, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY DATEPART(HOUR, order_time) 
ORDER BY total_orders DESC;
