SELECT
    c.nome nome,
    COUNT(d.cancao_id) reproducoes
FROM SpotifyClone.cancao c
    JOIN SpotifyClone.data_reproducao d ON c.cancao_id = d.cancao_id
    JOIN SpotifyClone.usuario u ON d.usuario_id = u.usuario_id
GROUP BY c.nome, u.plano_id
HAVING
    u.plano_id = 1
    OR u.plano_id = 4
ORDER BY c.nome;