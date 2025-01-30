/*
QUESTION: What are the top 10 highly paying and in demand work from home Data Jobs?
    - Identfy the top 10 highest paying data related jobs that are available remotely.
    - Identfy the top 10 highly in demand data related jobs that are available remotely.
    - Focus on job postings with specified salaries (not nulls)
WHY? Highlighting the highest paying and demanded data jobs for individuals interested in
 joining data analytics.
*/
SELECT 
        DISTINCT(job_title_short),
        COUNT(*) AS Job_Counts,
        ROUND(AVG(salary_year_avg),0)AS Anual_avg_salary
FROM job_postings_fact
WHERE 
        salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
        AND job_work_from_home = TRUE
GROUP BY job_postings_fact.job_title_short
ORDER BY Anual_avg_salary DESC;
