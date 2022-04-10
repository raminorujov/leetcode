CREATE FUNCTION getNthHighestSalary(N IN NUMBER) 
RETURN NUMBER 
IS
    result NUMBER;
BEGIN
    select 
    (
        select salary
        from (
            select rownum as rn, salary
            from (
                select salary, dense_rank() over(order by salary desc) as sal_rank
                from employee
            )
            where sal_rank = N
        )
        where rn = 1
    ) as NthHighestSalary
    into result
    from dual;    
    
    RETURN result;
END;