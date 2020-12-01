--Query4 by Sanam Sritam Jena CWID: 10454295
WITH
	actsales
	AS
	(
		SELECT cust, prod, month, sum(quant) AS monthly
		FROM sales
		GROUP BY cust, prod, month

	),
	totsales
	AS
	(
		SELECT t1.cust, t1.prod, t1.month, sum(t2.monthly) AS tot
		FROM actsales t1, actsales t2
		WHERE t1.cust = t2.cust AND t1.prod = t2.prod AND t1.month >= t2.month
		GROUP BY t1.cust, t1.prod, t1.month

	),
	onethreesales
	AS
	(
		SELECT cust, prod, round(sum(monthly)/3,0) AS onethree
		FROM actsales
		GROUP BY cust, prod
	)

SELECT t1.cust AS "CUSTOMER", t1.prod AS "PRODUCT", min(t1.month) AS "1/3 PURCHASED BY MONTH"
FROM totsales t1, onethreesales t2
WHERE t1.cust = t2.cust AND t1.prod = t2.prod AND tot >= onethree
GROUP BY t1.cust, t1.prod