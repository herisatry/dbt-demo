{{ config(materialized="table") }}

with
    bike as (
        select distinct
            start_station_id as station_id,
            start_station_name as station_name,
            start_latitude as latitude,
            start_longitude as longitude
        from {{ source("demo", "bike") }}
    )

select *
from bike
