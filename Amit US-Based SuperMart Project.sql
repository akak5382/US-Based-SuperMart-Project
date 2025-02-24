-----Category-Level Performance Report
/* Generate reports on the following key metrics at the Category Level:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data should be extracted for:
Yesterday, Month-to-Date (MTD), and Last Month (LM)
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD*/


select
Y.category,
Tdayorders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
TdayGMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
TdayRevenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
TdayCustomers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
TdayLiveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
TdayLivestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth,

MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth,

LM_orders,
LM_GMV,
LM_Revenue,
LM_Customers,
LM_Liveproduct,
LM_Livestores,

from
(select
X.category,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tdayorders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Ydayorders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as TdayGMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as YdayGMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as TdayRevenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as YdayRevenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as TdayCustomers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as YdayCustomers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as TdayLiveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as YdayLiveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as TdayLivestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as YdayLivestores,

count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores,

count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
ph.category,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y




/* Top 20 Brands Performance Report
Identify Top 20 Brands based on GMV and generate reports on:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data for Yesterday, MTD, and LM
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD*/


select
Y.brand,
Tdayorders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
TdayGMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
TdayRevenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
TdayCustomers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
TdayLiveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
TdayLivestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth,

MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth,

LM_orders,
LM_GMV,
LM_Revenue,
LM_Customers,
LM_Liveproduct,
LM_Livestores,

from
(select
X.brand,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tdayorders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Ydayorders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as TdayGMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as YdayGMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as TdayRevenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as YdayRevenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as TdayCustomers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as YdayCustomers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as TdayLiveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as YdayLiveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as TdayLivestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as YdayLivestores,

count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores,

count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1)Y
order by TdayGMV,MTD_GMV,LM_GMV desc
limit 20



---Category-Level Performance Report
/* Top 50 Products Performance Report
Identify Top 50 Product_Ids based on GMV, including Product Name and Brand
Generate reports on:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data for Yesterday, MTD, and LM
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD*/


select
Y.product,
Y.brand,
Tdayorders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
TdayGMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
TdayRevenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
TdayCustomers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
TdayLiveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
TdayLivestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth,

MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth,

LM_orders,
LM_GMV,
LM_Revenue,
LM_Customers,
LM_Liveproduct,
LM_Livestores,

from
(select
X.product,
X.brand,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tdayorders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Ydayorders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as TdayGMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as YdayGMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as TdayRevenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as YdayRevenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as TdayCustomers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as YdayCustomers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as TdayLiveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as YdayLiveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as TdayLivestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as YdayLivestores,

count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores,

count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
ph.product,
ph.brand,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id)X
group by 1,2)Y
order by TdayGMV,MTD_GMV,LM_GMV desc
limit 50



---Category-Level Performance Report
/* Store-Type Level Performance Report
Generate insights at the StoreType_Id Level using order_details_v1 and store_cities_v1 datasets:
Orders, GMV, Revenue, Customers, Live Products, and Live Stores
Data for Yesterday, MTD, and LM
Compute Growth % for:
Yesterday vs. Previous Day
MTD vs. Last Month MTD*/


select
Y.storetypeid,
Tdayorders,
coalesce(round((Tdayorders-Ydayorders)/nullif (Ydayorders,0),2),0) as Order_growth,
TdayGMV,
coalesce(round((TdayGMV-YdayGMV)/nullif (YdayGMV,0),2),0) as GMV_growth,
TdayRevenue,
coalesce(round((TdayRevenue-YdayRevenue)/nullif (YdayRevenue,0),2),0) as Revenue_growth,
TdayCustomers,
coalesce(round((TdayCustomers-YdayCustomers)/nullif (YdayCustomers,0),2),0) as Customer_growth,
TdayLiveproduct,
coalesce(round((TdayLiveproduct-YdayLiveproduct)/nullif (YdayLiveproduct,0),2),0) as Liveproduct_growth,
TdayLivestores,
coalesce(round((TdayLivestores-TdayLivestores)/nullif (TdayLivestores,0),2),0) as LiveStore_growth,

MTD_orders,
coalesce(round((MTD_orders-LMTD_orders)/nullif (LMTD_orders,0),2),0) as Order_growth,
MTD_GMV,
coalesce(round((MTD_GMV-LMTD_GMV)/nullif (LMTD_GMV,0),2),0) as GMV_growth,
MTD_Revenue,
coalesce(round((MTD_Revenue-LMTD_Revenue)/nullif (LMTD_Revenue,0),2),0) as Revenue_growth,
MTD_Customers,
coalesce(round((MTD_Customers-LMTD_Customers)/nullif (LMTD_Customers,0),2),0) as Customer_growth,
MTD_Liveproduct,
coalesce(round((MTD_Liveproduct-LMTD_Liveproduct)/nullif (LMTD_Liveproduct,0),2),0) as Liveproduct_growth,
MTD_Livestores,
coalesce(round((MTD_Livestores-LMTD_Livestores)/nullif (LMTD_Livestores,0),2),0) as LiveStore_growth,

LM_orders,
LM_GMV,
LM_Revenue,
LM_Customers,
LM_Liveproduct,
LM_Livestores,

from
(select
X.storetypeid,
count (distinct case when X.order_date = '2024-08-18' then (X.order_id) end) as Tdayorders,
count(distinct case when X.order_date = '2024-08-17' then (X.order_id) end) as Ydayorders,
count (distinct case when X.order_date = '2024-08-18' then (X.GMV) end) as TdayGMV,
count (distinct case when X.order_date = '2024-08-17' then (X.GMV) end) as YdayGMV,
count (distinct case when X.order_date = '2024-08-18' then (X.selling_price)/1.18 end) as TdayRevenue,
count (distinct case when X.order_date = '2024-08-17' then (X.selling_price)/1.18 end) as YdayRevenue,
count (distinct case when X.order_date = '2024-08-18' then (X.Customers) end) as TdayCustomers,
count (distinct case when X.order_date = '2024-08-17' then (X.Customers) end) as YdayCustomers,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Products) end) as TdayLiveproduct,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Products) end) as YdayLiveproduct,
count (distinct case when X.order_date = '2024-08-18' then (X.Live_Stores) end) as TdayLivestores,
count (distinct case when X.order_date = '2024-08-17' then (X.Live_Stores) end) as YdayLivestores,

count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.order_id) end) as LMTD_orders,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.GMV) end) as LMTD_GMV,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.selling_price)/1.18 end) as MTD_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.selling_price)/1.18 end) as LMTD_Revenue,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Customers) end) as MTD_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Customers) end) as LMTD_Customers,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Products) end) as MTD_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Products) end) as LMTD_Liveproduct,
count (distinct case when X.order_date between '2024-08-01' and '2024-08-18' then (X.Live_Stores) end) as MTD_Livestores,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-18' then (X.Live_Stores) end) as LMTD_Livestores,

count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.order_id) end) as LM_orders,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.GMV) end) as LM_GMV,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.selling_price)/1.18 end) as LM_Revenue,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Customers) end) as LM_Customers,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Products) end) as LM_Liveproduct,
count (distinct case when X.order_date between '2024-07-01' and '2024-07-31' then (X.Live_Stores) end) as LM_Livestores

from(
select 
sc.storetypeid,
od.order_id, 
od.selling_price as GMV, 
od.selling_price, 
od.customer_id as Customers,
od.product_id as Live_Products,
od.store_id as Live_Stores,
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id
join datascience-434309.super_mart.store_cities_snapshot as sc
on sc.storeid=od.store_id)X
group by 1)Y
order by 1



/* Orders and GMV Range Distribution (MTD)
Generate a distribution report for Orders and GMV based on predefined range segments.*/
#Order Range Order Count GMV Range GMV Value

select
case 
when MTD_orders between 1 and 5 then "1-5"
when MTD_orders between 1 and 5 then "6-10"
when MTD_orders between 1 and 5 then "11-15"
when MTD_orders between 1 and 5 then "16-20"
else "more than 20"
end as order_Range,

count(MTD_orders) as Order_Count,

case 
when MTD_GMV between 1 and 50 then "1-50"
when MTD_GMV between 51 and 100 then "51-100"
when MTD_GMV between 101 and 200 then "101-200"
when MTD_GMV between 201 and 400 then "201-400"
else "more than 400"
end as GMV_Range,
sum(MTD_GMV) as GMV_value

from
(Select 
X.category,
count (distinct case when X.order_date between '2024-05-01' and '2024-08-18' then (X.order_id) end) as MTD_orders,
count (distinct case when X.order_date between '2024-05-01' and '2024-08-18' then (X.GMV) end) as MTD_GMV

from
(select 
ph.category,
od.order_id, 
od.selling_price as GMV, 
od.order_date
from datascience-434309.super_mart.Order_details_snapshot as od
join datascience-434309.super_mart.product_hierarchy_snapshot as ph
on od.product_id=ph.product_id
join datascience-434309.super_mart.store_cities_snapshot as sc
on sc.storeid=od.store_id)X
group by 1)Y
group by 1,3