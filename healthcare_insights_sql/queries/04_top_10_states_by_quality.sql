SELECT 
    State,
    ROUND(AVG("Hospital overall rating"), 2) AS avg_rating,
    COUNT(*) AS num_hospitals
FROM 
    hospitals
WHERE 
    "Hospital overall rating" IS NOT NULL
GROUP BY 
    State
HAVING 
    COUNT(*) > 5  -- ignore states with too few hospitals
ORDER BY 
    avg_rating DESC
LIMIT 10;
