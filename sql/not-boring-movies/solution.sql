select id, movie, description, rating
from cinema
where description not like '%boring%' and mod(id, 2) = 1
order by rating desc