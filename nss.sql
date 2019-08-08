--###  NSS Tutorial

--# 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'
--# 2
SELECT institution , subject
  FROM nss
  WHERE question='Q15'
    AND score >= 100
--# 3
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50
--# 4
SELECT subject , SUM(response)
  FROM nss
  WHERE question='Q22'
  GROUP BY subject
    HAVING subject='(8) Computer Science'
        OR subject='(H) Creative Arts and Design'
--# 5
SELECT subject , SUM(A_STRONGLY_AGREE*response/100)
  FROM nss
  WHERE question='Q22'
  GROUP BY subject
    HAVING subject='(8) Computer Science'
        OR subject='(H) Creative Arts and Design'
--# 6
SELECT subject , ROUND(SUM(A_STRONGLY_AGREE*response) / SUM(response) )
  FROM nss
  WHERE question='Q22'
  GROUP BY subject
    HAVING subject='(8) Computer Science'
        OR subject='(H) Creative Arts and Design'
--# 7
SELECT institution , ROUND(SUM(score*response) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
 GROUP BY institution
--# 8
SELECT institution , SUM(sample) , SUM(CASE WHEN subject = '(8) Computer Science' THEN sample END) AS comp
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
   # AND subject = '(8) Computer Science'
   GROUP BY institution


