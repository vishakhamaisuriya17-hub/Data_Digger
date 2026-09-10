# 🗃️ Data Digger

A SQL practice project that models a simple **e-commerce order management system** — covering database design, CRUD operations, joins, and aggregate queries across four related tables: **Customers, Orders, Products, and OrderDetails**.

> "Quality is our Motto." — Shaping "skills" for "scaling" higher...!!!

---

## 📌 Overview

Data Digger simulates the backend data layer of an online store. It walks through table creation, sample data insertion, and a series of real-world query scenarios — from basic CRUD operations to multi-table aggregations — designed to demonstrate practical SQL proficiency.

---

## 🧱 Database Schema

### 1. Customers
| Field | Description |
|---|---|
| `Customer_Id` (PK) | Unique customer identifier |
| `Name` | Customer name |
| `Email` | Customer email address |
| `Address` | Customer address |

### 2. Orders
| Field | Description |
|---|---|
| `OrderID` (PK) | Unique order identifier |
| `Customer_ID` (FK → Customers) | Customer who placed the order |
| `OrderDate` | Date the order was placed |
| `TotalAmount` | Total value of the order |

### 3. Products
| Field | Description |
|---|---|
| `ProductID` (PK) | Unique product identifier |
| `ProductName` | Name of the product |
| `Price` | Unit price |
| `Stock` | Units available in inventory |

### 4. OrderDetails
| Field | Description |
|---|---|
| `OrderDetailID` (PK) | Unique line-item identifier |
| `OrderID` (FK → Orders) | Associated order |
| `ProductID` (FK → Products) | Product ordered |
| `Quantity` | Units ordered |
| `SubTotal` | Line-item total |

**Relationships:**
- `Orders.Customer_ID` → `Customers.Customer_Id` (one customer → many orders)
- `OrderDetails.OrderID` → `Orders.OrderID` (one order → many line items)
- `OrderDetails.ProductID` → `Products.ProductID` (one product → many order lines)

---

## 🔍 Queries Performed

### Customers
- Insert 5+ sample customers
- Retrieve all customer details
- Update a customer's address
- Delete a customer by `Customer_Id`
- Filter customers by name (e.g. `Name = 'Alice'`)

### Orders
- Insert 5+ sample orders
- Retrieve all orders for a specific customer
- Update an order's total amount
- Delete an order by `OrderID`
- Retrieve orders placed in the last 30 days
- Retrieve the highest, lowest, and average order amount (`MAX`, `MIN`, `AVG`)

### Products
- Insert 5+ sample products
- Retrieve all products sorted by price (descending)
- Update a product's price
- Delete out-of-stock products
- Retrieve products within a price range (`BETWEEN`)
- Retrieve the most expensive and cheapest product (`MAX`, `MIN`)

### OrderDetails
- Insert 5+ sample line items
- Retrieve all details for a specific order
- Calculate total revenue across all orders (`SUM`)
- Retrieve the top 3 most-ordered products (`GROUP BY`, `ORDER BY`, `LIMIT`)
- Count how many times a specific product has been sold (`COUNT`)

---

## 📂 Project Structure

```
Project Outputs/
├── Customer_Table/        # Query outputs / screenshots for Customers
├── OrderDetails_table/    # Query outputs / screenshots for OrderDetails
├── Orders_Table/          # Query outputs / screenshots for Orders
├── Products_Table/        # Query outputs / screenshots for Products
Data_Digger_Project.sql   # Full SQL script (schema + data + queries)
README.md               # Project documentation
```

---

## ⚙️ Getting Started

### Prerequisites
- Any SQL RDBMS (PostgreSQL recommended — the script uses `CURRENT_DATE - INTERVAL '30 days'` syntax; adjust for MySQL/SQL Server if needed)
- A SQL client (psql, pgAdmin, DBeaver, MySQL Workbench, etc.)

### Setup
1. Clone the repository
   ```bash
   git clone https://github.com/vishakhamaisuriya17-hub/Data_Digger.git
   cd Data_Digger
   ```
2. Open `Data_Digger_Project.sql` in your SQL client.
3. Run the script top to bottom — it will:
   - Create all four tables with primary/foreign key constraints
   - Insert sample data
   - Execute the full set of CRUD and analytical queries

---

## 🛠️ Tech Stack

- **SQL** (schema design, DDL, DML, joins, aggregate functions)
- Compatible with PostgreSQL / MySQL (minor syntax tweaks may be needed for `INTERVAL` and `LIMIT` clauses depending on your RDBMS)

---

## 📈 Key Concepts Demonstrated

- Relational schema design with primary & foreign keys
- CRUD operations (`INSERT`, `SELECT`, `UPDATE`, `DELETE`)
- Filtering with `WHERE`, `BETWEEN`, and date arithmetic
- Sorting with `ORDER BY`
- Aggregate functions: `MAX`, `MIN`, `AVG`, `SUM`, `COUNT`
- Grouping and ranking with `GROUP BY` + `LIMIT`

---

## 👩‍💻 Author

**Vishakha Maisuriya**
🔗 [GitHub Repository](https://github.com/vishakhamaisuriya17-hub/Data_Digger.git)

---

## 📄 License

This project is open for learning and reference purposes. Feel free to fork and build on it.
