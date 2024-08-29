/*
Question: what are top skills based on salary?
- look at average salary associated with each skill for DA positions
- reason: it helps job seekers to know skills associated with high salaries
*/

SELECT 
        skills,
        round(AVG (salary_year_avg),0) AS salary
FROM job_postings_fact      
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
GROUP BY skills
ORDER BY salary DESC
LIMIT 25