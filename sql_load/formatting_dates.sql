--- in this example job_posted_date is a timestamp datatype

SELECT 
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS DATE_TIME ---  changing from time zone to another
FROM 
        job_postings_fact

SELECT 
        job_posted_date::DATE AS date    --- changing from  timestamp{date + time}  to  date
FROM    
        job_postings_fact

--- IF IN ANOTHER EXAMPLE DATE WAS STRING WITH INFO ABOUT DATE AND TIME ,THEN CONVERT TO TIME STAMP BY
SELECT  
        job_posted_date::TIMESTAMP AS DATE_TIME
FROM 
        job_postings_fact

--- EXTRACTING   SECOND  MINUTE  HOUR  DAY  MONTH  YEAR    FROM A TIMESTAMP

SELECT  
        extract (second from job_posted_date) AS minute
from job_postings_fact

SELECT  
        extract (minute from job_posted_date) AS minute
from job_postings_fact

SELECT  
        extract (hour from job_posted_date) AS minute
from job_postings_fact

SELECT  
        extract (day from job_posted_date) AS minute
from job_postings_fact

SELECT  
        extract (month from job_posted_date) AS minute
from job_postings_fact

SELECT  
        extract (year from job_posted_date) AS minute
from job_postings_fact
