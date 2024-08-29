/*
Question:what are the most optimum skills to learn
reason: identify skills with high stability and financial benefits as well
*/

WITH skills_demand AS(
SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        COUNT(*) AS demand_count

FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND 
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL

GROUP BY skills_dim.skill_id
), 



 skills_pay AS(
    SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        round(AVG (salary_year_avg),0) AS salary

FROM job_postings_fact      

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE

GROUP BY skills_dim.skill_id
)

SELECT 
        skills_demand.skill_id,
        skills_demand.skills,
        salary,
        demand_count
FROM   skills_demand
INNER JOIN skills_pay  ON skills_demand.skill_id = skills_pay.skill_id
WHERE demand_count > 10
ORDER BY  salary DESC,demand_count DESC
LIMIT 25

-- writing same query more precisely

SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        round(AVG (salary_year_avg),0) AS salary,
        COUNT(job_postings_fact.job_id) AS demand_count
FROM   job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE 
GROUP BY skills_dim.skill_id
HAVING COUNT(job_postings_fact.job_id) > 10
ORDER BY  salary DESC,demand_count DESC
LIMIT 25