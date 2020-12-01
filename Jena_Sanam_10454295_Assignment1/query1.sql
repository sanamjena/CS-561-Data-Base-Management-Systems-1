--Query1 by Sanam Sritam Jena CWID: 10454295
WITH actual_sales AS
(
	SELECT cust, min(quant) AS min_q, max(quant) AS max_q, avg(quant) AS avg_q
	FROM sales
	GROUP BY cust 
),
min_sales AS
(
	SELECT A1.cust, min_q, S.prod, S.day, S.month, S.year, S.state
	FROM actual_sales A1, sales S
	WHERE A1.cust = S.cust AND min_q = S.quant
),
max_sales AS
(
	SELECT A2.cust, max_q, S.prod, S.day, S.month, S.year, S.state
	FROM actual_sales A2, sales S
	WHERE A2.cust = S.cust AND max_q = S.quant
)
SELECT A.cust, A.min_q, MIN.prod, concat(MIN.month,'/',MIN.day,'/',MIN.year) as Min_Date, MIN.state as ST, A.max_q, MAX.prod, concat(MAX.month,'/',MAX.day,'/',MAX.year) as MAX_DATE, MAX.state as ST, round(A.avg_q) as AVG_Q
FROM min_sales AS MIN, max_sales AS MAX, actual_sales AS A
WHERE MIN.cust = MAX.cust AND MIN.cust = A.cust AND MAX.cust = A.cust