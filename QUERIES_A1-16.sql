 
SELECT  POSITIONHOLD.PLAYERID, POSITION.PTYPE AS POSITIONPLAYED
FROM POSITIONHOLD, POSITION
WHERE POSITIONHOLD.PLAYERID=(SELECT PLAYERID
                              FROM PLAYER
                              WHERE PFIRSTNAME = 'KEANU') 
 AND POSITION.POSITIONID = POSITIONHOLD.POSITIONID;





SELECT RC.*
FROM (SELECT TEAMID, COUNT(TEAMID) AS MATCHESVONED
      FROM GAME G
      GROUP BY TEAMID
      )RC JOIN 
      (SELECT MAX(MATCHESVONED) AS MAXCNT
       FROM(SELECT TEAMID, COUNT(TEAMID) AS MATCHESVONED
            FROM GAME
            GROUP BY TEAMID
            ) RC
      )M 
    ON RC.MATCHESVONED=M.MAXCNT; 


SELECT T.TEAMID, T.TNAME, C.MATCHESVONED 
FROM TEAM T
INNER JOIN (SELECT TEAMID, COUNT(TEAMID) AS MATCHESVONED
            FROM GAME 
            GROUP BY TEAMID
            ORDER BY MATCHESVONED DESC
            ) C ON T.TEAMID = C.TEAMID;

                

                        
SELECT PERFORMANCE.GAMEID, GAME.GAMENAME, GAME.GAMEPLACE, GAME.GAMEDATE, PERFORMANCE.FOULS
FROM GAME 
INNER JOIN(SELECT GAMEID, FOULS
FROM PERFORMANCE 
WHERE FOULS>10) PERFORMANCE ON GAME.GAMEID=PERFORMANCE.GAMEID
ORDER BY GAME.GAMEDATE;


  
SELECT EXPERIENCE.PLAYERID, PLAYER.PFIRSTNAME||PLAYER.PLASTNAME AS NAME, EXPERIENCE.TOTALGAMES 
FROM EXPERIENCE, PLAYER
WHERE EXPERIENCE.TOTALGAMES = (SELECT MAX(TOTALGAMES) FROM EXPERIENCE) 
AND EXPERIENCE.PLAYERID = PLAYER.PLAYERID;

  

 
SELECT P.PLAYERID, P.PFIRSTNAME||P.PLASTNAME AS NAME, G.GAMEID, G.TEAMID
FROM PLAYER P
INNER JOIN (SELECT GAMEID, TEAMID, PLAYERID 
FROM GAMEPLIST
                  WHERE GAMEID=
                               (SELECT GAMEID
                               FROM GAME
                               WHERE GameNAME = 'OURGAME')) G ON P.PLAYERID=G.PLAYERID;



 SELECT PERFORMANCE.PLAYERID,  PLAYER.PFIRSTNAME||PLAYER.PLASTNAME AS NAME, PLAYER.PDOB AS DATEBIRTH, PLAYER.PWHEIGHT AS WEIGHT, 
 PLAYER.PHAIGHT AS HEIGHT, PLAYER.TEAMID AS TEAM, PERFORMANCE.TOTALP AS POINTSSCORED
 FROM PERFORMANCE, PLAYER
 WHERE PERFORMANCE.TOTALP = (SELECT MAX(TOTALP) FROM PERFORMANCE
                               WHERE SEASONID = 1)
 AND PLAYER.PLAYERID=PERFORMANCE.PLAYERID;



