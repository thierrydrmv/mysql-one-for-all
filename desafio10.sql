SELECT
    c.nome nome,
    COUNT(d.cancao_id) reproducoes
FROM SpotifyClone.cancao c
    JOIN SpotifyClone.data_reproducao d ON c.cancao_id = d.cancao_id
    JOIN SpotifyClone.usuario u ON d.usuario_id = u.usuario_id
    JOIN SpotifyClone.plano p ON u.plano_id = p.plano_id
GROUP BY
    c.nome,
    u.plano_id,
    p.tipo
HAVING
    p.tipo = 'gratuito'
    OR p.tipo = 'pessoal'
ORDER BY c.nome;