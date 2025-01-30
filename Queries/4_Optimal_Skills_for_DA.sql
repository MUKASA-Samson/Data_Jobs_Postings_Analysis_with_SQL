/*
QUESTION: What are the most optimal skills to learn based on their demand and high salary?
    - Identify high skills in demand and avg salary for Data Analysts
    - Focuses on remote jobs with specified salary
WHY? Targets skills that has high security (high demand) and financial benefits (high average salary)
offering strategic insights for career development in data analytics.
*/
WITH skills_demand AS
(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.skill_id) AS skills_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND
        job_postings_fact.salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE 
    GROUP BY 
         skills_dim.skill_id,
         skills_dim.skills
), average_salary AS
(
    SELECT
        skills_job_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg)) AS salary_avg
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND
        job_postings_fact.salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_job_dim.skill_id,
        skills_dim.skills
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_count,
    salary_avg
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY 
    skills_count DESC, 
    salary_avg DESC
LIMIT 30;