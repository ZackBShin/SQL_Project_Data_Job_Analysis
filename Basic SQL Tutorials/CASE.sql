--6 Case Expression

SELECT
    COUNT(job_id) AS job_count,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'Philadelphia, PA' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category

/* 

Label new column as follows:
- 'Anywhere' as 'Remote'
- 'Philadelphia, PA' as 'Local'
- Otherwise 'Onsite'

*/