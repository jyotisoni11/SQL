# 🛒 Retail Sales SQL Project

A MySQL-based retail sales database project that demonstrates
real-world data analysis using SQL.
It covers database design, data insertion, and 24 analytical queries.

---

## 📁 Project Structure

retail-sales-sql/
├── retail_sales.sql        # Full SQL file (schema + data + queries)
└── README.md               # Project documentation

---

## 🗄️ Database Schema

**Database:** `retail_sales`

| Table        | Description                        |
|--------------|------------------------------------|
| customers    | Customer details (name, city)      |
| products     | Product details (name, price)      |
| orders       | Order records with dates           |
| order_items  | Products inside each order         |

### Relationships
- customers → orders (one customer, many orders)
- orders → order_items (one order, many items)
- products → order_items (one product, many orders)

---

## 📊 Queries Covered

### Basic Queries
- Customer name with order date
- Customer name with product name
- Order ID, product name, quantity
- Customer name, city, order ID
- Product name with price and quantity

### Aggregate Queries
- Total orders per customer
- Total revenue generated
- Total spending per customer
- Total sales per product
- Total sales per month

### Advanced Queries
- Top 5 most sold products
- Top 3 customers by spending
- Customer who spent the most
- Customer who bought highest quantity
- Most expensive product sold
- Average order value
- Order with highest total amount
- 3rd highest spending customer

### Complex Queries
- Products never ordered
- Products bought together in same order
- City with highest sales
- Customer lifetime value
- Top selling product per month (Window Function)

---

## 🛠️ Tools Used

- **MySQL** — Database
- **MySQL Workbench** — Query execution
- **GitHub** — Version control

---

## ▶️ How to Run

1. Open **MySQL Workbench**
2. Open the file `retail_sales.sql`
3. Run the full file — it will:
   - Create the database
   - Create all tables
   - Insert sample data
   - Run all 24 queries

---

## 📌 Key Concepts Used

- JOINS (INNER, LEFT)
- GROUP BY & HAVING
- Aggregate Functions (SUM, COUNT, AVG)
- Subqueries
- Window Functions (RANK, PARTITION BY)
- ORDER BY & LIMIT
- OFFSET
