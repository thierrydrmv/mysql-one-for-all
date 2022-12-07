SELECT
    COUNT(u.nome) quantidade_musicas_no_historico
FROM SpotifyClone.seguindo s
    JOIN SpotifyClone.usuario u ON s.usuario_id = u.usuario_id
GROUP BY u.nome
HAVING
    u.nome = "Barbara Liskov";