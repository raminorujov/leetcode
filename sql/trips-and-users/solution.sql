with data as (
    select t.*,
        case
            when t.status in ('cancelled_by_client', 'cancelled_by_driver') then 1
            else 0
        end is_cancelled
    from trips t join users c on t.client_id = c.users_id and c.role='client' and c.banned = 'No'
        join users d on t.driver_id = d.users_id and d.role='driver' and d.banned = 'No'
    where to_date(t.request_at, 'yyyy-mm-dd') between to_date('01.10.2013', 'dd.mm.yyyy') and to_date('03.10.2013', 'dd.mm.yyyy')
)
select d.request_at as "Day", round(sum(d.is_cancelled)/count(d.id), 2) as "Cancellation Rate"
from data d
group by d.request_at
order by d.request_at