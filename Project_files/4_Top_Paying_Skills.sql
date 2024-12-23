/*
QUESTION: What are the top skills based on salary?
    -look at the avg salary associated with each skill for Data Analyst positions
    -focuses of rows with specified salaries, regardless of location
WHY? it reveals how different skills impact salary levels for Data Analysts 
and helps to identify the most financially rewarding skills to acquire or improve.
*/
--I WILL USE WINDOW FUNCTION TO MAKE THIS MORE CLEARER
SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY salary_avg DESC
LIMIT 25;