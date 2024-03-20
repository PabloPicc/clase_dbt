--Aggregation: GET and POST methods by city and state

{{config(materialized='table')}}

with agg_page as (

SELECT count(*) as n_events,method,city,state

FROM {{ref('page_view_staging')}}
group by method,city,state
order by n_events desc

)

SELECT * FROM agg_page
