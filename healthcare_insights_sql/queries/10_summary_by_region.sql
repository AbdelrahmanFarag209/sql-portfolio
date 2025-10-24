WITH region_map AS (
    SELECT 
        State,
        CASE 
            WHEN State IN ('ME', 'NH', 'VT', 'MA', 'RI', 'CT', 'NY', 'NJ', 'PA') THEN 'Northeast'
            WHEN State IN ('IL', 'IN', 'MI', 'OH', 'WI', 'IA', 'KS', 'MN', 'MO', 'NE', 'ND', 'SD') THEN 'Midwest'
            WHEN State IN ('DE', 'FL', 'GA', 'MD', 'NC', 'SC', 'VA', 'DC', 'WV', 'AL', 'KY', 'MS', 'TN') THEN 'South'
            WHEN State IN ('AZ', 'CO', 'ID', 'MT', 'NV', 'NM', 'UT', 'WY', 'AK', 'CA', 'HI', 'OR', 'WA') THEN 'West'
            ELSE 'Other'
        END AS region
    FROM 
        hospitals
    GROUP BY 
        State
),
region_summary AS (
    SELECT 
        r.region,
        ROUND(AVG(h."Hospital overall rating"), 2) AS avg_rating,
        COUNT(*) AS hospital_count
    FROM 
        hospitals h
    JOIN 
        region_map r ON h.State = r.State
    WHERE 
        h."Hospital overall rating" IS NOT NULL
    GROUP BY 
        r.region
)
SELECT 
    region,
    hospital_count,
    avg_rating
FROM 
    region_summary
ORDER BY 
    avg_rating DESC;

