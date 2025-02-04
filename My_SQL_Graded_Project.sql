Super Mart Level 1 Project,

Project 1 Yday Bases
______________________________________
select 
x.t1_orders as yday_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as yday_orders_Growth,

x.t1_customers as yday_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as yday_customers_Growth,

x.t1_Gmv as yday_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as yday_Gmv_Growth,

round(x.t1_Revenue,2) as yday_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as yday_Revenue_Growth,

x.t1_live_products as yday_live_product,
x.t1_live_stores as yday_live_stores,

From

(select 
coalesce(count(Distinct case when x.order_date = '2025-01-23' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date = '2025-01-23'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_stores end),0) as t1_live_stores,


from
(select 
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
where od.order_date between '2025-01-22' and  '2025-01-23')x
group by x.live_products

)x
__________________________________________________________________________________________________________________________

#Yday Bases project 2


select 
x.brand,
x.t1_orders as yday_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as yday_orders_Growth,

x.t1_customers as yday_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as yday_customers_Growth,

x.t1_Gmv as yday_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as yday_Gmv_Growth,

round(x.t1_Revenue,2) as yday_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as yday_Revenue_Growth,

x.t1_live_products as yday_live_product,
x.t1_live_stores as yday_live_stores,

From

(select 
x.brand,
coalesce(count(Distinct case when x.order_date = '2025-01-23' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date = '2025-01-23'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.brand,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2025-01-22' and  '2025-01-23')x
group by x.brand
order by x.brand Desc
limit 20

)x

__________________________________________________________________________________________________________________________

#Yday Bases project 3
select 
x.product,
x.t1_orders as yday_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as yday_product_orders_Growth,

x.t1_customers as yday_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as yday_product_customers_Growth,

x.t1_Gmv as yday_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as yday_product_Gmv_Growth,

round(x.t1_Revenue,2) as yday_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as yday_product_Revenue_Growth,

x.t1_live_products as yday_product_live_product,
x.t1_live_stores as yday_product_live_stores,

From

(select 
x.product,
coalesce(count(Distinct case when x.order_date = '2025-01-23' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date = '2025-01-23'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.product,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2025-01-22' and  '2025-01-23')x
group by x.product
order by x.product Desc
limit 50

)x
__________________________________________________________________________________________________________________________

#yday Bases project 4

select 
x.storetype_id,
x.t1_orders as yday_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as yday_product_orders_Growth,

x.t1_customers as yday_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as yday_product_customers_Growth,

x.t1_Gmv as yday_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as yday_product_Gmv_Growth,

round(x.t1_Revenue,2) as yday_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as yday_product_Revenue_Growth,

x.t1_live_products as yday_product_live_product,
x.t1_live_stores as yday_product_live_stores,

From

(select 
x.storetype_id,
coalesce(count(Distinct case when x.order_date = '2025-01-23' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date = '2025-01-23'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date = '2025-01-22'then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date = '2025-01-23'then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date = '2025-01-22'then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date = '2025-01-23'then x.live_stores end),0) as t1_live_stores,


from
(select 
sc,storetype_id,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.store_cities sc on od.store_id = sc.store_id
where od.order_date between '2025-01-22' and  '2025-01-23')x
group by x.storetype_id
)x

_______________________________________________________________________________________________________________________
#Mtd Based Project 1

SELECT 
x.t1_orders AS mtd_orders,
ROUND((t1_orders - t2_orders) / NULLIF(t2_orders, 0) * 100, 2) AS mtd_orders_growth,

x.t1_customers AS mtd_customers,
ROUND((t1_customers - t2_customers) / NULLIF(t2_customers, 0) * 100, 2) AS mtd_customers_growth,

x.t1_Gmv AS mtd_Gmv,
ROUND((t1_Gmv - t2_Gmv) / NULLIF(t2_Gmv, 0) * 100, 2) AS mtd_Gmv_growth,

ROUND(x.t1_Revenue, 2) AS mtd_Revenue,
ROUND((t1_Revenue - t2_Revenue) / NULLIF(t2_Revenue, 0) * 100, 2) AS mtd_Revenue_growth,

x.t1_live_products AS mtd_live_products,
t1_live_stores AS mtd_live_stores

FROM (
    SELECT 
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-23' THEN x.order_id END), 0) AS t1_orders,
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-22' THEN x.order_id END), 0) AS t2_orders,

        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-23' THEN x.customer_id END), 0) AS t1_customers,
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-22' THEN x.customer_id END), 0) AS t2_customers,

        COALESCE(SUM(CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-23' THEN x.gmv END), 0) AS t1_Gmv,
        COALESCE(SUM(CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-22' THEN x.gmv END), 0) AS t2_Gmv,

        COALESCE(SUM(CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-23' THEN x.gmv / 1.18 END), 0) AS t1_Revenue,
        COALESCE(SUM(CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-22' THEN x.gmv / 1.18 END), 0) AS t2_Revenue,

        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-23' THEN x.live_products END), 0) AS t1_live_products,
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date BETWEEN '2025-01-01' AND '2025-01-23' THEN x.live_stores END), 0) AS t1_live_stores

from
(select 
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
where od.order_date between '2025-01-22' and  '2025-01-23')x
group by x.live_products)x

__________________________________________________________________________________________________________________________
Mtd Level project 2


select 
x.brand,
x.t1_orders as mtd_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as mtd_orders_Growth,

x.t1_customers as mtd_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as mtd_customers_Growth,

x.t1_Gmv as mtd_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as mtd_Gmv_Growth,

round(x.t1_Revenue,2) as mtd_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as mtd_Revenue_Growth,

x.t1_live_products as mtd_live_product,
x.t1_live_stores as mtd_live_stores,

From

(select 
x.brand,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-01-01' AND '2024-12-31' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.brand,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2024-12-01' and  '2024-12-31')x
group by x.brand
order by x.brand Desc
limit 20
)x




__________________________________________________________________________________________________________________________
Mtd Level project 3

select 
x.product,
x.t1_orders as mtd_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as mtd_product_orders_Growth,

x.t1_customers as mtd_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as mtd_product_customers_Growth,

x.t1_Gmv as mtd_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as mtd_product_Gmv_Growth,

round(x.t1_Revenue,2) as mtd_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as mtd_product_Revenue_Growth,

x.t1_live_products as mtd_product_live_product,
x.t1_live_stores as mtd_product_live_stores,

From

(select 
x.product,
coalesce(count(Distinct case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29'  then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date BETWEEN '2025-01-01' AND '2025-01-29' then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.product,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2025-01-01' and  '2025-01-29')x
group by x.product
order by x.product Desc
limit 50
)x
__________________________________________________________________________________________________________________________
Mtd Level project 4

select 
x.storetype_id,
x.t1_orders as MTD_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as MTD_product_orders_Growth,

x.t1_customers as MTD_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as MTD_product_customers_Growth,

x.t1_Gmv as MTD_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as MTD_product_Gmv_Growth,

round(x.t1_Revenue,2) as MTD_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as MTD_product_Revenue_Growth,

x.t1_live_products as MTD_product_live_product,
x.t1_live_stores as MTD_product_live_stores,

From

(select 
x.storetype_id,
coalesce(count(Distinct case when x.order_date between '2025-01-01' and  '2025-01-31' Then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date between '2025-01-01' and  '2025-01-31' then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date between '2025-01-01' and  '2025-01-31' then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date between '2025-01-01' and  '2025-01-31' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date between '2025-01-01' and  '2025-01-31' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date between '2025-01-01' and  '2025-01-31' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date between '2025-01-01' and  '2025-01-31' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date between '2025-01-01' and  '2025-01-31' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date between '2025-01-01' and  '2025-01-31' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date between '2025-01-01' and  '2025-01-31' then x.live_stores end),0) as t1_live_stores,


from
(select 
sc,storetype_id,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.store_cities sc on od.store_id = sc.store_id
where od.order_date between '2025-01-01' and  '2025-01-31')x
group by x.storetype_id
)x
__________________________________________________________________________________________________________________________

Lmtd level project 1


SELECT 
x.t1_orders AS Lmtd_orders,
ROUND((t1_orders - t2_orders) / NULLIF(t2_orders, 0) * 100, 2) AS Lmtd_orders_growth,

x.t1_customers AS Lmtd_customers,
ROUND((t1_customers - t2_customers) / NULLIF(t2_customers, 0) * 100, 2) AS Lmtd_customers_growth,

x.t1_Gmv AS Lmtd_Gmv,
ROUND((t1_Gmv - t2_Gmv) / NULLIF(t2_Gmv, 0) * 100, 2) AS Lmtd_Gmv_growth,

ROUND(x.t1_Revenue, 2) AS Lmtd_Revenue,
ROUND((t1_Revenue - t2_Revenue) / NULLIF(t2_Revenue, 0) * 100, 2) AS Lmtd_Revenue_growth,

x.t1_live_products AS Lmtd_live_products,
t1_live_stores AS Lmtd_live_stores

FROM (
    SELECT 
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date between '2024-12-01' and  '2024-12-23' THEN x.order_id END), 0) AS t1_orders,
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date between '2024-12-01' and  '2024-12-22' THEN x.order_id END), 0) AS t2_orders,

        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date between '2024-12-01' and  '2024-12-23' THEN x.customer_id END), 0) AS t1_customers,
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date between '2024-12-01' and  '2024-12-22' THEN x.customer_id END), 0) AS t2_customers,

        COALESCE(SUM(CASE WHEN x.order_date between '2024-12-01' and  '2024-12-23' THEN x.gmv END), 0) AS t1_Gmv,
        COALESCE(SUM(CASE WHEN x.order_date between '2024-12-01' and  '2024-12-22' THEN x.gmv END), 0) AS t2_Gmv,

        COALESCE(SUM(CASE WHEN x.order_date between '2024-12-01' and  '2024-12-23' THEN x.gmv / 1.18 END), 0) AS t1_Revenue,
        COALESCE(SUM(CASE WHEN x.order_date  between '2024-12-01' and  '2024-12-22' THEN x.gmv / 1.18 END), 0) AS t2_Revenue,

        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date between '2024-12-01' and  '2024-12-23' THEN x.live_products END), 0) AS t1_live_products,
        COALESCE(COUNT(DISTINCT CASE WHEN x.order_date between '2024-12-01' and  '2024-12-22' THEN x.live_stores END), 0) AS t1_live_stores

from
(select 
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
where od.order_date between '2024-12-01' and  '2024-12-23')x
group by x.live_products)x

__________________________________________________________________________________________________________________________
Lmtd Level project 2

select 
x.brand,
x.t1_orders as Lmtd_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as Lmtd_orders_Growth,

x.t1_customers as Lmtd_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as Lmtd_customers_Growth,

x.t1_Gmv as mtd_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as Lmtd_Gmv_Growth,

round(x.t1_Revenue,2) as mtd_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as Lmtd_Revenue_Growth,

x.t1_live_products as Lmtd_live_product,
x.t1_live_stores as Lmtd_live_stores,

From

(select 
x.brand,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-01-01' AND '2024-12-28' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28' then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.brand,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2024-12-01' and  '2024-12-29')x
group by x.brand
order by x.brand Desc
limit 20
)x
__________________________________________________________________________________________________________________________
Lmtd Level project 3


select 
x.product,
x.t1_orders as lmtd_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as lmtd_product_orders_Growth,

x.t1_customers as lmtd_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as lmtd_product_customers_Growth,

x.t1_Gmv as lmtd_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as lmtd_product_Gmv_Growth,

round(x.t1_Revenue,2) as lmtd_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as lmtd_product_Revenue_Growth,

x.t1_live_products as lmtd_product_live_product,
x.t1_live_stores as lmtd_product_live_stores,

From

(select 
x.product,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29'  then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28' then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29' then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-29' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-28' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-29' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-28' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-29' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-28' then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.product,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2024-12-01' and  '2024-12-29')x
group by x.product
order by x.product Desc
limit 50
)x
__________________________________________________________________________________________________________________________
Lmtd level project 4

select 
x.storetype_id,
x.t1_orders as LMTD_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as LMTD_product_orders_Growth,

x.t1_customers as LMTD_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as LMTD_product_customers_Growth,

x.t1_Gmv as LMTD_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as LMTD_product_Gmv_Growth,

round(x.t1_Revenue,2) as LMTD_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as LMTD_product_Revenue_Growth,

x.t1_live_products as LMTD_product_live_product,
x.t1_live_stores as LMTD_product_live_stores,

From

(select 
x.storetype_id,
coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-29' Then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-28' then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-29' then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-28' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-29' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-28' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-29' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-28' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date between '2024-12-01' and  '2024-12-29' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date between '2024-12-01' and  '2024-12-28' then x.live_stores end),0) as t1_live_stores,


from
(select 
sc,storetype_id,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.store_cities sc on od.store_id = sc.store_id
where od.order_date between '2024-12-01' and  '2024-12-29' )x
group by x.storetype_id
)x

__________________________________________________________________________________________________________________________
Lm Level project 1


select 
x.t1_orders as lm_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as lm_orders_Growth,

x.t1_customers as lm_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as lm_customers_Growth,

x.t1_Gmv as lm_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as lm_Gmv_Growth,

round(x.t1_Revenue,2) as lm_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as lm_Revenue_Growth,

x.t1_live_products as lm_live_product,
x.t1_live_stores as lm_live_stores,

From

(select 
coalesce(count(Distinct case when x.order_date between  '2024-12-01' and  '2024-12-31' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date between  '2024-12-01' and  '2024-12-30'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date between  '2024-12-01' and  '2024-12-31'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date between  '2024-12-01' and  '2024-12-30'then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date between  '2024-12-01' and  '2024-12-31'then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date between  '2024-12-01' and  '2024-12-30'then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date between  '2024-12-01' and  '2024-12-31'then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date between  '2024-12-01' and  '2024-12-30'then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date between  '2024-12-01' and  '2024-12-31'then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date between  '2024-12-01' and  '2024-12-30'then x.live_stores end),0) as t1_live_stores,


from
(select 
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
where od.order_date between '2024-12-01' and  '2024-12-31')x
group by x.live_products

)x
__________________________________________________________________________________________________________________________
Lm Level project 2


select 
x.brand,
x.t1_orders as Lm_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as Lm_orders_Growth,

x.t1_customers as Lm_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as Lm_customers_Growth,

x.t1_Gmv as Lm_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as Lm_Gmv_Growth,

round(x.t1_Revenue,2) as Lm_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as Lm_Revenue_Growth,

x.t1_live_products as Lm_live_product,
x.t1_live_stores as Lm_live_stores,

From

(select 
x.brand,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30'then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31'then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-01-01' AND '2024-12-30' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30' then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.brand,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2024-12-01' and  '2024-12-31')x
group by x.brand
order by x.brand Desc
limit 20

)x
__________________________________________________________________________________________________________________________
Lm level project 3

select 
x.product,
x.t1_orders as LM_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as LM_product_orders_Growth,

x.t1_customers as LM_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as LM_product_customers_Growth,

x.t1_Gmv as LM_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as LM_product_Gmv_Growth,

round(x.t1_Revenue,2) as LM_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as LM_product_Revenue_Growth,

x.t1_live_products as LM_product_live_product,
x.t1_live_stores as LM_product_live_stores,

From

(select 
x.product,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31'  then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30' then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-31' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-30' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-31' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date BETWEEN '2024-01-01' AND '2024-12-30' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-31' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date BETWEEN '2024-12-01' AND '2024-12-30' then x.live_stores end),0) as t1_live_stores,


from
(select 
ph.product,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.product_hierarchy ph on od.product_id = ph.product_id
where od.order_date between '2024-12-01' and  '2024-12-31')x
group by x.product
order by x.product Desc
limit 50
)x
__________________________________________________________________________________________________________________________

Lm Level project 4

select 
x.storetype_id,
x.t1_orders as LM_product_orders,
round((t1_orders - t2_orders)/nullif(t2_orders,0)*100,2) as LM_product_orders_Growth,

x.t1_customers as LM_product_customers,
round((t1_customers - t2_customers)/nullif(t2_customers,0)*100,2) as LM_product_customers_Growth,

x.t1_Gmv as LM_product_Gmv,
round((t1_Gmv - t2_Gmv)/nullif(t2_Gmv,0)*100,2) as LM_product_Gmv_Growth,

round(x.t1_Revenue,2) as LM_product_Revenue,
round((t1_Revenue - t2_Revenue)/nullif(t2_Revenue,0)*00,2) as LM_product_Revenue_Growth,

x.t1_live_products as LMTD_product_live_product,
x.t1_live_stores as LMTD_product_live_stores,

From

(select 
x.storetype_id,
coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-31' Then x.order_id end),0) as t1_orders,
coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-30' then x.order_id end),0) as t2_orders,

coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-31' then x.customer_id end),0) as t1_customers,
coalesce(count(Distinct case when x.order_date between '2024-12-01' and  '2024-12-30' then x.customer_id end),0) as t2_customers,

coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-31' then x.Gmv end),0) as t1_Gmv,
coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-30' then x.Gmv end),0) as t2_Gmv,

coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-31' then x.Gmv/1.18 end),0) as t1_Revenue,
coalesce(sum( case when x.order_date between '2024-12-01' and  '2024-12-30' then x.Gmv/1.18 end),0) as t2_Revenue,


coalesce(count( Distinct case when x.order_date between '2024-12-01' and  '2024-12-31' then x.live_products end),0) as t1_live_products,
coalesce(count( Distinct case when x.order_date between '2024-12-01' and  '2024-12-30' then x.live_stores end),0) as t1_live_stores,


from
(select 
sc,storetype_id,
od.order_id,
od.customer_id,
od.order_date,
od.selling_price as Gmv,
od.product_id as live_products,
od.store_id as live_stores
from supermart-447405.Super.order_details od 
join supermart-447405.Super.store_cities sc on od.store_id = sc.store_id
where od.order_date between '2024-12-01' and  '2024-12-31' )x
group by x.storetype_id
)x




















































































































































































































