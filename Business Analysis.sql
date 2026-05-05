CREATE DATABASE inc5000_db;
USE inc5000_db;
select * from cleaned_inc5000;

#Top 10 companies by revenue 
SELECT company, revenue
FROM cleaned_inc5000
ORDER BY revenue DESC
LIMIT 10;

#Top 10 fastest growing company
SELECT company, growth
FROM cleaned_inc5000
ORDER BY growth DESC
LIMIT 10;

#Industries wise average revenue
SELECT industry, AVG(revenue) AS avg_revenue
FROM cleaned_inc5000
GROUP BY industry
ORDER BY avg_revenue DESC;

#States with most companies
SELECT state_s, COUNT(*) AS total_companies
FROM cleaned_inc5000
GROUP BY state_s
ORDER BY total_companies DESC;

#Average employees per industry
SELECT industry, AVG(workers) AS avg_workers
FROM cleaned_inc5000
GROUP BY industry;

#Revenue Category
SELECT company, revenue,
CASE 
    WHEN revenue > 100000000 THEN 'High'
    WHEN revenue > 10000000 THEN 'Medium'
    ELSE 'Low'
END AS revenue_category
FROM cleaned_inc5000;

#Top companies in each industries
SELECT *
FROM (
    SELECT company, industry, revenue,
           RANK() OVER (PARTITION BY industry ORDER BY revenue DESC) AS rnk
    FROM cleaned_inc5000
) t
WHERE rnk = 1;

#Which industry is growing fast
SELECT industry, AVG(growth) AS avg_growth
FROM cleaned_inc5000
GROUP BY industry
ORDER BY avg_growth DESC;

#Cities with highest revenue
SELECT city, SUM(revenue) AS total_revenue
FROM cleaned_inc5000
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 10;

