
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
  '6' as PULocationID,
  '7' as DOLocationID,
  '8' as RateCodeID,
  '9' as store_and_forawd,
  '10' as payment_type,
  '11' as Fare_amount,
  '12' as Extra,
  '13' as MTA_tax,
  '14' as improovement_surchage,
  '15' as Trip_amount,
  '16' as Tolls_amount,
  '17' as Tolls_amount,
  '18' as Total_amount,
  '19' as congestion_surcharge
from {{ ref('green_taxi') }}


/*
    Uncomment the line below to remove records with null `id` values
*/

 where VendorID is not null
