--Query3 by Sanam Sritam Jena CWID: 10454295
with MostFavMon as
(select s.prod, month as MostFavMonth from sales s
where quant in (select max(t.quant) from sales t where s.prod = t.prod group by prod)),
LeastFavMon as(
select s.prod, month as LeastFavMonth from sales s
where quant in (select min(t.quant) from sales t where s.prod = t.prod group by prod))

select m.prod as PRODUCT, mostfavmonth as MOST_FAV_MO, leastfavmonth as LEAST_FAV_MO from mostfavmon m
full outer join leastfavmon l on m.prod=l.prod
order by 1