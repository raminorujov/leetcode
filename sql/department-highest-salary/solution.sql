select department, employee, salary
from (
    select * from (
        select d.name as department, e.name as employee, e.salary, 
            dense_rank() over(partition by e.departmentid order by e.salary desc) as sal_rank
        from employee e join department d on e.departmentid = d.id
    )
    where sal_rank = 1
)