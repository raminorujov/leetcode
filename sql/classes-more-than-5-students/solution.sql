select class from (
    select class, count(distinct student)
    from courses
    group by class
    having count(distinct student) >= 5
)