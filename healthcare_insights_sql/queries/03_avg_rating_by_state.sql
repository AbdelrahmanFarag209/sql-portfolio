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
ORDER BY 
    avg_rating DESC;

