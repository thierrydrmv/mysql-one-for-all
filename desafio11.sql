SELECT
    c1.nome nome_musica,
    CASE
        WHEN c2.nome LIKE '%Bard%' THEN
        REPLACE
(c2.nome, 'Bard', 'QA')
            WHEN c2.nome LIKE '%Amar%' THEN
        REPLACE
(c2.nome, 'Amar', 'Code Review')
            WHEN c2.nome LIKE '%Pais%' THEN
        REPLACE
(
                c2.nome,
                'Pais',
                'Pull Requests'
            )
            WHEN c2.nome LIKE '%SOUL%' THEN
        REPLACE
(c2.nome, 'SOUL', 'CODE')
            WHEN c2.nome LIKE '%SUPERSTAR%' THEN
        REPLACE
(
                c2.nome,
                'SUPERSTAR',
                'SUPERDEV'
            )
            ELSE c2.nome = NULL
    END novo_nome
FROM SpotifyClone.cancao c1
    INNER JOIN SpotifyClone.cancao c2 ON c1.cancao_id = c2.cancao_id
WHERE
    c2.nome LIKE '%Bard%'
    OR c2.nome LIKE '%Amar%'
    OR c2.nome LIKE '%Pais%'
    OR c2.nome LIKE '%SOUL%'
    OR c2.nome LIKE '%SUPERSTAR%'
ORDER BY nome_musica DESC;