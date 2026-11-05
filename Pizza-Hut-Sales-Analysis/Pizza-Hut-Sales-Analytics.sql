create database pizzahut;
use pizzahut;
select*from order_details;
select*from pizza_types;
select*from pizzas;

create table orders(order_id int not null,
order_date date not null,
order_time time not null);

select*from orders;

-- Retrieve the total number of order placed --
select count(order_id) as total_orders from orders;

-- Calculate the total revenue generated from the pizza sales--

select*from pizzas;
select*from order_details;

select
sum(order_details.quantity*pizzas.price) as total_sales
from  order_details join pizzas
on order_details.pizza_id=pizzas.pizza_id;

-- Identify the highest price pizzas--
select*from pizzas;
select*from pizza_types;

select pizza_types.name,pizzas.price
from pizza_types join pizzas
on
pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc
limit 1;


-- find the category wise distribution of pizza--
select*from pizza_types;
select category, count(name) from pizza_types
group by category;


-- Determine the distribution of orders by hour of the day--

select*from orders;
select hour (order_time),count(order_id) from orders
group by hour(order_time);
