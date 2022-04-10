select score, rank
from (
    select s.id, s.score, dense_rank() over(order by s.score desc) rank
    from Scores s
)
order by rank