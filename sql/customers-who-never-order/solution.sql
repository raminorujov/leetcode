select c.name as Customers
from customers c
where not exists (
    select 1
    from orders o
    where o.customerid = c.id
)
order by c.name