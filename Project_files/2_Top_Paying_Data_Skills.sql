/*
QUESTION: What are the skills required for top paying jobs?
    -Identfy the top 10 highest demanded data analyst jobs skills.
    -Focus on job postings with specified salaries (not nulls)
WHY? Highlighting the highly demanded data analysts skills alongside the salary for data analysts 
to help data analysts to make data driven decissions in job seeking.
*/
WITH top_paying_jobs AS
(
    SELECT
        Job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact AS jobs
    LEFT JOIN company_dim AS company ON jobs.company_id = company.company_id
    WHERE
        job_title_short ='Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg;