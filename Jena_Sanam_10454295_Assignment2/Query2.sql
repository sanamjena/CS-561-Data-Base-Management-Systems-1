--Query2 by Sanam Sritam Jena CWID: 10454295
with
    q1
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 1
        group by cust, prod
    ),

    q2
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 2
        group by cust, prod
    ),

    q3
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 3
        group by cust, prod
    ),

    q4
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 4
        group by cust, prod
    ),

    q5
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 5
        group by cust, prod
    ),

    q6
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 6
        group by cust, prod
    ),

    q7
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 7
        group by cust, prod
    ),

    q8
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 8
        group by cust, prod
    ),

    q9
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 9
        group by cust, prod
    ),

    q10
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 10
        group by cust, prod
    ),

    q11
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 11
        group by cust, prod
    ),

    q12
    as
    (
        select cust, prod, round(avg(quant),0) as quant
        from sales
        where month = 12
        group by cust, prod
    ),

    base
    as
    (
        select cust, prod
        from sales
        group by cust, prod
    ),

    t1
    as
    (
        select b.cust, b.prod, cast('1' as int) as month, cast(null as numeric) as before_avg, q1.quant as during_avg, q2.quant as after_avg
        from base as b left join q1 using(cust, prod
    ) left join q2 using
(cust, prod)), 

t2 as
(select b.cust, b.prod, cast('2' as int) as month, q1.quant as before_avg, q2.quant as during_avg, q3.quant as after_avg
from base as b left join q1 using(cust, prod)
left join q2 using
(cust, prod) left join q3 using
(cust, prod)), 

t3 as
(select b.cust, b.prod, cast('3' as int) as month, q2.quant as before_avg, q3.quant as during_avg, q4.quant as after_avg
from base as b left join q2 using(cust, prod)
left join q3 using
(cust, prod) left join q4 using
(cust, prod)),

t4 as
(select b.cust, b.prod, cast('4' as int) as month, q3.quant as before_avg, q4.quant as during_avg, q5.quant as after_avg
from base as b left join q3 using(cust, prod)
left join q4 using
(cust, prod) left join q5 using
(cust, prod)),

t5 as
(select b.cust, b.prod, cast('5' as int) as month, q4.quant as before_avg, q5.quant as during_avg, q6.quant as after_avg
from base as b left join q4 using(cust, prod)
left join q5 using
(cust, prod) left join q6 using
(cust, prod)),

t6 as
(select b.cust, b.prod, cast('6' as int) as month, q5.quant as before_avg, q6.quant as during_avg, q7.quant as after_avg
from base as b left join q5 using(cust, prod)
left join q6 using
(cust, prod) left join q7 using
(cust, prod)),

t7 as
(select b.cust, b.prod, cast('7' as int) as month, q6.quant as before_avg, q7.quant as during_avg, q8.quant as after_avg
from base as b left join q6 using(cust, prod)
left join q7 using
(cust, prod) left join q8 using
(cust, prod)),

t8 as
(select b.cust, b.prod, cast('8' as int) as month, q7.quant as before_avg, q8.quant as during_avg, q9.quant as after_avg
from base as b left join q7 using(cust, prod)
left join q8 using
(cust, prod) left join q9 using
(cust, prod)),

t9 as
(select b.cust, b.prod, cast('9' as int) as month, q8.quant as before_avg, q9.quant as during_avg, q10.quant as after_avg
from base as b left join q8 using(cust, prod)
left join q9 using
(cust, prod) left join q10 using
(cust, prod)),

t10 as
(select b.cust, b.prod, cast('10' as int) as month, q9.quant as before_avg, q10.quant as during_avg, q11.quant as after_avg
from base as b left join q9 using(cust, prod)
left join q10 using
(cust, prod) left join q11 using
(cust, prod)),

t11 as
(select b.cust, b.prod, cast('11' as int) as month, q10.quant as before_avg, q11.quant as during_avg, q12.quant as after_avg
from base as b left join q10 using(cust, prod)
left join q11 using
(cust, prod) left join q12 using
(cust, prod)), 

t12 as
(select b.cust, b.prod, cast('12' as int) as month, q11.quant as before_avg, q12.quant as during_avg, cast(null as numeric) as after_avg
from base as b left join q11 using(cust, prod)
left join q12 using
(cust, prod)),

t13 as
(
    select *
    from t1
union
    select *
    from t2
union
    select *
    from t3
union
    select *
    from t4
union
    select *
    from t5
union
    select *
    from t6
union
    select *
    from t7
union
    select *
    from t8
union
    select *
    from t9
union
    select *
    from t10
union
    select *
    from t11
union
    select *
    from t12)

select t13.cust as "CUSTOMER" , t13.prod as "PRODUCT" , t13.month as "MONTH" , t13.before_avg as "BEFORE_AVG" , t13.during_avg as "DURING_AVG" , t13.after_avg as "AFTER_AVG"
from t13
order by cust,prod,month