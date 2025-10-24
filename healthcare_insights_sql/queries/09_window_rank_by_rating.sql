SELECT
    State,
    "Facility Name",
    "Hospital overall rating",
    RANK() OVER (
        PARTITION BY State
        ORDER BY "Hospital overall rating" DESC
    ) AS rating_rank
FROM 
    hospitals
WHERE 
    "Hospital overall rating" IS NOT NULL
ORDER BY 
    State, rating_rank;
