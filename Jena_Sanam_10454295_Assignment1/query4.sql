--Query4 by Sanam Sritam Jena CWID: 10454295
with temp1 as(
select s.cust as Customer, s.prod as Product, 
cast(avg(q1.quant) as decimal(10,2)) as Q1_Avg,
cast(avg(q2.quant) as decimal(10,2)) as Q2_Avg,
cast(avg(q3.quant) as decimal(10,2)) as Q3_Avg,
cast(avg(q4.quant) as decimal(10,2)) as Q4_Avg,
cast(avg(s.quant) as decimal(10,2)) as Average, sum(s.quant) as Total, count(s.quant) as Count
from sales s
full outer join sales q1 on q1.cust=s.cust and q1.prod = s.prod and q1.month in (1,2,3)
full outer join sales q2 on q2.cust=s.cust and q2.prod = s.prod and q2.month in (4,5,6)
full outer join sales q3 on q3.cust=s.cust and q3.prod = s.prod and q3.month in (7,8,9)
full outer join sales q4 on q4.cust=s.cust and q4.prod = s.prod and q4.month in (10,11,12)
group by s.cust, s.prod
order by 1, 2)
select * from temp1 where Customer is not null and Product is not null