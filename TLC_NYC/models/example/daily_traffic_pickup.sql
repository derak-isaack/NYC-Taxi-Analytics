{{config (materialized='table')}}
SELECT dayname(tpep_pickup_datetime) AS pickup_day, PULocationID, COUNT(passenger_count) AS pickup_count
FROM {{ref("my_first_dbt_model")}}
GROUP BY pickup_day, PULocationID
ORDER BY pickup_count DESC