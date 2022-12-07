SELECT
    a.nome artista,
    al.nome album
FROM SpotifyClone.artista a
    JOIN SpotifyClone.album al ON a.artista_id = al.artista_id
GROUP BY a.nome, al.nome
HAVING a.nome = "Elis Regina"
ORDER BY album;