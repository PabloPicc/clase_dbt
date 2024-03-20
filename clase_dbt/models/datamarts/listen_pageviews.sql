--Aggregation: number of listen events by city and state

{{config(materialized='table')}}

with agg_join as (

SELECT A.n_song,A.song,A.artist,A.state,A.city,
B.n_events,method

FROM {{ref('listen_agg_songs')}} as A
inner join {{ref('page_views_agg')}} as B
on A.city=B.city and A.state=B.state

)

SELECT * FROM agg_join
