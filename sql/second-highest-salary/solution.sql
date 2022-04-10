select 
    (
        select salary
        from (
            select rownum as rn, salary
            from (
                select salary, dense_rank() over(order by salary desc) as sal_rank
                from employee
            )
            where sal_rank = 2
        )
        where rn = 1
    ) as SecondHighestSalary
from dual
