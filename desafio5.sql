SELECT
    c.nome cancao,
    COUNT(d.cancao_id) reproducoes
FROM SpotifyClone.cancao c
    JOIN SpotifyClone.data_reproducao d ON c.cancao_id = d.cancao_id
GROUP BY c.cancao_id
ORDER BY
    reproducoes DESC,
    cancao
LIMIT 2;