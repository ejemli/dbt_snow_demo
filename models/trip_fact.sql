with trips as (

    select
    ride_id,
    -- rideable_type,
    date(TO_TIMESTAMP(started_at)) as trip_date,
    start_statio_id as start_station_id,
    END_STATION_id,
    member_csual as member_casual,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    
    from {{ ref('stg_bike') }}

    WHERE RIDE_ID != '"bikeid"' and ride_id != 'bikeid'

    limit 10


)

select
*
from trips