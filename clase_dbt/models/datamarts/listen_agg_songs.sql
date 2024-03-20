--Aggregation: number of listen events by city and state

{{config(materialized='table')}}

with agg_list_1 as (

SELECT count(*) as n_song,song,artist,city,state

FROM {{ref('listen_staging')}}
group by song,artist,city,state
order by n_song desc

)

SELECT * FROM agg_list_1
