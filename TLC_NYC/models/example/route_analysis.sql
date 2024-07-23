{{config(materialzed= 'table')}}
SELECT DISTINCT CONCAT(PULocationID, '-', DOLocationID) AS route, SUM(passenger_count) AS total_passengers, VendorID
FROM {{ref("my_first_dbt_model")}}
GROUP BY route, VendorID
ORDER BY total_passengers DESC