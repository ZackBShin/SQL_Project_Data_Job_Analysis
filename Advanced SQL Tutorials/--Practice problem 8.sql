--Practice problem 8


/* Find job postings from Q1 with a salary greater than 70,000
Combine job posting tables from Q1 2023
Gets job postings with an average yearly sal > 70,000
*/

SELECT
    q1_job_postings.job_title_short,
    q1_job_postings.job_location,
    q1_job_postings.job_via,
    q1_job_postings.job_posted_date::date,
    q1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS q1_job_postings

WHERE
    q1_job_postings.salary_year_avg > 70000 AND
    q1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    q1_job_postings.salary_year_avg DESC