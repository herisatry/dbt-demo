WITH CTE AS (
    select
        to_date(to_timestamp(event_time)) as event_date,
        temperature_k,
        pressure,
        humidity,
        weather
    from {{ source('demo', 'weather') }}
),

agg_table AS (
SELECT
event_date,
round(avg(temperature_k),2) as avg_temperature,
round(avg(pressure),2) as avg_pressure,
round(avg(humidity),2) as avg_humidity,
weather
FROM CTE
group by event_date , weather
qualify row_number() over( partition by event_date order by count(weather) desc) = 1
)

select * FROM agg_table