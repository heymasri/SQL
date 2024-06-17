--TOTAL REVENUE
select SUM(total_price)as total_revenue from pizza_sales;
--AVG ORDER VALUE
select (sum(total_price)/ count(distinct order_id)) as avg_order_value from pizza_sales;
--TOTAL PIZZA SOLD
select SUM(quantity) as total_pizza_sold from pizza_sales;
--TOTAL ORDERS
select COUNT(distinct(order_id)) as total_orders from pizza_sales;
--AVG PIZZA PER ORDER
select cast(cast(sum(quantity) as decimal(10,2))/CAST( COUNT(distinct order_id)as decimal(10,2)) as decimal (10,2)) as avg_pizza_per_order from pizza_sales;
--DAILY TREND FOR TOTAL ORDERS
select DATENAME(DW, order_date) as order_day, COUNT(distinct order_id) as total_orders from pizza_sales;
--HOURLY TREND FOR ORDERS
select DATEPART(HOUR, order_time) as order_hours, COUNT(distinct order_id)
as total_orders from pizza_sales
group by DATEPART(HOUR,order_time)
order by DATEPART(hour, order_time);
--% OF SALES BY PIZZA CATEGORY
select pizza_category, CAST(sum(total_price) as decimal(10,2)) as total_revenue,
CAST(sum(total_price)*100 / (select sum(total_price) from pizza_sales)
as decimal(10,2)) as PCT from pizza_sales group by pizza_category;
--% OF SALES BY PIZZA SIZE
select pizza_size , CAST(sum(total_price) as decimal(10,2)) as total_revenue,
CAST(sum(total_price)*100 / (select sum(total_price) from pizza_sales)
as decimal(10,2)) as PCT from pizza_sales
group by pizza_size
order by pizza_size;
--TOTAL PIZZAS SOLD BY PIZZA CATEGORY
select  pizza_category, SUM(quantity) as total_quantity_sold from pizza_sales
group by pizza_category
order by total_quantity_sold desc;
--TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
select top 5 pizza_name, SUM(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold desc;
--BOTTOM 5 BEST SELLERS BY TOTAL PIZZAS SOLD
select top 5 pizza_name, SUM(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold ASC;
