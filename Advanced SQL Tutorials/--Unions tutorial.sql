-- 8 Unions tutorial


SELECT
    job_title_short,
    company_id,
    job_location
FROM january_jobs
--Union adds the rows of both tables into a joined table
--Union skips duplicate values
UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs
-- Union All adds every value, even duplicates
UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs


--Practice problem
/*get the corresponding skill and skill type for each job posting in Q1
include those without any skills as well
why? look at the skills and the type for each job in Q1 with a salary >70,000
*/


WITH q1_job_postings AS (
    SELECT *
    FROM january_jobs
        UNION ALL
    SELECT *
    FROM february_jobs
        UNION ALL
    SELECT *
    FROM march_jobs

    
)

SELECT q1_job_postings.job_id,
    q1_job_postings.job_title_short AS job_name,
    q1_job_postings.salary_year_avg AS salary,
    skills_to_job.skill_id,
    skills.skills AS skill_name
FROM 
    q1_job_postings
LEFT JOIN
    skills_job_dim AS skills_to_job ON q1_job_postings.job_id = skills_to_job.job_id
LEFT JOIN
    skills_dim AS skills ON skills.skill_id = skills_to_job.skill_id
WHERE 
    salary_year_avg > 70000

ORDER BY
    q1_job_postings.salary_year_avg