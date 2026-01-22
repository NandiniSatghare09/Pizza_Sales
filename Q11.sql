# Analyze the cumulative revenue generated over time.


SELECT order_date,
SUM(revenue) OVER(ORDER BY order_date) as cum_revenue
from
(SELECT orders.order_date,
SUM(orders_details.quantity * pizzas.price) as revenue
FROM orders_details JOIN pizzas
on orders_details.pizza_id = pizzas.pizza_id
JOIN orders
on orders.order_id  = orders_details.order_id
GROUP BY orders.order_date) as sales;
