{{config(materialized='table')}}
SELECT 
    DISTINCT(DOLocationID), 
    VendorID, 
    store_and_fwd_flag, 
    COUNT(*) AS totals, 
    dayname(tpep_pickup_datetime) AS pickup_day, 
    HOUR(tpep_pickup_datetime) AS pickup_hour
FROM 
    yellow_taxi_may
WHERE 
    store_and_fwd_flag = 'Y'
GROUP BY 
    VendorID, store_and_fwd_flag, DOLocationID, pickup_day, pickup_hour
ORDER BY 
    totals DESC