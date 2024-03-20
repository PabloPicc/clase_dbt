--Staging: traemos solo lo que nos interesa, manipulamos las fechas

with listen_stage as (

SELECT ts,city,state,song,artist,duration,
to_timestamp(ts/1000)::date as fecha

FROM {{source('eventsim','listen_events')}}

)

SELECT ts,city,state,fecha,song,artist,duration,
extract(month from fecha) as mes,
extract(day from fecha) as day,
extract(year from fecha) as year
FROM listen_stage
