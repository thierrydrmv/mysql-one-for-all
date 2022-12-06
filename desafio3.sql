SELECT
    u.nome usuario,
    COUNT(*) qt_de_musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos) / 60, 2) total_minutos
FROM SpotifyClone.usuario u
    JOIN SpotifyClone.data_reproducao d ON u.usuario_id = d.usuario_id
    JOIN SpotifyClone.cancao c ON c.cancao_id = d.cancao_id
GROUP BY u.usuario_id
ORDER BY usuario;