{{
    config(
        materialized='table'
    )
}}

WITH BIKE AS (
    select
    distinct
    start_station_id as station_id,
    start_station_name as station_name,
    start_latitude as latitude,
    start_longitude as longitude
    FROM {{ source('demo', 'bike') }}
)

SELECT * FROM BIKE