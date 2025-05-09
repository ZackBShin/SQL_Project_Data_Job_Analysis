/*
Question: What are the most in-demand skills for Data Analyst jobs?
-Join job postings to inner join table similar to query 2
-Identify the top 5 skills that are most in-demand for Data Analyst jobs
-Focus on all job postings, not just remote ones
*/

--Selecting the names of skills and the number of job postings associated with each skill
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
--Here we are joining the job postings fact table with the skills job dimension table to list out the skills associated with the job postings
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
