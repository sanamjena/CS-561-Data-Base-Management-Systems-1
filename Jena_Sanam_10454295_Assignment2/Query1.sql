with q1 as
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 1 
	group by prod), 

q2 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 2 
	group by prod),

q3 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 3 
	group by prod), 

q4 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 4 
	group by prod), 

q5 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 5 
	group by prod),

q6 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 6 
	group by prod),

q7 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 7 
	group by prod),

q8 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 8 
	group by prod),

q9 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 9 
	group by prod),

q10 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 10 
	group by prod),

q11 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 11 
	group by prod),

q12 as 
(select prod, round(avg(quant),0) as avg_q1 
	from sales 
	where month = 12 
	group by prod),