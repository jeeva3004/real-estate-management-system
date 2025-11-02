#  Real Estate Management System

##  Project Overview
The **Real Estate Management System** is a database project designed to manage real estate properties, agents, clients, and transactions.  
It provides efficient ways to track property listings, sales transactions, and agent commissions using SQL concepts like **JOINs**, **Views**, **Subqueries**, **Triggers**, and **Stored Procedures**.

---

##  Database Tables
The project consists of the following main tables:
- **Properties** – Stores details of each property (address, city, price, status, etc.)
- **Agents** – Contains information about real estate agents and their commission rates
- **Clients** – Stores client details (buyers and sellers)
- **Transactions** – Records property sales, linking clients, agents, and properties

---

##  Key SQL Features Used

###  1. JOINS
Used to combine data from multiple tables.  
**Example Output:** Property details with agent name, sale price, and commission.

**Purpose:** To show relationships between properties, agents, clients, and transactions.

---

###  2. VIEW
Created a view `SoldPropertyView` to display all sold properties with agent name and commission.

**Purpose:** To easily view key business information without writing complex joins repeatedly.

---

###  3. SUBQUERY
Used a subquery to find properties sold **above the average sale price**.

**Purpose:** To identify premium property sales.

---

###  4. TRIGGER
A trigger `BeforeInsertTransactions` automatically calculates **agent commission** when a new transaction is inserted.

**Purpose:** To ensure accurate commission calculation and avoid manual errors.

---

###  5. STORED PROCEDURE
A stored procedure `GetAgentSalesCount` returns the number of properties sold by a particular agent.

**Purpose:** To generate quick reports and analytics for management.

---

##  Sample Data
Inserted records use **South Indian names and cities** (like Chennai, Bengaluru, Kochi, Hyderabad, Madurai).

---

##  Tools & Technologies
- **Database:** MySQL / MariaDB  
- **Language:** SQL  
- **Platform:** phpMyAdmin / MySQL Workbench  
- **Version Control:** Git & GitHub

---

##  How to Run
1. Create the database in MySQL  
2. Run the table creation SQL scripts  
3. Insert sample records  
4. Execute the JOIN, VIEW, TRIGGER, and PROCEDURE scripts  
5. Test queries using:
   ```sql
   SELECT * FROM SoldPropertyView;
   CALL GetAgentSalesCount(1);
