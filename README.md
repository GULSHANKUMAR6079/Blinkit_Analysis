# 📊 Blinkit Analysis (SQL + Power BI)

![Made with SQL](https://img.shields.io/badge/Made%20with-SQL-blue)
![Platform: MySQL](https://img.shields.io/badge/Platform-MySQL-lightgrey)
![Visualization: Power BI](https://img.shields.io/badge/Visualization-Power%20BI-yellow)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📝 Project Overview

**Blinkit Analysis** is a data analysis project performed using **MySQL** and visualized using **Power BI**. The dataset was cleaned and transformed using SQL, and various KPIs (Key Performance Indicators) were calculated to understand sales trends, performance by fat content, outlet size, year-wise performance, and more.


## 🗂️ Table of Contents

- [📁 Project Structure](#-project-structure)
- [🧹 Data Cleaning](#-data-cleaning)
- [📊 KPI Metrics](#-kpi-metrics)
- [📌 SQL Queries Used](#-sql-queries-used)
- [📷 Visualizations](#-visualizations)
- [🧪 Tech Stack](#-tech-stack)
- [📚 Dataset Source](#-dataset-source)
- [🙋 Author](#-author)


---

## 🧹 Data Cleaning

Cleaned the `Item_Fat_Content` column where:
- `LF`, `low fat` → standardized to `Low Fat`
- `reg` → standardized to `Regular`

```sql
UPDATE blinkit_data
SET Item_Fat_Content = CASE
    WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;

📊 KPI Metrics
✅ Total Sales
sql
Copy
Edit
SELECT CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), 'M') AS Total_Sales
FROM blinkit_data;
✅ Average Sales
sql
Copy
Edit
SELECT ROUND(AVG(Sales), 2) AS Avg_Sales
FROM blinkit_data;
✅ Total Orders
sql
Copy
Edit
SELECT COUNT(Item_Fat_Content) AS Total_Count
FROM blinkit_data;
📌 SQL Queries Used
🔹 Sales by Fat Content
sql
Copy
Edit
SELECT Item_Fat_Content,
       CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), 'M') AS Total_Sales_Million
FROM blinkit_data
GROUP BY Item_Fat_Content;
🔹 Year-wise Sales Trends
sql
Copy
Edit
SELECT Outlet_Establishment_Year,
       CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), 'M') AS Total_Sales_Million
FROM blinkit_data
WHERE Outlet_Establishment_Year IN (2011,2012,...)
GROUP BY Outlet_Establishment_Year;
🔹 Item Type Analysis (Top 5 by Count)
sql
Copy
Edit
SELECT Item_Type,
       COUNT(*) AS Total_Count,
       CONCAT(ROUND(SUM(Sales)/1000, 2), 'K') AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Count DESC
LIMIT 5;
🔹 Outlet Size & Type Analysis
sql
Copy
Edit
SELECT Outlet_Size,
       COUNT(*) AS Total_Count,
       CONCAT(ROUND(SUM(Sales)/1000, 2), 'K') AS Total_Sales,
       ROUND(AVG(Sales), 2) AS Avg_Sales
FROM blinkit_data
GROUP BY Outlet_Size;
sql
Copy
Edit
SELECT Outlet_Type,
       COUNT(*) AS Total_Count,
       CONCAT(ROUND(SUM(Sales)/1000, 2), 'K') AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Type;
📷 Visualizations
(To be added in visualizations/ folder)

📈 Sales by Year

🥫 Fat Content Distribution

🏪 Outlet Size Sales Contribution

📦 Top Item Types by Sales

You can use Python (Matplotlib / Seaborn) or Excel to generate charts.

## 🧪 Tech Stack

- **Database**: MySQL
- **Languages**: SQL (MySQL dialect)
- **Visualization**: Power BI
- **Tools**: SQL Workbench / MySQL CLI / Power BI Desktop
- **Optional**: Python (for extra visualizations), Excel


Tools: SQL Workbench / MySQL CLI

Languages: SQL (MySQL dialect)

Optional: Python (for visualizations), Excel

📚 Dataset Source
Data was imported from blinkit_data.sql containing 8523 records


🙋 Author
Gulshan Kumar
Data Analyst | SQL Enthusiast | Python Learner
📧 gmail:gulshankumar02985@gmail.com
linkedin:https://www.linkedin.com/in/gulshankumar01/

📄 License
This project is licensed under the MIT License.

