SELECT
    a.nome artista,
    al.nome album,
    COUNT(s.usuario_id) seguidores
FROM SpotifyClone.artista a
    JOIN SpotifyClone.album al ON a.artista_id = al.artista_id
    JOIN SpotifyClone.seguindo s ON s.artista_id = al.artista_id
GROUP BY a.nome, al.nome
ORDER BY
    seguidores DESC,
    artista, album;