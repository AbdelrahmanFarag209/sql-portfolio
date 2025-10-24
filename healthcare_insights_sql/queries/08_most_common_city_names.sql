SELECT 
    "City/Town" AS city,
    State,
    COUNT(*) AS hospital_count
FROM 
    hospitals
GROUP BY 
    "City/Town", State
HAVING 
    COUNT(*) > 3
ORDER BY 
    hospital_count DESC;
