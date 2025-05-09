--4 UPDATE TABLE

UPDATE job_applied
SET contact = 'Elrich Bachman'
WHERE job_id = 1; 

UPDATE job_applied
SET contact = 'Arion Farhi'
WHERE job_id = 2; 

UPDATE job_applied
SET contact = 'Savan Yalamanchili'
WHERE job_id = 3; 

UPDATE job_applied
SET contact = 'Katie McLaughlin'
WHERE job_id = 4; 

UPDATE job_applied
SET contact = 'Margaret Wu'
WHERE job_id = 5; 


SELECT *
FROM job_applied;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied 
DROP COLUMN contact_name;

DROP TABLE job_applied;