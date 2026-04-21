# 📊 E-commerce Data Engineering Pipeline & Analytics Dashboard

## 🚀 Project Overview
This project demonstrates a complete end-to-end **Data Engineering + Analytics pipeline** using real-world e-commerce data.

It covers the full lifecycle of data:
- Data extraction from CSV files
- Data cleaning and transformation using Python
- Data storage in MySQL (relational database design)
- SQL-based analytical queries
- Interactive dashboard creation using Power BI

---

## 🎯 Objective
To simulate a real-world data engineering workflow by building a scalable pipeline that transforms raw e-commerce data into meaningful business insights.

---

## 🧰 Tech Stack
- Python (Pandas, NumPy)
- MySQL
- SQL
- Power BI
- CSV Dataset (E-commerce data)

---

## 📂 Dataset Used
- Olist Brazilian E-commerce Dataset  
- Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## 🔄 Project Workflow

### 1. Data Extraction
- Loaded raw CSV files using Python (Pandas)
- Explored dataset structure using `.head()` and `.columns`

### 2. Data Cleaning & Transformation
- Handled missing values (`NaN → NULL`)
- Converted datetime columns using `pd.to_datetime()`
- Extracted features like:
  - Year
  - Month

### 3. Database Design (MySQL)
Created relational tables:
- customers
- orders

Designed relationships using:
- Primary Key: `customer_id`
- Foreign Key: `customer_id (orders → customers)`

### 4. Data Loading
Two approaches used:
- MySQL `LOAD DATA INFILE`
- Python `mysql.connector` bulk insert (`executemany`)

### 5. SQL Analysis
Performed business analysis using SQL:
- Customer behavior analysis
- Order trends over time
- Delivery performance analysis
- State-wise sales distribution

### 6. Dashboard (Power BI)
Built interactive dashboard including:
- Orders by state
- Monthly order trends
- Order status distribution
- Delivery performance metrics

---

## 📊 Key Insights
- Identified top-performing states based on order volume
- Analyzed monthly growth trends in orders
- Evaluated delivery performance (on-time vs late deliveries)
- Observed customer distribution across regions

---

## 🧠 Key Learnings
- End-to-end ETL pipeline design
- Handling real-world messy data
- Relational database modeling
- SQL joins and aggregations
- Data visualization using Power BI
- Difference between manual and automated data pipelines

---

## ⚙️ How to Run This Project

### Step 1: Clone Repository
```bash
git clone https://github.com/your-username/ecommerce-data-pipeline.git