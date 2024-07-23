
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}
select CONCAT(PULocationID, '-', DOLocationID) AS route, tip_amount, fare_amount, passenger_count, payment_type, 
                        trip_distance, store_and_fwd_flag, extra
from {{ ref('my_first_dbt_model') }}
ORDER BY tip_amount DESC

