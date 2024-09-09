create database gerenciador
default character set utf8
default collate utf8_general_ci;

create table cliente(
Id_cliente int not null auto_increment,
Nome varchar(45) not null,
Data_nacimento date,
Email varchar(50),
CPF_CNPJ varchar(15),
RG varchar(15),
Telefone varchar(11),
Endereço varchar(100),
data_criação date,
primary key(id_cliente)
)default charset utf8;

create table produtos(
Id_produto int not null auto_increment,
Nome varchar(20) not null,
Preço_custo decimal(10,2),
Preço_venda decimal(10,2),
Quantidade_estoque int not null,
Unidade_medida varchar(10),
Data_criação date,
primary key(Id_produto)
)default charset utf8;

create table materia_prima(
id_materia int not null auto_increment,
nome varchar(20) not null,
quantidade_estoque int(11),
unidade_de_medida enum('metro', 'untario'),
fornecedor varchar(30) not null,
contato_fornecedor varchar(100),
endereço_fornecedor varchar(100) not null,
custo_material decimal(10,2) not null,
data_criação date,
primary key(id_materia)
)default charset utf8;

create table pedidos(
id_pedido int not null auto_increment,
id_cliente int not null,
data_pedido date,
total_pedido varchar(1000),
status_pedido enum('concluido', 'não-concluido'),
data_criação date,
primary key(id_pedido),
foreign key(id_cliente)
references cliente(id_cliente)
)default charset utf8;

create table itens_pedido(
id_itens_pedidos int not null auto_increment,
id_pedido int not null,
id_produto int not null,
quantidade enum('metro', 'unidade'),
preço_unitario decimal(10,2),
subtotal decimal(10,2),
primary key(id_itens_pedidos),
foreign key(id_pedido)
references pedidos(id_pedido)
)default charset utf8;

create table pagamento(
id_pagamento int not null auto_increment,
id_pedido int not null,
metodo_pagamento enum('dinheiro', 'credito', 'debito', 'pix'),
valor_pago decimal(10,2),
valor_frete decimal(5,2),
status_pagamento enum('pago', 'n-pago'),
data_pagamneto date,
primary key(id_pagamento),
foreign key(id_pedido)references pedidos(id_pedido)
)default charset utf8;

create table entrega(
id_entrega int not null auto_increment,
id_pedido int not null,
endereço_entrega varchar(100),
prazo_entrega datetime,
status_entrega enum('entregue', 'n-entregue'),
primary key(id_entrega),
foreign key(id_pedido) references pedidos(id_pedido)
)default charset utf8;

create table gastos_produção(
id_gasto int not null auto_increment,
nome varchar(20) not null,
valor_diario_min decimal(10,2),
valor_mensal_min decimal(10,2),
valor_anual_min decimal(10,2),
primary key (id_gasto)
)default charset utf8;

select * from cliente;
select * from entrega;
select * from itens_pedido;
select * from materia_prima;
select * from pagamento;
select * from pedidos;
select * from gastos_produção;
select * from produtos;

