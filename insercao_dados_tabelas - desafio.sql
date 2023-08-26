use mydb;
show tables;

-- -------------------------
-- 		TABELA CLIENTE	  --
-- -------------------------
desc cliente;

-- idcliente, nome, Inicial_nome_do_meio, sobrenome, endereco, cpf, data_nascimento, telefone, email, data_cadastro, genero
insert into cliente(
		nome,
		Inicial_nome_do_meio,
        sobrenome,
        endereco,
        cpf,
        data_nascimento,
        telefone,
        email,
        data_cadastro,
        genero
    ) values
		('andressa','s','arruda','rodovia frei pacifico 2440 - rs','01234567890','1998-10-02','984297900','andressa.arruda@gmail.com','2023-08-25','F'),
        ('william','r','elesbao','barao de tramandai 272 - rs','01234567891','2000-02-15','984297901','william.elesbao.2000@gmail.com','2023-06-23','M'),
        ('andressa','s','steffens','rua lindoia - rs','01234567892','1998-10-08','984297902','andressa.steffens@gmail.com','2023-08-25','F'),
        ('gustavo','h','silva','avenida puc - rs','01234567893','1998-08-05','984297903','gustavo.silva@gmail.com','2023-08-25','M'),
        ('kamila','s','baracy','rua da lomba - rs','01234567894','2001-09-16','984297904','kamila.baracy@gmail.com','2019-08-20','F'),
        ('luisa','c','ferreira','rua dom diogo - rs','01234567895','2001-10-15','984297905','luisa.ferreira@gmail.com','2023-08-25','F'),
        ('luisa','a','elesbao','rua do mato - rs','01234567896','2001-10-14','984297906','luisa.elesbao@gmail.com','2023-08-25','F'),
        ('haru','i','valorant','rodovia da riot - sp','01234567897','1998-10-20','984297907','haru.valorant@gmail.com','2023-08-25','F'),
        ('vitor','p','valorant','rodovia da riot - rj','01234567898','1998-11-02','984297908','vitor.144kg@gmail.com','2023-08-25','M'),
        ('beatriz','r','redhead','avenida das redhead - rs','01234567899','1999-12-25','984297909','beatriz.redhead@gmail.com','2021-07-22','F');

select * from cliente;

-- -------------------------
-- 		TABELA PEDIDO	  --
-- -------------------------
desc pedido;

-- idpedido, idcliente, data_pedido, data_entrega, status_pedido, endereco_entrega, descricao, frete, metodo_pagamento
insert into pedido(
		idcliente, 
        data_pedido, 
        data_entrega, 
        status_pedido, 
        endereco_entrega, 
        descricao, 
        frete, 
        metodo_pagamento
	)values
		(1,'2023-06-24','2023-06-30','Entregue','rua de entrega 01 - ap 01',null,15.99,default),
        (2,'2023-05-23','2023-06-02','Em andamento','rua de entrega 02 - ap 02','vestimenta',21.99,'pix'),
        (2,'2023-03-22','2023-04-01','Em andamento','rua de entrega 02 - ap 02','informática',41.99,'pix'),
        (3,'2023-06-24','2023-06-30',default,'rua de entrega 03 - ap 03','informática',55.99,default),
        (4,'2023-06-24','2023-06-30',default,'rua de entrega 04 - ap 04','informática',15.99,'pix'),
        (5,'2023-07-23','2023-07-30','Entregue','rua de entrega 05 - ap 05','vestimenta',65.99,'cartao de credito'),
        (5,'2023-07-28','2023-08-20','Entregue','rua de entrega 05 - ap 05','brinquedo',35.99,'pix'),
        (6,'2023-08-20','2023-08-30','Enviado','rua de entrega 06 - ap 06','brinquedo',45.99,'cartao de credito'),
        (7,'2023-06-24','2023-06-30',default,'rua de entrega 07 - ap 07','informática',15.99,'pix'),
        (8,'2023-06-24','2023-06-30','Enviado','rua de entrega 08 - ap 08',null,15.99,default),
        (9,'2023-07-02','2023-07-14',default,'rua de entrega 09 - ap 09','vestimenta',15.99,'cartao de credito'),
        (10,'2023-06-24','2023-06-30','Enviado','rua de entrega 10 - ap 10','brinquedo',85.99,'cartao de credito');

select * from pedido;

-- -------------------------
-- 		TABELA PRODUTO	  --
-- -------------------------
desc produto;
	
-- idproduto, nome, descricao, valor, categoria
insert into produto(
		nome, 
        descricao, 
        valor, 
        categoria
	) values
		('mouse','mouse gamer',99.90,'informática'),
        ('monitor','teclado gamer',899.90,'informática'),
        ('headset','headset gamer',149.90,'informática'),
        ('cubo magico','cubo magico',69.90,'brinquedo'),
        ('carro de formula 1','com controle remoto',169.90,'brinquedo'),
        ('camisa','camisa marvel',49.90,'vestimenta'),
        ('camisa','camisa basica',29.90,'vestimenta'),
        ('calça','calça jeans',59.90,'vestimenta');

select * from produto;
        
-- -------------------------------------
-- 		TABELA TERCEIRO VENDEDOR	  --
-- -------------------------------------     
 desc terceiro_vendedor;   
 
 -- idterceiro_vendedor, razao_social, nome_fantasia, cnpj, cpf, salario, data_contratacao
insert into terceiro_vendedor(
        razao_social, 
        nome_fantasia, 
        cnpj, 
        cpf, 
        salario, 
        data_contratacao
	)values
		('loja multi itens 01 S/A',null,'000001234500011',null,1250.85,'2023-05-05'),
        ('loja multi itens 02 S/A',null,'000001234500012',null,1350.43,'2023-05-06'),
        ('loja multi itens 03 S/A',null,'000001234500013',null,2250.23,'2023-06-12'),
        ('loja multi itens 04 S/A',null,'000001234500014',null,3150.13,'2023-06-23'),
        ('loja multi itens 05 S/A',null,'000001234500015',null,4250.35,'2023-07-29');

select * from terceiro_vendedor;

-- -----------------------------
-- 		TABELA FORNECEDOR	  --
-- -----------------------------     
 desc fornecedor;   
 
 -- idfornecedor, razao_social, cnpj, endereco, telefone, email, website
insert into fornecedor(
        razao_social,
        cnpj, 
        endereco, 
        telefone, 
        email, 
        website
	)values
		('fornecedor 01 S/A','001.012.123.0001-01','rua do fornecedor 01','998877660','fornecedor01@gmail.com','sitefornecedor01.com.br'),
        ('fornecedor 02 S/A','001.012.123.0001-02','rua do fornecedor 02','998877661','fornecedor02@gmail.com','sitefornecedor02.com.br'),
        ('fornecedor 03 S/A','001.012.123.0001-03','rua do fornecedor 03','998877662','fornecedor03@gmail.com','sitefornecedor03.com.br'),
        ('fornecedor 04 S/A','001.012.123.0001-04','rua do fornecedor 04','998877663','fornecedor04@gmail.com','sitefornecedor04.com.br'),
        ('fornecedor 05 S/A','001.012.123.0001-05','rua do fornecedor 05','998877664','fornecedor05@gmail.com','sitefornecedor05.com.br'),
        ('fornecedor 06 S/A','001.012.123.0001-06','rua do fornecedor 06','998877665','fornecedor06@gmail.com','sitefornecedor06.com.br');

select * from fornecedor;

-- -------------------------
-- 		TABELA ESTOQUE	  --
-- -------------------------     
 desc estoque;   
 
 -- idestoque, localizacao_estoque
insert into estoque(
        localizacao_estoque
	)values
		('estoque de distribuicao 01'),
        ('estoque de distribuicao 02'),
        ('estoque de distribuicao 03'),
        ('estoque de distribuicao 04');

select * from estoque;

-- ---------------------------------
-- 		TABELA PRODUTO ESTOQUE	  --
-- ---------------------------------     
 desc produto_em_estoque;   
 
 -- idproduto, idestoque, quantidade
insert into produto_em_estoque(
        idproduto,
        idestoque,
        quantidade
	)values
        (2,1,10),
        (3,4,50),
        (4,4,10),
        (5,4,70),
        (6,3,22),
        (7,2,12),
        (8,2,3),
        (2,2,30),
        (4,3,23); 

select * from produto_em_estoque;

-- ---------------------------------
-- 		TABELA PRODUTO PEDIDO	  --
-- ---------------------------------     
 desc produto_pedido;   
 
 -- idproduto, idpedido, quantidade, status
insert into produto_pedido(
        idproduto, 
        idpedido, 
        quantidade, 
        status
	)values
        (1,1,'2',default),
        (1,2,'2',default),
        (1,3,'4',default),
        (8,4,'8',default),
        (7,5,'3',default),
        (5,6,'7',default),
        (1,7,'1',default),
        (2,8,'2',default),
        (3,9,'2',default),
        (5,10,'1',default),
        (7,11,'2',default),
        (4,12,'10',default); 

select * from produto_pedido;

-- ---------------------------------
-- 		TABELA PRODUTO VENDEDOR	  --
-- ---------------------------------     
desc produto_vendedor;   

-- idterceiro_vendedor, idproduto, quantidade
insert into produto_vendedor(
	idterceiro_vendedor, 
    idproduto, 
    quantidade
) values
    (1,4,10),
    (2,4,40),
    (3,3,5),
    (4,5,5),
    (5,7,8),
    (5,8,10);
    
select * from produto_vendedor;

-- ---------------------------------
--   TABELA PRODUTO FORNECEDOR    --
-- ---------------------------------     
desc produto_fornecedor;   

-- idfornecedor, idproduto, quantidade
insert into produto_fornecedor(
	idfornecedor, 
    idproduto, 
    quantidade
) values
    (1,1,99),
    (2,2,50),
    (3,3,20),
    (4,4,21),
    (5,5,22),
    (6,6,14),
	(1,2,13),
    (2,3,12),
    (3,4,15),
    (4,5,20),
    (5,6,45),
    (6,7,35),
	(1,8,80),
    (2,8,25),
    (3,7,30),
    (4,6,40),
    (6,4,40);
    
select * from produto_fornecedor;