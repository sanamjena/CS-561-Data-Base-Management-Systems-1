--Query5 by Sanam Sritam Jena CWID: 10454295
--IMP -> CREATE THE VIEWS ONE AFTER THE OTHER INDIVIDUALLY THEN EXECUTE THE FINAL QUERY
--drop view NJMax_Sales;
create view NJMax_Sales
as
with temp2 as(
select r.cust as Customer, r.prod as Product, max(r.quant) as NJ_MAX
from sales r 
where r.state='NJ'
group by r.cust, r.prod
order by 1,2		 
) 
select Customer, Product, NJ_MAX, concat(s.month,'/',s.day,'/',s.year) as NJ_MaxDate 
from temp2 t, sales s
where NJ_MAX=quant and Customer=cust and Product=prod
order by 1,2

--drop view NYMax_Sales;
create view NYMax_Sales
as
with temp1 as(
select r.cust as Customer, r.prod as Product, max(r.quant) as NY_MAX
from sales r 
where r.state='NY'
group by r.cust, r.prod
order by 1,2		 
) 
select Customer, Product, NY_MAX, concat(s.month,'/',s.day,'/',s.year) as NY_MaxDate 
from temp1 t, sales s
where NY_MAX=quant and Customer=cust and Product=prod
order by 1,2

--drop view CTMax_Sales;
create view CTMax_Sales
as
with temp3 as(
select r.cust as Customer, r.prod as Product, max(r.quant) as CT_MAX
from sales r 
where r.state='CT'
group by r.cust, r.prod
order by 1,2		 
) 
select Customer, Product, CT_MAX, concat(s.month,'/',s.day,'/',s.year) as CT_MaxDate 
from temp3 t, sales s
where CT_MAX=quant and Customer=cust and Product=prod
order by 1,2

select ny.customer, ny.product,
NJ_MAX, NJ_MaxDate as DATE, NY_MAX, NY_MaxDate as DATE, CT_MAX, CT_MaxDate as DATE
from NYMax_sales as ny
left outer join NJMax_Sales as nj on nj.customer = ny.customer and nj.product = ny.product
left outer join CTMax_Sales as ct on ct.customer = nj.customer and ct.product = nj.product