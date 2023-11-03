/*1. Write a SQL query to retrieve all the customer information along with the total number of orders placed by each customer. Display the result in descending order of the number of orders.*/
 
select a.customer_id,a.name, a.email, a.location, count(b.order_id) AS Order_Qut from 
customers a left join orders b on a.customer_id=b.customer_id
group by a.customer_id
order by Order_Qut DESC  

/*2. Write a SQL query to retrieve the product name, quantity, and total amount for each order item. Display the result in ascending order of the order ID.*/

select b.name, a.quantity, a.quantity*a.unit_price AS  total_amount 
from order_items a
left join products b on a.product_id=b.product_id
order by a.order_id ASC


/*3. Write a SQL query to retrieve the total revenue generated by each product category. Display the category name along with the total revenue in descending order of the revenue.*/

select a.name, SUM(c.quantity*c.unit_price) AS revenue_generated  from categories a
LEFT JOIN products b on a.`category_id`=b.category_id
LEFT JOIN order_items c on  b.`product_id`=c.product_id
GROUP BY a.name
order by revenue_generated DESC

/*4. Write a SQL query to retrieve the top 5 customers who have made the highest total purchase amount. Display the customer name along with the total purchase amount in descending order of the purchase amount.*/  

select a.name, IFNULL(SUM(c.quantity*c.unit_price),0) AS highest_total_purchase 
from customers a
left join orders b on a.customer_id=b.customer_id
left join order_items c on b.order_id=c.order_id
group by a.name
order by highest_total_purchase DESC
limit 5








/*






*/


















