/* number of dives by diver */
SELECT COUNT(diver_id) AS number_of_dives
FROM dives
WHERE diver_id = 1
GROUP BY diver_id;

/* average dive duration by location */
SELECT AVG(duration)::INT AS average_duration
FROM dives WHERE location_id = 1 GROUP BY location_id;

/* most active month */
SELECT DATE_TRUNC('month', dive_date) AS month, COUNT(*) AS dive_count
FROM dives
WHERE dive_date > NOW() - INTERVAL '1 year'
GROUP BY month
ORDER BY dive_count DESC LIMIT 1;
