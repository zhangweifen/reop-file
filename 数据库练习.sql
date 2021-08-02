-- 数据库每日一练
-------------------------------------------------------------------------------------------
-- 0723
SELECT *FROM store WHERE code = 'K496'
SELECT *FROM goods WHERE name LIKE '%维他奶%'
-- 原始数据
IF OBJECT_ID('tempdb.dbo.#out') IS NOT NULL DROP TABLE #out
SELECT  adate,b.code,b.name,CAST(a.BGDGID AS VARCHAR(20)) BGDGID,a.DQ1,CAST(a.DT1 AS VARCHAR(12)) dt
INTO #out
FROM moutdrpt a (nolock),dbo.store b (nolock)
WHERE 1=1 
AND a.ADATE >'20200701'
AND a.ADate < '20200710'
AND a.AStore = b.gid
AND b.manager = '李群娣'
AND a.BgdGid = '1014687'
--AND a.BCSTGID = '999067830'
;
-- 要求
-- 
select code,COUNT(code),
       STUFF((select ','+ BGDGID from  #out  
           where c.code=code 
           for xml path('')),1,1,'') as CookNames   
from #out c   
group by c.code  
;

select ','+ BGDGID from  #out  
           for xml path('')

---------------------------------------------------------------------------------------------------
-- 0724 sql 经典面试50题
CREATE TABLE test_sql.test1 ( 
        userId string, 
        visitDate string,
        visitCount INT )
    ROW format delimited FIELDS TERMINATED BY "\t";
    INSERT INTO TABLE test_sql.test1
    VALUES
        ( 'u01', '2017/1/21', 5 ),
        ( 'u02', '2017/1/23', 6 ),
        ( 'u03', '2017/1/22', 8 ),
        ( 'u04', '2017/1/20', 3 ),
        ( 'u01', '2017/1/23', 6 ),
        ( 'u01', '2017/2/21', 8 ),
        ( 'u02', '2017/1/23', 6 ),
        ( 'u01', '2017/2/22', 4 );