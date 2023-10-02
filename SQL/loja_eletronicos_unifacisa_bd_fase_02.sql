create table funcionario (

	cpf bigint not null,
	nome varchar (100),
	fone varchar (20),
	endereco varchar (200),
	salario numeric (8,2) default 2000.00,
	funcao varchar (20),
	
constraint funcionarioPK primary key (cpf)

);

create table produto (

	codigo int not null,
	descricao varchar (50),
	fabricante varchar (30),
	precVenda numeric (8,2),
	numNotaFiscalProd int,
	
constraint prodPK primary key (codigo)	

);

create table cliente (

	cpfCli bigint not null,
	nome varchar (50),
	endereco varchar (100),
	codCompra int not null,
	
constraint cliPK primary key (cpfCli),
constraint codProdFK foreign key (codCompra) references produto (codigo),	
unique(cpfCli)
	
);

create table vendedor (

	vendCpf bigint not null,
	comissao int default 10, -- -- Comissão de 10%
	metaMensal numeric (8,2) default 5000.00,
	
constraint vendPK primary key (vendCpf),
constraint vendFuncFK foreign key (vendCpf) references funcionario (cpf)

);

create table venda (

	numNotaFiscal int,
	cpfVendedorResp bigint not null,
	itensVend varchar (50),
	quantidade int,
	clienteCpf bigint not null,
	dtVenda date,
	
constraint vendaPK primary key (numNotaFiscal),
constraint cpfVendFK foreign key (cpfVendedorResp) references vendedor (vendCpf),
constraint cliNomeFK foreign key (clienteCpf) references cliente (cpfCli)	
	
);

insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (74442870900, 'Tiago Macedo', '83 996504587', 'Avenida Raul Machado', 5500.00, 'Gerente');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (44249527034, 'Cláudio Gimenes', '83 986403554', 'Rua Genildo Carvalho da Silva', 2500.00, 'Vendedor');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (46738223153, 'Geraldo Guedes', '83 985469874', 'Rua João Câncio', 2500.00, 'Vendedor');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (06500703723, 'Milton Rosário', '83 985204562', 'Rua Funcionária Zilda Leal Freire', 1500.00, 'Caixa');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (18909531568, 'Mateus Albuquerque', '83 995463256', 'Rua Maria Constantino Luiz', 1500.00, 'Caixa');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (41477456520, 'Leandro Melo', '83 988786598', 'Rua das Amendoeiras', 1000.00, 'Caixa');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (78924268848, 'Miriam Nakamura', '83 996548878', 'Rua Firmino Leite', 2000.00, 'Vendedor');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (36971376706, 'Luciana Lópes', '83 997851235', 'Rua Sindá Félix de Lima', 1500.00, 'Vendedor');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (70429807430, 'Rodrigo Alvarez', '83 988484465', 'Rua José Feliciano da Silva', 2500.00, 'Vendedor');
insert into funcionario (cpf, nome, fone, endereco, salario, funcao) values (73732956733, 'Maitê Mantovani', '83 986025462', 'Rua Comunitário Gerson Gomes', 950.00, 'Caixa');

insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (001, 'Galaxy S23 Ultra', 'Samsung', 6745.54, 000001);
insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (002, 'Galaxy S23 Plus', 'Samsung', 5489.00, 000002);
insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (003, 'Notebook Gamer Dell G15-i1200-A20P', 'Dell', 5299.00, 000003);
insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (004, 'Notebook Acer Aspire 5', 'Acer', 4280.00, 000004);
insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (005, 'Notebook Acer Gamer Nitro 5', 'Acer', 4399.00, 000005);
insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (006, 'Apple iPhone 14 Pro Max', 'Apple', 8599.00, 000006);
insert into produto (codigo, descricao, fabricante, precVenda, numNotaFiscalProd) values (007, 'Apple iPhone 13 Pro', 'Apple', 6999.00, 000007);

insert into cliente (cpfCli, nome, endereco, codCompra) values (06148583569, 'Thiago Ribeiro', 'Campina Grande', 007);
insert into cliente (cpfCli, nome, endereco, codCompra) values (64627348258, 'Pablo Miranda', 'Campina Grande', 006);
insert into cliente (cpfCli, nome, endereco, codCompra) values (74444616601, 'Bruno Barbosa', 'João Pessoa', 003);
insert into cliente (cpfCli, nome, endereco, codCompra) values (63145245392, 'Nina Peres', 'Cabedelo', 001);
insert into cliente (cpfCli, nome, endereco, codCompra) values (58209801821, 'Douglas Medeiros', 'Patos', 003);
insert into cliente (cpfCli, nome, endereco, codCompra) values (76241787535, 'Isadora Campos', 'Campina Grande', 005);
insert into cliente (cpfCli, nome, endereco, codCompra) values (61147254842, 'Adriana Salles', 'João Pessoa', 007);
insert into cliente (cpfCli, nome, endereco, codCompra) values (33653893267, 'Vivian Câmara', 'Guarabira', 005);

insert into vendedor (vendCpf) values (44249527034);
insert into vendedor (vendCpf) values (46738223153);
insert into vendedor (vendCpf) values (78924268848);
insert into vendedor (vendCpf) values (36971376706);
insert into vendedor (vendCpf) values (70429807430);

insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000005, 70429807430, 'Notebook Acer Gamer Nitro 5', 1, 76241787535, '2023-09-15');
insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000003, 36971376706, 'Notebook Gamer Dell G15-i1200-A20P', 1, 74444616601, '2023-08-18');
insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000007, 70429807430, 'Apple iPhone 13 Pro', 2, 06148583569, '2023-06-07');
insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000008, 44249527034, 'Notebook Gamer Dell G15-i1200-A20P', 1, 58209801821, '2023-09-20');
insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000009, 78924268848, 'Galaxy S23 Ultra', 1, 63145245392, '2023-08-25');
insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000010, 70429807430, 'Notebook Acer Gamer Nitro 5', 1, 33653893267, '2023-09-20');
insert into venda (numNotaFiscal, cpfVendedorResp, itensVend, quantidade, clienteCpf, dtVenda) values (000002, 78924268848, 'Apple iPhone 14 Pro Max', 2, 64627348258, '2023-07-10');

-- consultas:

select * from funcionario;

select f.nome as NomeVendedor, sum(v.quantidade) as TotalVendas
from venda v, vendedor vd, funcionario f
where v.cpfVendedorResp = vd.vendCpf and vd.vendCpf = f.cpf
and f.nome = 'Rodrigo Alvarez'
group by f.Nome;

select c.nome as NomeCliente, c.endereco as Cidade
from cliente c
where endereco = 'Campina Grande';

select distinct c.cpfCli as ClienteCPF, p.descricao as Produto, c.nome as Nome
from cliente c, produto p
where c.CodCompra = p.codigo
and descricao = 'Galaxy S23 Ultra';

