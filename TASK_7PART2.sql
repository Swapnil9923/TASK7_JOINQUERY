select * from matches

select * from players

select * from Records

_____1-Which players have an average number of sixes, a minimum number of fours greater than 22, and an average number of fifties, grouped by their name, team, and position?
	
select p.name,p.position,p.team, avg(sixes) as "avg_sixes",min(fours) as "min_fours",avg(fifty) as "avg_fifty"
from players as P inner join records as R on p.playerid=R.playerid
where fours>22
group by name,team,position




______2-What is the average run scored, maximum fifties, minimum fours, and average sixes by players grouped by name, team, position, and match ID for matches between July 21, 2024, and January 4, 2025?

select name,team,position,matchid,avg(runscored) as "avg_runscored", max(fifty) as "max_fifty",min(fours)as "min_fours",avg(sixes)as "avg_sixes"  from matches as M join records as R on m.playerid=R.playerid
inner join players as p on p.playerid=m.playerid
where matchdate between '2024-07-21' and '2025-01-04'
group by name,team,position,runscored, matchid


_____3-What are the maximum centuries, minimum sixes, total thirty-plus scores, and average fifties for each player (grouped by name and team) with more than 15 fours and an average of more than 20 sixes?

	
SELECT  p.name,p.team,MAX(hundreds) AS max_hundreds,MIN(sixes) AS min_sixes,SUM(thirtyplus_score) AS total_thirty, AVG(fifty) AS average_fifty
FROM players as P
JOIN records R ON p.playerid = R.playerid
WHERE fours >15
GROUP BY p.name, p.team
HAVING AVG(sixes)>20
