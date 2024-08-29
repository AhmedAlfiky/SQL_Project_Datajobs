/*
Question: what are the top-paying data analyst jobs?
- identify the top 10 highest-paying data analyst roles that are availble remotely.
- focuses om job postings with specified salaries (remove nulls).
- why? highlight the top-paying opportunities for data analysts, offering insights into employer
*/



SELECT 
        job_id,
        job_title,
        company_dim.name AS company_name,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date
FROM 
        job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere'
ORDER BY 
        salary_year_avg DESC
LIMIT 10;