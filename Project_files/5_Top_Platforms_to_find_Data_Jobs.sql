/*
QUESTION: Where to find remote Data Analytics Jobs?
    - Identy top platforms that posted many Data Analytics jobs.
    - Focus on the remote jobs.
WHY? Highlighting the top platforms that post many Data Analytics jobs
     to help individuals who are looking for Data Analytics Jobs.
*/

SELECT 
		CASE
			WHEN job_via LIKE ('%Linked%') THEN 'LinkedIn'
			WHEN job_via NOT LIKE ('%Linked%') THEN TRIM(RIGHT(job_via,-3))
		END AS Platforms,
    COUNT (*) AS counts
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE
GROUP BY job_via
ORDER BY counts DESC
LIMIT 10;