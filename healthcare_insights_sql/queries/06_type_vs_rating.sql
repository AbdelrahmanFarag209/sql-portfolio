SELECT 
    "Hospital Type",
    ROUND(AVG("Hospital overall rating"), 2) AS avg_rating,
    COUNT(*) AS hospital_count
FROM 
    hospitals
WHERE 
    "Hospital overall rating" IS NOT NULL
GROUP BY 
    "Hospital Type"
ORDER BY 
    avg_rating DESC;
