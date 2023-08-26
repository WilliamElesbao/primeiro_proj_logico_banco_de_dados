-- buscar pedidos relacionado a clientes
SELECT ped.idpedido, c.idcliente, CONCAT(c.nome, ' ', c.sobrenome) AS nome_completo,
       GROUP_CONCAT(p.nome) AS produtos_comprados
		FROM produto_pedido pp
		INNER JOIN produto p ON p.idproduto = pp.idproduto
		INNER JOIN pedido ped ON ped.idpedido = pp.idpedido
		INNER JOIN cliente c ON ped.idcliente = c.idcliente
		GROUP BY ped.idpedido, c.idcliente, nome_completo;


-- quantos pedidos foram realizados por cada cliente
SELECT c.idcliente, CONCAT(c.nome, ' ', c.sobrenome) AS nome_completo, COUNT(ped.idpedido) AS total_pedidos
	FROM pedido ped
	INNER JOIN cliente c ON ped.idcliente = c.idcliente
	GROUP BY c.idcliente, nome_completo
	ORDER BY total_pedidos DESC;

-- algum vendedor também é fornecedor 
SELECT *
	FROM terceiro_vendedor tv
	INNER JOIN fornecedor f ON f.cnpj = tv.cnpj;

-- relacao de produto fornecedor e estoque
SELECT 
    p.nome AS nome_produto,
    f.razao_social AS nome_fornecedor,
    e.quantidade
FROM 
    produto p
INNER JOIN 
    produto_fornecedor pf ON p.idproduto = pf.idproduto
INNER JOIN 
    fornecedor f ON pf.idfornecedor = f.idfornecedor
INNER JOIN 
    produto_em_estoque e ON p.idproduto = e.idproduto;

-- relacao de nome de fornecedores e produtos
SELECT 
    p.nome AS nome_produto,
    f.razao_social AS nome_fornecedor
FROM 
    produto p
INNER JOIN 
    produto_fornecedor pf ON p.idproduto = pf.idproduto
INNER JOIN 
    fornecedor f ON pf.idfornecedor = f.idfornecedor;


