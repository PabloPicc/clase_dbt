--Aggregation: total time of song listening per city and per day

{{config(materialized='table')}}

with agg_list_2 as (

SELECT sum(duration) as total_duration,city,state,day

FROM {{ref('listen_staging')}}
group by city,state,mes,day
order by total_duration desc

)

SELECT * FROM agg_list_2
