SELECT
        EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS est_year,
        EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS est_month,
        COUNT(job_id) AS job_count,
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM
        job_postings_fact
WHERE   
        EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') = 2023
        AND EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') BETWEEN '1' AND '12'
GROUP BY est_month, est_year, job_posted_date
ORDER BY est_month;