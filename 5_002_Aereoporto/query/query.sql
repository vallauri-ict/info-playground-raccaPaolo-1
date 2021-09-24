/*	Città di partenza distinte e in ordine alfabetico	*/
SELECT DISTINCT v.CittaPartenza
FROM Volo v
WHERE v.cittaArrivo = 'Roma'
ORDER BY v.CittaPartenza;

/*	Città con aereoporto con numero di piste ignoto	*/
SELECT DISTINCT a.Citta
FROM Aeroporto a
WHERE a.NumPiste IS NULL;

/*	Per ogni volo misto (sia merci che passeggeri): codice volo e dati di trasporto	*/

SELECT v.IdVolo, a.QtaMerci, a.NumPasseggeri
FROM Aereo a, Volo v
WHERE a.TipoAereo = v.TipoAereo AND a.NumPasseggeri > 0 AND a.QtaMerci > 0;