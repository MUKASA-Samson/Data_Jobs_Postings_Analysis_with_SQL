/*
QUESTION: What are the top paying skills for Data Analysts looking for remote jobs?
    - Look at the avg salary associated with each skill for Data Analyst positions
    - Focuses on rows with specified salaries
    - Focuses on skills that are mentioned at least 10 times
WHY? It reveals how different skills impact salary levels for Data Analysts 
and helps to identify the most financially rewarding skills to acquire or improve.
*/

WITH Top_Paying_Skills AS
(
    SELECT
    skills_dim.skill_id,
    skills,
    COUNT(skills_dim.skill_id) AS Skill_Counts,
    ROUND(AVG(salary_year_avg)) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' 
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills,
    skills_dim.skill_id
ORDER BY salary_avg DESC
)
SELECT 
    Top_Paying_Skills.skills,
    Top_Paying_Skills.Skill_Counts,
    salary_avg
FROM Top_Paying_Skills
INNER JOIN skills_dim ON Top_Paying_Skills.skill_id = skills_dim.skill_id
WHERE Skill_Counts > 10
ORDER BY salary_avg DESC
LIMIT 20;