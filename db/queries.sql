/* number of dives by diver */
SELECT COUNT(diver_id) AS number_of_dives
FROM dives
WHERE diver_id = 1
GROUP BY diver_id;

/* average dive duration by location */
SELECT AVG(duration)
::INT AS average_duration
FROM dives WHERE location_id = 1 GROUP BY location_id;

/* most active month */
SELECT DATE_TRUNC('month', dive_date) AS month, COUNT(*) AS dive_count
FROM dives
WHERE dive_date > NOW() - INTERVAL
'1 year'
GROUP BY month
ORDER BY dive_count DESC LIMIT 1;

/* query the single deepest dive from a location, using a subquery */
/* concat the diver name and then call that field diver_name */
SELECT CONCAT(divers.first_name, ' ', divers.last_name) AS diver_name, dives.depth
FROM dives
  LEFT JOIN divers ON dives.diver_id = divers.id
WHERE dives.depth = (
  SELECT MAX(depth)
FROM dives
WHERE location_id = 1
);

/* query all the diver certification levels */
/* make sure each diver record we get is unique using DISTINCT */
/* we could also use GROUP BY here to get distinct entries */
SELECT DISTINCT dives.diver_id, certifications.name
from dives
  LEFT JOIN divers ON dives.diver_id = divers.id
  LEFT JOIN certifications ON divers.certification_id = certifications.id;


/* same query as above but using a CTE (common table expression) */
/* this query finds the most prevalent certification at a given dive loation */
WITH
  certs
  AS
  (
    SELECT DISTINCT dives.diver_id, certifications.name
    from dives
      LEFT JOIN divers ON dives.diver_id = divers.id
      LEFT JOIN certifications ON divers.certification_id = certifications.id
    WHERE dives.location_id = 1
    GROUP BY dives.diver_id, certifications.name
  )
SELECT name
FROM certs
GROUP BY name
ORDER BY COUNT(name) DESC
LIMIT 1;
