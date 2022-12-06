DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE
    SpotifyClone.plano(
        plano_id INT PRIMARY KEY AUTO_INCREMENT,
        tipo VARCHAR(255) NOT NULL,
        valor DOUBLE NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.usuario(
        usuario_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        idade INT NOT NULL,
        data_assinatura DATE NOT NULL,
        plano_id INT,
        FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artista(
        artista_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.seguindo(
        usuario_id INT,
        artista_id INT,
        PRIMARY KEY(usuario_id, artista_id),
        FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
        FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.album(
        album_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(25) NOT NULL,
        artista_id INT,
        FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.cancao(
        cancao_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        duracao_segundos INT NOT NULL,
        album_id INT,
        FOREIGN KEY (album_id) REFERENCES album(album_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.data_reproducao(
        historico_id INT NOT NULL,
        date DATETIME NOT NULL,
        usuario_id INT,
        FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
        cancao_id INT,
        FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id),
        PRIMARY KEY(
            historico_id,
            usuario_id,
            cancao_id
        )
    ) engine = InnoDB;

INSERT INTO plano
VALUES (1, 'gratuito', 0), (2, 'familiar', 7.99), (3, 'universitário', 5.99), (4, 'pessoal', 6.99);

INSERT INTO usuario
VALUES (
        1,
        'Barbara Liskov',
        82,
        '2019-10-20',
        1
    ), (
        2,
        'Robert Cecil Martin',
        58,
        '2017-01-06',
        1
    ), (
        3,
        'Ada Lovelace',
        37,
        '2017-12-30',
        2
    ), (
        4,
        'Martin Fowler',
        46,
        '2017-01-17',
        2
    ), (
        5,
        'Sandi Metz',
        58,
        '2018-04-29',
        2
    ), (
        6,
        'Paulo Freire',
        19,
        '2018-02-14',
        3
    ), (
        7,
        'Bell Hooks',
        26,
        '2018-01-05',
        3
    ), (
        8,
        'Christopher Alexander',
        85,
        '2019-06-05',
        4
    ), (
        9,
        'Judith Butler',
        45,
        '2020-05-13',
        4
    ), (
        10,
        'Jorge Amado',
        58,
        '2017-02-17',
        4
    );

INSERT INTO artista
VALUES (1, 'Beyoncé'), (2, 'Queen'), (3, 'Elis Regina'), (4, 'Baco Exu do Blues'), (5, 'Blind Guardian'), (6, 'Nina Simone');

INSERT INTO seguindo
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);

INSERT INTO album
VALUES (1, 'Renaissance', 1), (2, 'Jazz', 2), (3, 'Hot Space', 2), (4, 'Falso Brilhante', 3), (5, 'Vento de Maio', 3), (6, 'QVVJFA?', 4), (7, 'Somewhere Far Beyond', 5), (8, 'I Put A Spell On You', 6);

INSERT INTO cancao
VALUES (1, "BREAK MY SOUL", 279, 1), (2, "VIRGO’S GROOVE", 369, 1), (3, "ALIEN SUPERSTAR", 116, 1), (4, "Don’t Stop Me Now", 203, 2), (5, "Under Pressure", 152, 3), (6, "Como Nossos Pais", 105, 4), (
        7,
        "O Medo de Amar é o Medo de Ser Livre",
        207,
        5
    ), (8, "Samba em Paris", 267, 6), (9, "The Bard’s Song", 244, 7), (10, "Feeling Good", 100, 8);

INSERT INTO data_reproducao
VALUES (1, "2022-02-28 10:45:55", 1, 8), (2, "2020-05-02 05:30:35", 1, 2), (3, "2020-03-06 11:22:33", 1, 10), (4, "2022-08-05 08:05:17", 2, 10), (5, "2020-01-02 07:40:33", 2, 7), (6, "2020-11-13 16:55:13", 3, 10), (7, "2020-12-05 18:38:30", 3, 2), (8, "2021-08-15 17:10:10", 4, 8), (9, "2022-01-09 01:44:33", 5, 8), (10, "2020-08-06 15:23:43", 5, 5), (11, "2017-01-24 00:31:17", 6, 7), (12, "2017-10-12 12:35:20", 6, 1), (13, "2011-12-15 22:30:49", 7, 4), (14, "2012-03-17 14:56:41", 8, 4), (15, "2022-02-24 21:14:22", 9, 9), (
        16,
        "2015-12-13 08:30:22",
        10,
        3
    );