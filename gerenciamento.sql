CREATE DATABASE gerenciamento;
USE gerenciamento;

CREATE TABLE projetos (
id_projetos int primary key not null auto_increment,
nome_projeto varchar(100) not null,
descricao varchar(100) not null,
data_inicio date not null,
data_conclusao date not null,
orcamento double(10,2) not null
);

create table artistas (
id_artistas int primary key not null auto_increment,
nome varchar(100) not null,
sobrenome varchar(100) not null,
nacionalidade varchar(100) not null,
estilo varchar(100) not null
);

create table obras (
id_obras int primary key not null auto_increment,
titulo_obra varchar(100) not null,
materiais text not null,
ano_criacao int not null,
projetos_id int not null references id_projeto(projetos),
artistas_id int not null references id_artistas(artistas)
);

create table exibicoes (
id_exibicoes int not null primary key auto_increment,
local_exibicao varchar(100) not null,
data_inicio date not null,
data_termino date not null,
curador varchar(100) not null,
obras_id_obras int not null
);

create table premios (
id_premios int primary key not null auto_increment,
nome_premio varchar(100) not null,
categoria varchar(100) not null,
data_premiacao date not null,
obras_id_obras int not null references id_obras(obras)
);

insert into projetos (nome_projeto, descricao, data_inicio, data_conclusao, orcamento)
values ('As Peripecias do 1º ano', 'Melhores acontecimentos da sala do 1º ano de Engenharia de Software do IFPR Campus Paranavaí', '2023-06-06', '2023-06-12', 1000000.00),
('As aventuras de Angelica', 'Aventuras da professora Angelica e suas aulas', '2023-02-07', '2023-12-20', 50000.00),
('futsal ifpr', 'Historia de como começou a ocorrer jogos de futsal no IFPR', '2023-05-22', '2023-12-01', 00.00),
('Banco de Dados', 'Apredizados do 1º ano na disciplina Banco de Dados', '2023-02-13', '2023-12-20', 00.00),
('1º ano de Engenharia de Software', 'O que foi feito no 1º ano de Engenharia de Software', '2023-02-07', '2023-12-20', 00.00
);

insert into artistas (nome, sobrenome, nacionalidade, estilo)
values ('Romulo', 'Jordao', 'Brasil', 'comédia'),
('Caue', 'Yanagihara', 'Japão', 'comédia'),
('Angelica', 'Mizutani', 'Japão', 'Ação'),
('Yuka', 'Noguti', 'Japão', 'comédia'),
('Nathália', 'Oliveira', 'Brasil', 'Ação e comédia');

insert into obras (titulo_obra, materiais, ano_criacao, projetos_id, artistas_id)
values ('IFPR o caos perfeito', 'camera, kit de iluminação', 2023, 1, 4),
('Não dá para dar aula assim!', 'camera, kit de iluminação, campus IFPR', 2023, 2, 3),
('Só quero jogar bola!', 'camera, kit de iluminação, quadra', 2023, 3, 1),
('Fácil de mais!', 'camera, kit de iluminação, laboratorio de informatica',2023, 4, 2),
('Coisa de mais', 'camera, kit iluminação, ementa academica', 2022, 5, 5);

insert into exibicoes (local_exibicao, data_inicio, data_termino, curador, obras_id_obras)
values ('IFPR Campus Paranavaí', '2023-06-12', '2023-06-12', 'o que é curador?', 1),
('Sala 3 IFPR Campus Paranavaí', '2023-02-07', '2023-06-12', 'o que é curador?', 2),
('Quadra de futsal IFPR', '2023-05-22', '2023-12-20', 'o que é curador?', 3),
('IFPR Campus Paranavaí', '2023-02-07', '2023-12-20', 'o que é curador?', 4),
('Palácio de Cristal', '2023-02-07', '2023-12-20', 'o que é curador?', 5);

insert into premios (nome_premio, categoria, data_premiacao, obras_id_obras)
values ('Melhor obra do ano', 'Educação', '2023-12-20', 1),
('Melhor Professora do ano', 'Educação', '2023-12-20', 2),
('Troféu e medalha TOTY', 'Esportes', '2023-12-20', 3),
('Melhor matéria do ano', 'Educação', '2023-12-20', 4),
('Melhor turma do ano', 'Educação', '2023-12-20', 5);

select nome_projeto, data_inicio, data_conclusao
from projetos;

select nome, sobrenome, estilo
from artistas;

select titulo_obra, ano_criacao, projetos_id, artistas_id
from obras;

select nome_premio, categoria, obras_id_obras
from premios;

update exibicoes
set local_exibicao = 'Casa da cultura'
where id_exibicoes = 3;

update premios
set nome_premio = 'Maravilhosa Daniela Flor'
where id_premios = 2;

update artistas
set nome = 'Zelda Link'
where id_artistas = 4;

delete from premios
where id_premios = 1;
