Objective

The goal of this project is to generate dynamic reports for category, brand, product, and store-level insights using the order_details_v1, product_hierarchy_v1, and store_cities_v1 datasets. These reports will help analyze trends, performance, and growth metrics to support data-driven business decision-making.

Category-Level Performance Report
Generate reports on the following key metrics at the Category Level:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data should be extracted for:
Yesterday, Month-to-Date (MTD), and Last Month (LM)
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD
Tools: MySQL Workbench / BigQuery with dynamic date handling
 
Top 20 Brands Performance Report
Identify Top 20 Brands based on GMV and generate reports on:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data for Yesterday, MTD, and LM
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD
Tools: MySQL Workbench / BigQuery with dynamic date handling
 
Top 50 Products Performance Report
Identify Top 50 Product_Ids based on GMV, including Product Name and Brand
Generate reports on:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data for Yesterday, MTD, and LM
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD
Tools: MySQL Workbench / BigQuery with dynamic date handling

Store-Type Level Performance Report
Generate insights at the StoreType_Id Level using order_details_v1 and store_cities_v1 datasets:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data for Yesterday, MTD, and LM
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD
Tools: MySQL Workbench / BigQuery with dynamic date handling

Orders and GMV Range Distribution (MTD)
Generate a distribution report for Orders and GMV based on predefined range segments.

Tools: MySQL Workbench / BigQuery with dynamic date handling
Deliverables

SQL Queries (MySQL/BigQuery)
Tabular reports with key performance metrics
Growth percentage analysis for each metric
