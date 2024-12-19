/*
QUESTION: What are the top paying jobs?
    -Identfy the top 10 highest paying data related jobs that are available remotely.
    -Focus on job postings with specified salaries (not nulls)
WHY? Highlighting the highest paying data jobs for data analysts.
*/
SELECT
    Job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact AS jobs
LEFT JOIN company_dim AS company ON jobs.company_id = company.company_id
WHERE
    job_title_short ='Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 30;