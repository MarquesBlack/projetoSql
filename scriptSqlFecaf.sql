create database dbFecaf;

use dbFecaf;

create table cliente(
idCliente int primary key not null auto_increment,
nome varchar(45),
dtNacsimento date,
RG char(9),
CPF char(14),
telefoneFixo char(11),
telefoneCelular char(11)
);

create table endereco(
idEndereco int primary key not null auto_increment,
CEP char(8),
logradouro varchar(45),
cidade varchar(45),
estado varchar(45),
UF char(2)
);

create table residencial(
fkCliente int,
fkEndereco int,
numero int,
complemento char(2),
foreign key(fkCliente) references cliente(idCliente),
foreign key(fkEndereco) references endereco(idEndereco),
primary key(fkCliente, fkEndereco)
);

create table contaSite(
idContaSite int primary key not null auto_increment,
userName varchar(15),
email varchar(100),
senha char(9),
fkCliente int
);

create table recuperacoSenha(
idToken int primary key not null auto_increment,
token varchar(12),
dtExpiracao datetime,
fkContaSite int,
fkCliente int
);

create table feedback(
idFedeeback int primary key not null auto_increment,
assunto varchar(100),
descricao varchar(200),
fkContaSite int,
fkCliente int
);

create table evento(
idEvento int primary key not null auto_increment,
nome varchar(45),
tipoEvento enum("Casamento", "Debutante", "Aniversário", "Confraternização", "Chá de bebê", "Formatura"),
qtdConvidados int,
dataEvento datetime,
equipeFigurino enum("Quero uma equioe de figurino", "Não quero uma equipe de figurino"),
equioeSom enum("Quero uma equipe de som", "Não quero uma equipe de som"),
descricaoEnvento varchar(200),
fkEndereco int
);

create table numeroEvento(
fkContaSite int,
fkCliente int,
fkEvento int,
foreign key(fkContaSite) references contaSite(idContaSite),
foreign key(fkCliente) references cliente(idCliente),
foreign key(fkEvento) references evento(idEvento),
primary key(fkContaSite, fkCliente, fkEvento),
dtEvento datetime,
numeroEvento varchar(9)
);

create table pagamento(
idPagamento int primary key not null auto_increment,
formaPagamento enum("Cartão", "Boleto"),
valorPagamento decimal(5,2),
fkEvento int
);

create table codigoPagamento(
fkEndereco int,
fkPagamento int,
foreign key(fkEndereco) references endereco(idEndereco),
foreign key(fkPagamento) references pagamento(idPagamento),
dataEmissao datetime,
numeroEmissao varchar(12),
primary key(fkEndereco, fkPagamento)
);

show tables;



