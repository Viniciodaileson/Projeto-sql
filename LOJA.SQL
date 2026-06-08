/*  valor compra e venda decimal (18,2) not null  quant int -- valor unitario  
*/
CREATE DATABASE loja;
USE loja;

-- Tabela Estoque
CREATE TABLE tbestoque (
    idestoque INT AUTO_INCREMENT PRIMARY KEY,
    produto varchar(50) not null,
    Quant int not null,
    Vr_venda Decimal(18,2) NOT NULL,
    vr_compra DECIMAL(10,2) NOT NULL
);

-- Tabela ITEM_PDV (Itens da Venda)
CREATE TABLE ITEM_PDV (
    codpdv INT AUTO_INCREMENT PRIMARY KEY,
    quant INT NOT NULL,
    vr_unit DECIMAL(10,2) NOT NULL,
    vr_total DECIMAL(10,2) NOT NULL,
    idestoque INT,
    FOREIGN KEY (idestoque) REFERENCES tbestoque(idestoque)
);

create table pdv(
idpdv int auto_increment primary key,
vr_compra decimal (18,2) not null,
Dt_venda datetime not null,
codpdv int not null,
foreign key (codpdv) references ITEM_PDV(codpdv)
);

create table forma_pgto (
cod_pgto int auto_increment primary key,
descricao varchar(50) not null,
idpdv int not null,
foreign key (idpdv) references pdv(idpdv)
);
