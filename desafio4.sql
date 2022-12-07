SELECT
    u.nome usuario,
    IF(
        SUM(IF(YEAR(d.date) >= '2021', 1, 0)) > 0,
        'Usuário ativo',
        'Usuário inativo'
    ) status_usuario
FROM SpotifyClone.usuario u
    JOIN SpotifyClone.data_reproducao d ON u.usuario_id = d.usuario_id
GROUP BY d.usuario_id
ORDER BY nome;