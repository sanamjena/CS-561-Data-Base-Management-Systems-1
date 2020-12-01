with
    avgm
    as
    
    (
        select
            s.prod ,
            smon.month,
            ( select avg(quant)
            from sales s2
            where s2.prod=s.prod and s2.month=smon.month) as avge
        from sales as s, (select distinct month
            from sales) smon
        group by s.prod,smon.month
    )
select
    s.prod as "PRODUCT",
    m.month as "MONTH",
    (select count(*)
    from sales s1
    where s1.month=m.month and s.prod=s1.prod and
        ((s1.quant>(select avge
        from avgm
        where avgm.prod=s.prod and avgm.month=m.month-1) and
        s1.quant<(select avge
        from avgm
        where avgm.prod=s.prod and avgm.month=m.month+1)
	)
        or
        (s1.quant<(select avge
        from avgm
        where avgm.prod=s.prod and avgm.month=m.month-1)
        and s1.quant>(select avge
        from avgm
        where avgm.prod=s.prod and avgm.month=m.month+1)
	))
) as "SALES_COUNT_BETWEEN_AVGS"
from sales s, (select distinct month
    from sales) as m
group by m.month,s.prod
order by s.prod,m.month