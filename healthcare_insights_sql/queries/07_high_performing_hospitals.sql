SELECT 
    "Facility Name",
    "City/Town",
    State,
    "Hospital Type",
    "Hospital Ownership",
    "Hospital overall rating"
FROM 
    hospitals
WHERE 
    "Hospital overall rating" = 5
ORDER BY 
    State, "City/Town";
