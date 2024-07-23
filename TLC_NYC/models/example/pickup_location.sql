{{ config(materialized='table') }}
SELECT DISTINCT(PULocationID), SUM(passenger_count) AS total_passengers
FROM {{ ref('my_first_dbt_model') }}
GROUP BY PULocationID
ORDER BY total_passengers DESC