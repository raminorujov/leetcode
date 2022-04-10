
select *
from 
(
    select 
        case
            when rn = 1 and mod(id,2) = 1 then id
            when rn != 1 and mod(id, 2) = 1 then id + 1
            else id - 1
        end as id, 
        student
    from (
        select 
            id,
            student,
            row_number() over(order by id desc) as rn
        from seat
    )
)
order by id