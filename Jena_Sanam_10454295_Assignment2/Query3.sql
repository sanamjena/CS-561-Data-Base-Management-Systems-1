--Query3 by Sanam Sritam Jena CWID: 10454295
with
    t1
    as
    (
        select cust, prod, cst.state, round(
        (select avg(s1.quant)
            from sales s1
            where s1.cust=s.cust and s1.prod=s.prod and s1.state=cst.state)
        ,0) as prod_avg
        from sales s, (select distinct state
            from sales) cst
        group by cust, prod, cst.state
    ),

    t2
    as
    (
        select t1.cust, t1.prod, t1.state, t1.prod_avg, round(avg(s.quant),0) as  other_cust_avg
        from t1, sales as s
        where t1.cust != s.cust and t1.prod = s.prod and t1.state = s.state
        group by t1.cust, t1.prod, t1.state, t1.prod_avg
    ),

    t3
    as
    (
        select t1.cust, t1.prod, t1.state, t1.prod_avg, round(avg(s.quant),0) as other_prod_avg
        from t1, sales as s
        where t1.cust = s.cust and t1.state = s.state and t1.prod != s.prod
        group by t1.cust, t1.prod, t1.state, t1.prod_avg
    )

select t1.cust as "CUSTOMER", t1.prod as "PRODUCT", t1.state as "STATE", t1.prod_avg as "PROD_AVG", t2.other_cust_avg as "OTHER_CUST_AVG", t3.other_prod_avg as "OTHER_PROD_AVG"
from (t1 full outer join t2 on t1.cust=t2.cust and t1.prod=t2.prod and t1.state=t2.state)
    full outer join t3 on t1.cust=t3.cust and t1.prod=t3.prod and t1.state=t3.state
order by t1.cust,t1.prod,t1.state