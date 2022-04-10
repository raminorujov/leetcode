select distinct num as ConsecutiveNums
from
(
    select a.*, 
        lead(a.num, 1) over(order by a.id) as a1, 
        lead(a.num, 2) over(order by a.id) as a2
    from Logs a
)
where num = a1 and a1 = a2