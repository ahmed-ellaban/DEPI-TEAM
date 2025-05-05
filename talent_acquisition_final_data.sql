-- Combined SQL Queries for 'talent_acquisition_final_data' in 'defaultdb'

-- 1. Top 5 Cities by Job Count
SELECT city, COUNT(job_category1) AS job_count
FROM defaultdb.talent_acquisition_final_data
GROUP BY city
ORDER BY job_count DESC
LIMIT 5;

-- 2. Top 10 Jobs by Highest Salary
SELECT job_title, MAX(max_salary) AS max_salary
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_title
ORDER BY max_salary DESC
LIMIT 10;

-- 3. Total Salary Offered by Job Category
SELECT job_category1, SUM((min_salary + max_salary) / 2) AS total_salary
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_category1
ORDER BY total_salary DESC;

-- 4. Most Popular Job Titles Over Time
SELECT job_title, DATE_FORMAT(post_date, '%Y-%m') AS month, COUNT(*) AS job_count
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_title, month
ORDER BY month, job_count DESC;

-- 5. Average Salary by City
SELECT city, ROUND(AVG((min_salary + max_salary) / 2), 2) AS average_salary
FROM defaultdb.talent_acquisition_final_data
GROUP BY city
ORDER BY average_salary DESC;

-- 6. Job Openings with Multiple Vacancy Listings
SELECT job_title, SUM(num_vacancies) AS total_vacancies
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_title
HAVING total_vacancies > 1
ORDER BY total_vacancies DESC;

-- 7. Job Titles with the Lowest Average Salary
SELECT job_title, ROUND(AVG((min_salary + max_salary) / 2), 2) AS average_salary
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_title
ORDER BY average_salary ASC
LIMIT 10;

-- 8. Salary Ranges of Jobs in IT/Software Development
SELECT job_title, (min_salary + max_salary) / 2 AS salary_range
FROM defaultdb.talent_acquisition_final_data
WHERE job_category1 = 'IT/Software Development'
ORDER BY salary_range DESC;

-- 9. Count of Job Titles with No Experience Required
SELECT job_title, COUNT(*) AS job_count
FROM defaultdb.talent_acquisition_final_data
WHERE experiace_year = '0-1' OR career_level = 'Entry Level'
GROUP BY job_title
ORDER BY job_count DESC;

-- 10. Average Salary for Managerial Positions
SELECT ROUND(AVG((min_salary + max_salary) / 2), 2) AS average_salary
FROM defaultdb.talent_acquisition_final_data
WHERE career_level LIKE '%Manager%';

-- 11. Job Titles Posted on a Specific Date
SELECT job_title, COUNT(*) AS job_count
FROM defaultdb.talent_acquisition_final_data
WHERE post_date = '2021-01-01'
GROUP BY job_title
ORDER BY job_count DESC;

-- 12. Count of Jobs by Job Category and Experience Level
SELECT job_category1, career_level, COUNT(*) AS job_count
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_category1, career_level
ORDER BY job_category1, job_count DESC;

-- 13. Top 5 Industries by Average Salary
SELECT industry1, ROUND(AVG((min_salary + max_salary) / 2), 2) AS average_salary
FROM defaultdb.talent_acquisition_final_data
GROUP BY industry1
ORDER BY average_salary DESC
LIMIT 5;

-- 14. Jobs with the Highest View Count
SELECT job_title, views
FROM defaultdb.talent_acquisition_final_data
ORDER BY views DESC
LIMIT 10;

-- 15. Trends in Job Postings by Month
SELECT DATE_FORMAT(post_date, '%Y-%m') AS month, COUNT(*) AS job_count
FROM defaultdb.talent_acquisition_final_data
GROUP BY month
ORDER BY month;

-- 16. Jobs with Salary Ranges Over 15,000
SELECT job_title, (min_salary + max_salary) / 2 AS salary_range
FROM defaultdb.talent_acquisition_final_data
WHERE (min_salary + max_salary) / 2 > 15000
ORDER BY salary_range DESC;

-- 17. Percentage Distribution of Job Categories
SELECT job_category1, ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM defaultdb.talent_acquisition_final_data), 2) AS percentage
FROM defaultdb.talent_acquisition_final_data
GROUP BY job_category1
ORDER BY percentage DESC;

-- 18. Most Needed Career Levels
SELECT career_level AS most_needed_level, COUNT(*) AS opportunity_offered
FROM defaultdb.talent_acquisition_final_data
GROUP BY career_level
ORDER BY opportunity_offered DESC;

-- 19. Top 15 Cities Offering Jobs
SELECT city, COUNT(job_title) AS job_opportunity_number
FROM defaultdb.talent_acquisition_final_data
GROUP BY city
ORDER BY job_opportunity_number DESC
LIMIT 15;

-- 20. Most Needed Industries
SELECT industry1 AS offered_industry, COUNT(*) AS chances_offered
FROM defaultdb.talent_acquisition_final_data
WHERE industry1 != 'Select'
GROUP BY industry1
ORDER BY chances_offered DESC
LIMIT 15;

-- 21. Job Opportunities Requiring No Experience
SELECT job_title, experiace_year
FROM defaultdb.talent_acquisition_final_data
WHERE experiace_year = '0-1'
ORDER BY job_title ASC;

-- 22. Salary Average for Jobs
SELECT job_title, ROUND(AVG(min_salary + max_salary) / 2, 2) AS salary_average
FROM defaultdb.talent_acquisition_final_data
WHERE min_salary IS NOT NULL AND max_salary IS NOT NULL
GROUP BY job_title
ORDER BY salary_average DESC
LIMIT 15;

-- 23. Jobs Offering More Than 10K Minimum Salary
SELECT job_title, industry1, min_salary
FROM defaultdb.talent_acquisition_final_data
WHERE min_salary > 10000
ORDER BY min_salary DESC;

-- 24. Number of Jobs Offered and Salary Average
SELECT job_title, COUNT(job_title) AS needed_jobs, ROUND(AVG((min_salary + max_salary) / 2)) AS salary_average
FROM defaultdb.talent_acquisition_final_data
WHERE min_salary IS NOT NULL AND max_salary IS NOT NULL
GROUP BY job_title
ORDER BY needed_jobs DESC
LIMIT 15;

-- 25. Salary Average by City
SELECT city, ROUND(AVG((min_salary + max_salary) / 2)) AS salary_average
FROM defaultdb.talent_acquisition_final_data
WHERE min_salary IS NOT NULL AND max_salary IS NOT NULL
GROUP BY city
ORDER BY salary_average DESC
LIMIT 10;

-- 26. Offered Vacancies Number and Salary Average
SELECT job_title, COUNT(num_vacancies) AS vacancies_number, ROUND(AVG((min_salary + max_salary) / 2)) AS salary_average
FROM defaultdb.talent_acquisition_final_data
WHERE min_salary IS NOT NULL AND max_salary IS NOT NULL
GROUP BY job_title
ORDER BY vacancies_number DESC
LIMIT 15;
