--Query2 by Sanam Sritam Jena CWID: 10454295
with prodQuant as(
select s.month, day, sum(quant) sumQuant
from sales s
group by s.month, day
order by 1,3 DESC),
TotalSales as(
select month, sum(quant) as TotalSales from sales
group by month order by month)

select a.month,
a.day as Most_Profit_Day, a.sumQuant as Most_Profit_Total_Q,
b.day as Least_Profit_Day, b.sumQuant as Least_Profit_Total_Q,
c.TotalSales as Total_Sales_Q
from prodQuant a
inner join prodQuant b on a.month = b.month
inner join TotalSales c on c.month = b.month
where a.sumQuant in (select max(sumQuant) from prodQuant group by month)
and b.sumQuant in (select min(sumQuant) from prodQuant group by month)