
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
-- models/green_taxi_renamed_columns.sql
select
  '1' as vendorID,
  '2' as pickup_daytime,
  '3' as dropoff_daytime,
  '4' as passenger_count,
  '5' as Trip_distance,
  '6' as RateCodeID,
  '7' as store_and_forward,
  '8' as PULocationID,
  '9' as DOLocationID,
  '10' as payment_type,
  '11' as Fare_amount,
  '12' as Extra,
  '13' as MTA_tax,
  '14' as trip_amount,
  '15' as Tolls_amount,
  '16' as improovement_surchage,
  '17' as Total_amount,
  '18' as congestion_surchage,
  '19' as airport_fee 
from yellow_taxi_jan


/*
    Uncomment the line below to remove records with null `id` values
*/

 where VendorID is not null
