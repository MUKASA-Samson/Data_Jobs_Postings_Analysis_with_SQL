/*
QUESTION: What are the most in demand skills for data analysts interested
          in working from home?
    -Identfy the top 5 in demand data analyst jobs skills.
    -Focus on all job postings
WHY? Highlighting the highly demanded data analysts skills to help-
individuals who want to move to data analysts role.
*/
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS skills_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY skills_count DESC
LIMIT 10;