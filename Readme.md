
## <div style="padding: 35px;color:white;margin:10;font-size:200%;text-align:center;display:fill;border-radius:10px;overflow:hidden;background-image: url(https://images.pexels.com/photos/7078619/pexels-photo-7078619.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1)"><b><span style='color:black'><strong> NEW YORK CITY TLC TAXI DATA PIPELINE  </strong></span></b> </div> 

![dbt](https://img.shields.io/badge/dbt-FF694B?logo=dbt&logoColor=fff&style=for-the-badge)
![Duckdb](https://img.shields.io/badge/DuckDB-FFF000?logo=duckdb&logoColor=000&style=for-the-badge)


### <div style="padding: 20px;color:white;margin:10;font-size:90%;text-align:left;display:fill;border-radius:10px;overflow:hidden;background-image: url(https://w0.peakpx.com/wallpaper/957/661/HD-wallpaper-white-marble-white-stone-texture-marble-stone-background-white-stone.jpg)"><b><span style='color:black'> Project Overview</span></b> </div>

This is an ETL(`Extract-Transform-Load`) data pipeline using `DUCKDB` for extraction & loading and `DBT` for transformation. The data to be transformed is from the [NYC-TLC-website](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page#:~:text=Yellow%20and%20green%20taxi%20trip,and%20driver%2Dreported%20passenger%20counts.) for the month of May 2024. The data columns description can be found [here](data_dictionary_trip_records_green.pdf). 

### <div style="padding: 20px;color:white;margin:10;font-size:90%;text-align:left;display:fill;border-radius:10px;overflow:hidden;background-image: url(https://w0.peakpx.com/wallpaper/957/661/HD-wallpaper-white-marble-white-stone-texture-marble-stone-background-white-stone.jpg)"><b><span style='color:black'> Objectives</span></b> </div>

The transformation objectives include building various transformation models for further analysis. 

1. `Route traffic model` using the `Pick-Up` & `Drop-off` locations. 

2. `Hourly daily Server outage model` using the `Drop-Off` location. Look for `drop off` locations that are prone to server outages in terms of sending trip detals to the server. They are marked as `N`. This is for analysis to get which hours of the day are mostly affected by severe server outages and might need further action. 

3. `Tip amount model`. Analyze the tips by different customers to different vendors. 

4. `Daily-hourly traffic model`. Model to analyze passenger count for `every 24hrs per day` for further passenger trend analysis. 

5. `Pick-up trend model` for assesing passenger counts in various pick up locations. 

### <div style="padding: 20px;color:white;margin:10;font-size:90%;text-align:left;display:fill;border-radius:10px;overflow:hidden;background-image: url(https://w0.peakpx.com/wallpaper/957/661/HD-wallpaper-white-marble-white-stone-texture-marble-stone-background-white-stone.jpg)"><b><span style='color:black'> Data Extraction & Loading</span></b> </div>

For the data extraction, [DuckDB](https://duckdb.org/docs/data/parquet/overview) has extensive options for performing `data extraction` explicitly. Of importance is to use the `fetch_df()` in the `SQL` queries when seeking to find the data structure and format. How the final transformation models would look like can be found [here](taxi.ipynb). 

[DuckDB](https://duckdb.org/docs/installation/index?version=stable&environment=cli&platform=win&download_method=package_manager) will also be used for Loading the transformed data in table formart as will be defined in the `transformation models` using the `{{config(materialized='table')}} command. 

### <div style="padding: 20px;color:white;margin:10;font-size:90%;text-align:left;display:fill;border-radius:10px;overflow:hidden;background-image: url(https://w0.peakpx.com/wallpaper/957/661/HD-wallpaper-white-marble-white-stone-texture-marble-stone-background-white-stone.jpg)"><b><span style='color:black'> Data Transformation</span></b> </div>

For the transformation, [DBT](https://docs.getdbt.com/docs/introduction)(Data Build Tool) comes in very handy in handling the transformation logic using the normal `SQL` syntax. The [transformation-models](TLC_NYC/models) are all chained to the first model for further analysis of the data. 

To initialize a `DBT project` together with `DuckDB OLAP database`, the following commands are to be performed in order.

* `pip install dbt-duckdb`

* `dbt init`

* `dbt debug` to test that everything is working fine before proceeding. 

* `dbt run` after defining the transformation models. Incase of any error the `logs` should be checked. 

For a succesfull dbt model, the following should be printed on the terminal:

![dbt-final-screenshot](<dbt screenshot.png>)