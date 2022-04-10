select email
from 
(
    select email, count(id)
    from person
    group by email
    having count(id) > 1
)
order by email