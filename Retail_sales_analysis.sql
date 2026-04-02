create database if not exists retail_sales;

use retail_sales;

create table if not exists customers(
customer_id int primary key,
customer_name varchar(50),
city varchar(50));

create table if not exists products(
product_id int primary key,
product_name varchar(50),
price decimal(10,2));

create table if not exists orders(
order_id int primary key,
customer_id int,
order_date date,
foreign key(customer_id) references customers(customer_id));

create table if not exists order_items(
order_id int,
product_id int,
quantity int,
primary key(order_id, product_id),
foreign key (order_id) references orders (order_id),
foreign key (product_id) references products(product_id));

INSERT INTO customers VALUES
(1,'Amit Sharma','Delhi'),
(2,'Neha Verma','Mumbai'),
(3,'Rahul Singh','Bangalore'),
(4,'Priya Mehta','Chennai'),
(5,'Karan Patel','Ahmedabad'),
(6,'Sneha Reddy','Hyderabad'),
(7,'Vikram Joshi','Pune'),
(8,'Anjali Kapoor','Delhi'),
(9,'Rohit Gupta','Mumbai'),
(10,'Pooja Nair','Kochi'),
(11,'Arjun Das','Kolkata'),
(12,'Meera Iyer','Chennai'),
(13,'Sahil Khan','Lucknow'),
(14,'Tanya Malhotra','Delhi'),
(15,'Mohit Jain','Jaipur'),
(16,'Lakshmi Rao','Hyderabad'),
(17,'Yash Thakur','Indore'),
(18,'Komal Arora','Chandigarh'),
(19,'Aditya Roy','Kolkata'),
(20,'Riya Sen','Bangalore');


INSERT INTO products VALUES
(101,'Laptop',55000),
(102,'Mobile',20000),
(103,'Headphones',1500),
(104,'Keyboard',800),
(105,'Mouse',500),
(106,'Monitor',12000),
(107,'Tablet',25000),
(108,'Smartwatch',7000),
(109,'Printer',9000),
(110,'Camera',30000),
(111,'Speaker',4000),
(112,'Power Bank',1200);


INSERT INTO orders VALUES
(1001,1,'2025-01-05'),
(1002,2,'2025-01-07'),
(1003,3,'2025-01-10'),
(1004,4,'2025-01-15'),
(1005,5,'2025-01-18'),
(1006,6,'2025-02-02'),
(1007,7,'2025-02-05'),
(1008,8,'2025-02-08'),
(1009,9,'2025-02-12'),
(1010,10,'2025-02-18'),
(1011,11,'2025-03-01'),
(1012,12,'2025-03-04'),
(1013,13,'2025-03-10'),
(1014,14,'2025-03-15'),
(1015,15,'2025-03-20'),
(1016,16,'2025-04-02'),
(1017,17,'2025-04-05'),
(1018,18,'2025-04-10'),
(1019,19,'2025-04-15'),
(1020,20,'2025-04-18'),
(1021,1,'2025-05-02'),
(1022,3,'2025-05-05'),
(1023,5,'2025-05-10'),
(1024,7,'2025-05-12'),
(1025,9,'2025-05-18'),
(1026,11,'2025-06-01'),
(1027,13,'2025-06-05'),
(1028,15,'2025-06-08'),
(1029,17,'2025-06-12'),
(1030,19,'2025-06-15');

INSERT INTO order_items VALUES
(1001,101,1),
(1001,105,2),
(1002,102,1),
(1003,103,2),
(1004,106,1),
(1005,104,1),
(1006,108,1),
(1007,101,1),
(1008,111,2),
(1009,110,1),
(1010,107,1),
(1011,102,1),
(1012,103,3),
(1013,109,1),
(1014,112,2),
(1015,101,1),
(1016,105,3),
(1017,108,2),
(1018,106,1),
(1019,110,1),
(1020,111,1),
(1021,102,2),
(1022,101,1),
(1023,104,2),
(1024,107,1),
(1025,109,1),
(1026,110,1),
(1027,103,2),
(1028,112,1),
(1029,105,2),
(1030,108,1);

------- 1 Show customer name and order date for all orders.
select c.customer_name , o.order_date from customers c
join orders o on c.customer_id = o.customer_id ;

------ 2 Show customer name and product name for each order.
select c.customer_name , p.product_name from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id;

------ 3 Show order_id, product_name, quantity.
select o.order_id , p.product_name , oi.quantity from orders o 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id;


------ 4 Show customer_name, city, order_id.
select c.customer_name , c.city , o.order_id from customers c 
join orders o on c.customer_id = o.customer_id;

---- 5 Show product_name with price and quantity ordered.
select p.product_name , p.price , oi.quantity from products p
join order_items oi on p.product_id = oi.product_id;

---- 6 Find total number of orders placed by each customer.
select  c.customer_name , count(o.order_id) as total_orders from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id , c.customer_name ;

--- 7  Find total revenue generated.
select sum(p.price * oi.quantity) as total_revenue from order_items oi
join products p on oi.product_id = p.product_id ;

---- 8 Find total spending of each customer.
select c.customer_name , sum(p.price * quantity) as total_spent from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id 
group by c.customer_id , c.customer_name ;

------ 9 Find total sales of each product.
select p.product_name , sum(oi.quantity) as total_sales from products p 
join order_items oi on p.product_id = oi.product_id 
group by p.product_name ;

------- 10 Find top 5 most sold products.
select p.product_name , sum(oi.quantity) as total_quantity_sold from products p 
join order_items oi on p.product_id = oi.product_id 
group by p.product_name
order by total_quantity_sold desc
limit 5  ;

------ 11 Find customer who spent the most money.
select c.customer_name , sum(p.price * oi.quantity) as total_spent from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id
group by c.customer_name
order by total_spent desc
limit 1 ;

------ 12 Find most expensive product sold.
select p.product_name , p.price from products p 
join order_items oi on p.product_id = oi.product_id
order by p.price desc
limit 1;

------- 13 Find average order value.
SELECT AVG(order_total) AS avg_order_value
FROM (
  SELECT o.order_id, SUM(p.price * oi.quantity) AS order_total
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY o.order_id
) AS order_totals;

------ 14 Find total sales per month.
select monthname(o.order_date) as month_name , sum(p.price * oi.quantity) as total_sales from orders o 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id 
group by monthname(o.order_date)
order by month_name;

------- 15 Find customers who placed more than 1 order.
select c.customer_name , count(o.order_id) as total_orders from customers c 
join orders o on c.customer_id = o.customer_id 
group by c.customer_name 
having count(o.order_id) > 1;

------ 16 Find products that were never ordered.
select p.product_name from products p 
left join order_items oi on p.product_id = oi.product_id 
where oi.product_id is null;

------- 17 Find top 3 customers by total spending.
select c.customer_name , sum(p.price * oi.quantity) as total_spending from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id
group by c.customer_name 
order by total_spending desc
limit 3 ;

------- 18 Find customer who bought the highest quantity.
select c.customer_name , sum(oi.quantity) as total_quantity from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
group by  c.customer_name 
order by total_quantity desc
limit 1;

------ 19 Find order with highest total amount.
select o.order_id , sum(p.price * oi.quantity) as total_amount from orders o 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id 
group by o.order_id 
order by  total_amount desc
limit 1 ;

------- 20 Find products bought together in same order.
select oi1.order_id , p1.product_name as product_1 , p2.product_name as product_2 from order_items oi1
join order_items oi2 on oi1.order_id = oi2.order_id and 
oi1.product_id < oi2.product_id
join products p1 on oi1.product_id = p1.product_id
join products p2 on oi2.product_id = p2.product_id;


------- 21 Find city with highest sales.
select c.city , sum(p.price * oi.quantity)  as highest_sale from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id 
group by c.city
order by highest_sale desc
limit 1 ;


------- 22  Find customer lifetime value.
select c.customer_name , sum(p.price * oi.quantity) as lifetime_value from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id 
group by c.customer_name 
order by lifetime_value desc;

------- 23 Find top selling product per month.
SELECT month, product_name, total_quantity
FROM (
  SELECT MONTH(o.order_date) AS month,
         p.product_name,
         SUM(oi.quantity) AS total_quantity,
         RANK() OVER (PARTITION BY MONTH(o.order_date) ORDER BY SUM(oi.quantity) DESC) AS rnk
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY MONTH(o.order_date), p.product_name
) ranked
WHERE rnk = 1;

------- 24 Find 3rd highest spending customer.
select c.customer_name , sum(p.price * oi.quantity) as total_spent from customers c 
join orders o on c.customer_id = o.customer_id 
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id
group by c.customer_name 
order by total_spent desc
limit 1 offset 2;



