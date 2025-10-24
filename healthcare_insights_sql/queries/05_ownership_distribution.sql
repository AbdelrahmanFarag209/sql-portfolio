SELECT 
    "Hospital Ownership" AS ownership_type,
    COUNT(*) AS total_hospitals,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM hospitals), 2) AS percentage
FROM 
    hospitals
GROUP BY 
    "Hospital Ownership"
ORDER BY 
    total_hospitals DESC;

