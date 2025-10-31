WITH CTE AS (

select
 TO_TIMESTAMP(started_at) as started_at,
 DATE(TO_TIMESTAMP(started_at)) as date_started_at,
 HOUR(TO_TIMESTAMP(started_at)) as hour_started_at,
 
CASE 
WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat', 'Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS day_type,

CASE WHEN MONTH(TO_TIMESTAMP(started_at)) IN (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(started_at)) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS station_of_year

from
{{ source('demo', 'bike') }}
WHERE started_at != 'started_at'
)

select
*
from CTE