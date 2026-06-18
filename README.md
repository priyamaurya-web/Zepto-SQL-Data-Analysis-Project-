# Zepto SQL Data Analysis Project

End-to-end SQL project analyzing product and inventory data from Zepto, a quick-commerce grocery delivery platform. The project covers database setup, data quality checks, data cleaning, and business-focused analysis — all done in raw SQL (PostgreSQL).

## Overview

The dataset represents Zepto's product catalog, including pricing, discounts, stock status, and weight details. The goal of this project was to simulate how a data analyst would take a raw, messy e-commerce dataset and turn it into clean, query-ready data that can answer real business questions around pricing, inventory, and stock management.

## Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL
- **Concepts used:** DDL/DML, aggregate functions, GROUP BY & HAVING, CASE WHEN logic, data cleaning, exploratory data analysis (EDA)

## Dataset Schema

The `zepto` table includes the following columns:

| Column | Type | Description |
|---|---|---|
| sku_id | SERIAL (PK) | Unique identifier for each product |
| category | VARCHAR(150) | Product category |
| name | VARCHAR(150) | Product name |
| mrp | NUMERIC(8,2) | Maximum retail price |
| discountPercentage | NUMERIC(8,2) | Discount offered on MRP |
| availableQuantity | INT | Quantity available in stock |
| discountedSellingPrice | NUMERIC(8,2) | Final selling price after discount |
| weightInGms | INT | Product weight in grams |
| outOfStock | BOOLEAN | Stock availability flag |
| quantity | INT | Order/package quantity |

## Project Workflow

### 1. Database Setup
- Created the `zepto` table with appropriate data types and constraints.

### 2. Data Exploration
- Counted total rows and previewed sample records
- Checked for null values across all key columns
- Identified distinct product categories
- Compared in-stock vs. out-of-stock product counts
- Found product names appearing multiple times under different SKUs

### 3. Data Cleaning
- Detected and removed records with invalid pricing (MRP or discounted price equal to 0)
- Corrected a unit inconsistency — prices were stored in paise and converted to rupees for accurate analysis

### 4. Business Insights (Key SQL Queries)
- **Top discounted products:** Found the top 10 products by discount percentage
- **High MRP, out-of-stock items:** Identified high-value products that are unavailable — a potential lost-revenue signal
- **Revenue estimation by category:** Calculated estimated revenue (discounted price × available quantity) per category
- **Premium, low-discount products:** Found products with MRP above ₹500 but discount under 10%
- **Top categories by average discount:** Ranked categories by their average discount percentage
- **Price-per-gram value analysis:** Calculated price per gram to identify the best value-for-money products
- **Weight-based segmentation:** Categorized products into low, medium, and bulk weight groups using CASE WHEN
- **Inventory weight by category:** Calculated total inventory weight per category to support warehousing/logistics decisions

## Key Takeaway

This project demonstrates that SQL alone — without external BI or visualization tools — can clean inconsistent data and surface insights that directly support pricing strategy, inventory prioritization, and category-level decision-making.

## File Structure

`-- zepto-sql analysis.pdf
---zepto_v1.csv   # Dataset 
├── zepto_sql_analysis.sql # All SQL queries: table setup, cleaning, and analysis
└── README.md                # Project documentation
```

## How to Run

1. Set up a PostgreSQL database
2. Run the SQL script to create the `zepto` table and load the dataset
3. Execute the queries in order, following the sections: exploration → cleaning → business insights

## Author

Priya Maurya
