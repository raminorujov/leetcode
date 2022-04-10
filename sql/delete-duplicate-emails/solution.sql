delete 
from person p
where exists (   
    select 1
    from (
        select id, email, row_number() over(partition by email order by id) as email_rank
        from person
    )
    where email_rank > 1 and id = p.id
)