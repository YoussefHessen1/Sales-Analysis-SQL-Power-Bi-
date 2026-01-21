# SuperStore Sales Analysis Project  
**SQL Server & Power BI – End-to-End Data Analytics Project**

---

## 📌 Project Overview
This project presents an end-to-end data analytics workflow for a **Retail Sales dataset**, starting from raw data cleaning and transformation in **SQL Server**, through data modeling and analysis, and ending with an interactive **Power BI dashboard** exported as a PDF.

The main goal of the project is to help decision-makers understand sales performance, profitability drivers, customer behavior, and product efficiency using clean, well-structured data and clear analytical insights.

---

## 🎯 Project Objectives
- Clean and prepare raw retail data using SQL Server
- Build a normalized and analytics-ready data model
- Apply business logic and data quality rules
- Perform analytical queries to uncover insights
- Design an interactive Power BI dashboard for decision support

---

## 🛠 Tools & Technologies
- **SQL Server** – Data cleaning, transformation, modeling, and analysis  
- **Power BI** – Data modeling, DAX measures, and dashboard design  
- **Power BI PDF Export** – Final reporting and presentation  

---


---

## 🧹 Phase 1: Data Cleaning (SQL Server)
The raw data was cleaned and prepared using SQL Server to ensure data quality and consistency before analysis.

### Key Cleaning Steps:
- Removing duplicates
- Handling missing and null values
- Trimming and standardizing text fields
- Validating dates and numeric values
- Ensuring data consistency across tables

📄 File:
- `Data Cleaning.sql`

---

## 🧱 Phase 2: Data Modeling & Normalization
The dataset was normalized and structured into a **Star Schema** to support analytical queries and BI reporting.

### Tables Created:
- **Fact Table**
  - Sales
- **Dimension Tables**
  - Customers
  - Products
  - Orders
  - Locations
  - Ship Modes
  - Date

Primary and foreign keys were applied to enforce relationships and data integrity.

📄 Files:
- `Create Tables.sql`
- `Insert Values.sql`

---

## 📊 Phase 3: SQL Analysis
Analytical SQL queries were written to explore business performance and identify key insights.

### Examples of Analysis:
- Overall sales and profit performance
- Profitability by category and sub-category
- Impact of discounts on profit
- Identification of loss-making orders
- Customer and product contribution analysis
- Time-based sales and profit trends

📄 File:
- `Analysis.sql`

---

## 📈 Phase 4: Power BI Dashboard
The cleaned and modeled data was imported into Power BI using **Import Mode** for optimal performance.

### Dashboard Pages:
1. **Overview**
   - Total Sales
   - Total Profit
   - Profit Margin
   - Sales trends and regional performance

2. **Sales Analysis**
   - Monthly sales trends
   - Top products and categories
   - Discount impact on sales

3. **Customers Analysis**
   - Customer segments performance
   - Average sales per customer
   - Top customers by sales and profit

4. **Products Analysis**
   - Product profitability
   - High-sales but low-profit products
   - Opportunities for performance improvement

---

## 📄 Final Output
- Interactive Power BI Dashboard
- Exported PDF report for easy sharing and presentation

📎 File:
- `Sales Analysis.pdf`

---

## 🧠 Key Insights
- Sales growth does not always translate into higher profitability
- High discount levels significantly reduce profit margins
- A small percentage of customers and products drive most of the revenue
- Some products generate high sales volume but low or negative profit
- Optimizing pricing, discounts, and product mix can improve profit without increasing sales volume

---


---

## 🚀 Conclusion
This project demonstrates a complete data analytics workflow, highlighting strong skills in SQL-based data preparation, analytical thinking, and business-oriented dashboard design.  
It showcases the ability to transform raw data into meaningful insights that support data-driven decision-making.

---

## 📬 Feedback
Any feedback or suggestions are highly appreciated.

