INSERT INTO ecg-big-data.test_dataset.dim_accommodation_type (
  season, 
  accomm_type_code
)

-- Step 1: Create a single CTE with all unique code/season pairs

WITH AllSourcePairs AS (
  -- Get pairs from the sales table
  SELECT DISTINCT
    journey_accomm_code AS accomm_code,
    CAST(booking_season AS INT64) AS season
  FROM
    `ecg-big-data.merged_data.merged_sales`
  WHERE
  journey_accomm_code IS NOT NULL  and booking_season != "2027"
  
  UNION DISTINCT
  
  -- Add pairs from the occupancy table
  SELECT DISTINCT
    accomm_code,
    EXTRACT(YEAR FROM day) AS season
  FROM
    `ecg-big-data.merged_data.merged_occupancy`
  WHERE
  accomm_code IS NOT NULL  and ( EXTRACT(YEAR FROM day)  != 2027 )
)

-- Step 2: Find which pairs from the combined list do not exist

SELECT
  t1.season,         
  t1.accomm_code   
FROM
  AllSourcePairs AS t1
LEFT JOIN
  `ecg-big-data.test_dataset.dim_accommodation_type` AS t2
  ON t1.accomm_code = t2.accomm_type_code
  AND t1.season = t2.season

WHERE
  t2.accomm_type_code IS NULL -- This means no match was found
