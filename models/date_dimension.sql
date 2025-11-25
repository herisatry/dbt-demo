{{
    config(
        materialized='table'
    )
}}

with
    cte as (
        SELECT 
        try_to_timestamp(started_at) as event_timestamp,
        DAYNAME(to_timestamp(started_at)) as day_name,
        {{date_type('started_at')}} as date_type,
        MONTHNAME(to_timestamp(started_at)) event_month,
        {{station_year('started_at')}} as season_year

        FROM {{ source("demo", "bike") }}
    )

select *
from cte
