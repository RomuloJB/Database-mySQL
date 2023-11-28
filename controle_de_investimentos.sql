# CRIANDO O BANCO DE DADOS E O COLOCANDO EM USO

create database investimentos;
use investimentos;

# CRIANDO TABELAS

create table compra_renda_fixa (
id_compra_renda_fixa int not null primary key auto_increment,
nome_renda varchar(45) not null,
simbolo_renda varchar(45) not null,
corretora_renda varchar(45) not null,
data_renda date not null,
quantidade_renda double not null,
valor_renda decimal(10,2),
motivo_renda text
);

create table compra_fiis (
id_compra_fiis int not null primary key auto_increment,
nome_fiis varchar(45) not null,
simbolo_fiis varchar(45) not null,
corretora_fiis varchar(45) not null,
data_fiis date not null,
quantidade_fiis double not null,
valor_fiis decimal(10,2),
motivo_fiis text
);

create table compra_acoes (
id_compra_acoes int not null primary key auto_increment,
nome_acoes varchar(45) not null,
simbolo_acoes varchar(45) not null,
corretora_acoes varchar(45) not null,
data_acoes date not null,
quantidade_acoes double not null,
valor_acoes decimal(10,2),
motivo_acoes text
);

create table compra_cripto (
id_compra_cripto int not null primary key auto_increment,
nome_cripto varchar(45) not null,
simbolo_cripto varchar(45) not null,
corretora_cripto varchar(45) not null,
data_cripto date not null,
quantidade_cripto double not null,
valor_cripto decimal(10,2),
motivo_cripto text
);

create table comprador (
id_comprador int not null primary key auto_increment,
nome_comprador varchar(100) not null,
idade_comprador int not null,
renda_id int not null references compra_renda_fixa(id_compra_renda_fixa),
fiis_id int not null references compra_fiis(id_compra_fiis),
acoes_id int not null references compra_acoes(id_compra_acoes),
cripto_id int not null references compra_cripto(id_compra_cripto)
);

# ALTERANDO TABELA compra_renda_fixa

alter table compra_renda_fixa
modify simbolo_renda varchar(45);

# INSERINDO DADOS NAS TABELAS

insert into compra_renda_fixa (nome_renda, corretora_renda, data_renda, quantidade_renda, valor_renda,
motivo_renda)
values (
"CDB LIQUIDEZ DIARIA", "BANCO INTER", '2023-06-01', 700, 700.00, "Rende 102% do CDI e pode ser resgatado a
qualquer momento, pois não possui data de validade."
);

insert into compra_fiis (nome_fiis, simbolo_fiis, corretora_fiis, data_fiis, quantidade_fiis, valor_fiis, motivo_fiis)
values (
"MAUA CAPITAL HEDGE FUND", "MCHF11", "RICO", '2023-09-21', 93.50, 9.19, "Barato, bom p/vp, bom pagante"
);

insert into compra_acoes (nome_acoes, simbolo_acoes, corretora_acoes, data_acoes, quantidade_acoes,
valor_acoes, motivo_acoes)
values (
"KLABIN", "KLBN4", "BANCO INTER", '2023-09-11', 25, 4.48, "Klabin é uma das principais posições de luiz barsi,
esta empresa é a maior produtora e exportadora de papéis para embalagens e líder nos mercados de embalagens
de papelão ondulado, sacos industriais e papel-cartão"
);

insert into compra_cripto(nome_cripto, simbolo_cripto, corretora_cripto, data_cripto, quantidade_cripto, valor_cripto,
motivo_cripto)
values (
"BITCOIN", "BTC", "BINANCE", '2021-04-13', 500.00, 358.000, "Principal criptomoeda, limitada, desejada, inovadora,
muito utilizada, escassa"
);

insert into comprador (nome_comprador, idade_comprador, renda_id, fiis_id, acoes_id, cripto_id)
values (
"ROMULO JORDAO BOGONI", 19, 1,1,1,1
);

# EXCLUINDO DADOS DA TABELA COMPRADOR PARA CONSEGUIR FAZER ALTERAÇÕES

delete from comprador
where id_comprador = 1;

# PRINTANDO PARA VER CONFIRMAR SE EXCLUSÃO FOI REALIZADA CORRETAMENTE

select * from comprador;

# ALTERANDO TABELA COMPRADOR PARA ACEITAR VALORES NULOS

alter table comprador
modify column renda_id int null,
modify fiis_id int null,
modify acoes_id int null,
modify cripto_id int null;

# INSERINDO NOVAMENTE DADOS NA TABELA COMPRADOR

insert into comprador (nome_comprador, idade_comprador, renda_id, fiis_id, acoes_id, cripto_id)
values (
"ROMULO JORDAO BOGONI", 19, 1,1,1,1
);

#AO ADICIONAR OS DADOS NOVAMENTE O ID FOI “SETADO” COMO 2, ENTÃO ATUALIZEI O ID PARA 1 NOVAMENTE

update comprador
set id_comprador = 1
where id_comprador = 2;

# PRINTANDO TODAS AS TABELAS PARA CONFERIR RESULTADOS

select * from compra_renda_fixa;
select * from compra_fiis;
select * from compra_acoes;
select * from compra_cripto;
select * from comprador;

# UTILIZANDO INNER JOIN PARA BUSCA DE DADOS ESPECIFICOS

select f.simbolo_fiis as fii, rf.nome_renda as renda_fixa
from comprador c
inner join compra_renda_fixa rf
on c.renda_id = rf.id_compra_renda_fixa
inner join compra_fiis f
on c.fiis_id = f.id_compra_fiis;
select cr.nome_cripto as criptomoeda, cr.data_cripto as dia_da_compra, cr.valor_cripto as valor_pago
from comprador c
inner join compra_cripto cr
on c.cripto_id = cr.id_compra_cripto;

# ATUALIZANDO ERRO DE DIGITAÇÃO NO VALOR_CRIPTO

update compra_cripto
set valor_cripto = 358000.00
where id_compra_cripto = 1;

# ADICIONANDO COLUNA P/VP

alter table compra_fiis
add column p_sobre_vp double not null;

# EXCLUINDO COLUNA P/VP (COLUNA DESNECESSÁRIA)

alter table compra_fiis
drop column p_sobre_vp;
