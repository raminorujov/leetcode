select id from (
    select w.id, w.recorddate, w.temperature, 
        lag(w.temperature, 1) over(order by recorddate) as prev_temp,
        lag(w.recorddate, 1) over(order by recorddate) as prev_date
    from Weather w
)
where temperature > prev_temp and  recorddate - prev_date = 1