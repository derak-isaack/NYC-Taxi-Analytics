{{config(materilaized='table')}}
SELECT 
    dayname(tpep_pickup_datetime) AS pickup_day, 
    HOUR(tpep_pickup_datetime) AS pickup_hour,
    COUNT(passenger_count) AS pickup_count
FROM 
    {{ref("my_first_dbt_model")}}
GROUP BY 
    pickup_day, pickup_hour
ORDER BY 
    pickup_day, pickup_hour, pickup_count DESC 