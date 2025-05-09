/*
Question: What are the most optimal skills to learn i.e. it is in high demand and high paying)
-Identify skills in high demand and associated with high average salaries
-Concentrates on remote positions with specified salaries
*/

--Problem 3, showing most in demand skills
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    --Here we are joining the job postings fact table with the skills job dimension table to list out the skills associated with the job postings
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE  
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
), skills_pay AS ( --Problem 4, showing top paying skills
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
)

--Motivation for this query is to find the most optimal skills to learn, i.e. it is in high demand and high paying
--We do this by joining the two queries above using a CTE method for each of the two queries

--Begin the main query:
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN skills_pay ON skills_demand.skill_id = skills_pay.skill_id
WHERE 
    demand_count > 15
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 50;