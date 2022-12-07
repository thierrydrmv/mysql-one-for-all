SELECT
    FORMAT(MIN(p.valor), 2) faturamento_minimo,
    FORMAT(MAX(p.valor), 2) faturamento_maximo,
    FORMAT(AVG(p.valor), 2) faturamento_medio,
    FORMAT(SUM(p.valor), 2) faturamento_total
FROM SpotifyClone.plano p
    JOIN SpotifyClone.usuario u ON u.plano_id = p.plano_id;