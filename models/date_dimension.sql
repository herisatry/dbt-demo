with
    cte as (
        select 
        try_to_timestamp(started_at) as timestamp,
        DAYNAME(to_timestamp(started_at)) as day_name,
        CASE WHEN DAYNAME(to_timestamp(started_at)) in ('Sat','Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
            END AS day_type,
        MONTHNAME(to_timestamp(started_at)) event_month,
        CASE
            WHEN MONTH(to_timestamp(started_at)) in (12,1,2)
            THEN 'WINTER'
            WHEN MONTH(to_timestamp(started_at)) in (3,4,5)
            THEN 'SPRING'
            WHEN MONTH(to_timestamp(started_at)) in (6,7,8)
            THEN 'SUMMER'
            ELSE 'AUTUMN'
            END AS STATION_YEAR
        FROM {{ source("demo", "bike") }}
    )

select *
from cte
