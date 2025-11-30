with
    init_cte as (
        select t.*, w.*
        from {{ ref("trip_fact") }} as t
        left join {{ ref("daily_weather") }} as w on t.trip_date = w.event_date
        where event_date is not null
    )

select *
from init_cte
