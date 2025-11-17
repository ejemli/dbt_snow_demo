WITH CTE AS (

select
 TO_TIMESTAMP(started_at) as started_at,
 DATE(TO_TIMESTAMP(started_at)) as date_started_at,
 HOUR(TO_TIMESTAMP(started_at)) as hour_started_at,

{{day_type('started_at')}} AS day_type,

{{get_season('started_at')}} AS station_of_year

from
{{ ref('stg_bike') }}
WHERE started_at != 'started_at'
)

select
*
from CTE