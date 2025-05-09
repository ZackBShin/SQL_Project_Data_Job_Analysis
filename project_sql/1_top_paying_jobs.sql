/*
Question: What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are availabel remoately.
-Focuses on job postings with specified salaries (removes nulls).
*/

SELECT
    job_id AS Id,
    job_title AS title,
    job_location AS location,
    job_schedule_type AS schedule,
    salary_year_avg AS salary,
    job_posted_date AS posted_date,
    name AS company_name
FROM
    job_postings_fact
--Here we are joining the job postings fact table with the company dimension table to list out the company name associated with the job postings
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
--Here we are filtering our tables to only include the job postings that are remote and are for data analyst roles
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Philadelphia, PA'  AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;