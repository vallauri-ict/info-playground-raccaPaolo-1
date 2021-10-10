SELECT Targa,Marca FROM Automobile
WHERE Potenza>120 OR Cilindrata>2000;

SELECT Nome,Marca FROM Automobile, Proprietario
WHERE Proprietario.CodF=Automobile.CodF AND Potenza>120 OR Cilindrata>2000;

SELECT p.Nome,Targa FROM Automobile, Proprietario p, Assicurazione a
WHERE p.CodF=Automobile.CodF AND Automobile.CodAss=a.CodAss
AND (Potenza>120 OR Cilindrata>2000) AND a.Nome='Sara';

SELECT DISTINCT p.Nome,au.Targa FROM Automobile au, Proprietario p, Assicurazione a, Sinistro s, AutoCoinvolta
WHERE p.CodF=au.CodF AND au.CodAss=a.CodAss AND s.CodS=AutoCoinvolta.CodS AND AutoCoinvolta.Targa=au.Targa
AND s.Data='2002-01-20' AND a.Nome='Sara'

SELECT ass.Nome, ass.Sede, COUNT(*) as NumAuto
FROM Assicurazione ass, Automobile Au
WHERE Au.CodAss = ass.CodAss
GROUP BY ass.CodAss, ass.Nome, ass.Sede

SELECT au.Targa, COUNT(*) as Incidenti FROM Automobile au, AutoCoinvolta aut WHERE au.Targa=aut.Targa
AND au.Marca='FIAT' GROUP BY au.Targa

SELECT au.Targa, ass.Nome, SUM(aut.ImportoDelDanno) Incidenti FROM Automobile au, AutoCoinvolta aut, Assicurazione ass WHERE au.Targa = aut.Targa AND au.CodAss = ass.CodAss
GROUP BY au.Targa, ass.Nome HAVING COUNT(*) > 1;

SELECT p.CodF, p.Nome FROM Proprietario p, Automobile au WHERE p.CodF = au.CodF 
GROUP BY p.CodF, p.Nome HAVING COUNT(*)>1

SELECT au.Targa FROM Automobile au WHERE au.Targa NOT IN
	(SELECT auc.Targa FROM AutoCoinvolta auc, Sinistro s 
	WHERE auc.CodS=s.CodS AND s.Data>'20010120'
	)

SELECT s.CodS FROM Sinistro s WHERE NOT EXISTS (SELECT * FROM AutoCoinvolta aut, Automobile au WHERE au.Targa = aut.Targa AND aut.CodS = s.CodS AND au.Cilindrata < 2000)