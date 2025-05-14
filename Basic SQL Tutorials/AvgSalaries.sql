SELECT DISTINCT
    job_schedule_type AS schedule,
    AVG(salary_year_avg) AS annual_salary,
    AVG(salary_hour_avg) AS hourly_salary
FROM
    job_postings_fact
WHERE   
    job_posted_date > '01-06-2023'
--     AND salary_year_avg IS NOT NULL
GROUP BY
    job_schedule_type
ORDER BY
    AVG(salary_year_avg);