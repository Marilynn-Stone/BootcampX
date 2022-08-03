WITH total_cohort_duration AS
(SELECT cohorts.name AS cohort, SUM(completed_at - started_at) AS total_duration
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
GROUP BY cohorts.name)
SELECT AVG(total_duration) AS average_total_duration
FROM total_cohort_duration;