{{ config(materialized="table") }}

with
    bike as (
        select distinct
            trip_id,
            date(started_at) as trip_date,
            start_station_id,
            end_station_id,
            user_type,
            DATEDIFF(second, started_at, ended_at) as trip_duration
        from {{ source("demo", "bike") }}
    )

select *
from bike
