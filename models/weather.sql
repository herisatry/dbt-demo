{{
    config(
        materialized='table'
    )
}}

select *
from {{ source("demo", "weather") }}
;
