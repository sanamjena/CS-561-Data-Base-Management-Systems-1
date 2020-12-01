--Query1 by Sanam Sritam Jena CWID: 10454295
select

  t1.prod as "PRODUCT", t2.month as "MONTH",

  (

		select count(quant) as "SALES_COUNT_BETWEEN_AVGS"

  from sales s

  where 

			s.prod=t1.prod and s.month=t2.month and

    (	(quant < (select avg(quant) as avg_quant
    from sales
    where prod=s.prod and month=s.month-1) and

    quant > (select avg(quant) as avg_quant
    from sales
    where prod=s.prod and month=s.month+1)) OR
    (quant > (select avg(quant) as avg_quant
    from sales
    where prod=s.prod and month=s.month-1) and

    quant < (select avg(quant) as avg_quant
    from sales
    where prod=s.prod and month=s.month+1))			)

	 )

from

  (select distinct prod
  from sales) t1,

  (select column1 as month
  from (values
      (1),
      (2),
      (3),
      (4),
      (5),
      (6),
      (7),
      (8),
      (9),
      (10),
      (11),
      (12)) as t3) t2