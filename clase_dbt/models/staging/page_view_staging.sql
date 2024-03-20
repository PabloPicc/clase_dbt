--Staging: traemos solo lo que nos interesa, manipulamos las fechas

with stage_page as (

SELECT ts,city,state,method,
to_timestamp(ts/1000)::date as fecha

FROM {{source('eventsim','page_view_events')}}

)

SELECT ts,city,state,method,fecha,
extract(month from fecha) as mes,
extract(day from fecha) as day,
extract(year from fecha) as year
FROM stage_page
