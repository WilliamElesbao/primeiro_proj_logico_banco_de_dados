-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(10) NOT NULL,
  `Inicial_nome_do_meio` VARCHAR(3) NULL,
  `sobrenome` VARCHAR(20) NOT NULL COMMENT 'adicionar constraint de unicidade para (nome completo)\nunique( nome, m, sobrenome)',
  `endereco` VARCHAR(45) NOT NULL COMMENT 'atributo composto: rua, bairro, complemento, cidade e estado e cep',
  `cpf` CHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NULL,
  `data_cadastro` DATE NOT NULL,
  `genero` ENUM('M', 'F') NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `identificacao_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `data_pedido` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `status_pedido` ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') NOT NULL DEFAULT 'Processando',
  `endereco_entrega` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `frete` FLOAT NOT NULL,
  `metodo_pagamento` ENUM('boleto', 'pix', 'cartao de credito') NOT NULL DEFAULT 'boleto',
  PRIMARY KEY (`idpedido`, `idcliente`),
  INDEX `fk_pedido_cliente_idx` (`idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `valor` FLOAT NOT NULL,
  `categoria` ENUM('brinquedo', 'informática', 'vestimenta') NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto_pedido` (
  `idproduto` INT NOT NULL,
  `idpedido` INT NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `status` ENUM('disponivel', 'sem_estoque') NULL DEFAULT 'disponivel',
  PRIMARY KEY (`idproduto`, `idpedido`),
  INDEX `fk_pedido_has_produto_produto1_idx` (`idproduto` ASC) VISIBLE,
  INDEX `fk_pedido_has_produto_pedido1_idx` (`idpedido` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_produto_pedido1`
    FOREIGN KEY (`idpedido`)
    REFERENCES `mydb`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_produto_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `mydb`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`terceiro_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`terceiro_vendedor` (
  `idterceiro_vendedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(45) NULL,
  `cnpj` CHAR(15) NULL,
  `cpf` CHAR(11) NULL,
  `salario` FLOAT NOT NULL,
  `data_contratacao` DATE NOT NULL,
  PRIMARY KEY (`idterceiro_vendedor`),
  UNIQUE INDEX `razao_social_UNIQUE` (`razao_social` ASC) VISIBLE,
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto_vendedor` (
  `idterceiro_vendedor` INT NOT NULL AUTO_INCREMENT,
  `idproduto` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`idterceiro_vendedor`, `idproduto`),
  INDEX `fk_produto_has_terceiro_vendedor_terceiro_vendedor1_idx` (`idterceiro_vendedor` ASC) VISIBLE,
  INDEX `fk_produto_has_terceiro_vendedor_produto1_idx` (`idproduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_terceiro_vendedor_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `mydb`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_terceiro_vendedor_terceiro_vendedor1`
    FOREIGN KEY (`idterceiro_vendedor`)
    REFERENCES `mydb`.`terceiro_vendedor` (`idterceiro_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fornecedor` (
  `idfornecedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `cnpj` VARCHAR(20) NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `website` VARCHAR(255) NULL,
  PRIMARY KEY (`idfornecedor`),
  UNIQUE INDEX `razao_social_UNIQUE` (`razao_social` ASC) VISIBLE,
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estoque` (
  `idestoque` INT NOT NULL AUTO_INCREMENT,
  `localizacao_estoque` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idestoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto_em_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto_em_estoque` (
  `idproduto` INT NOT NULL,
  `idestoque` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idproduto`, `idestoque`),
  INDEX `fk_produto_has_estoque_estoque1_idx` (`idestoque` ASC) VISIBLE,
  INDEX `fk_produto_has_estoque_produto1_idx` (`idproduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_estoque_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `mydb`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_estoque_estoque1`
    FOREIGN KEY (`idestoque`)
    REFERENCES `mydb`.`estoque` (`idestoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto_fornecedor` (
  `idfornecedor` INT NOT NULL,
  `idproduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idfornecedor`, `idproduto`),
  INDEX `fk_fornecedor_has_produto_produto1_idx` (`idproduto` ASC) VISIBLE,
  INDEX `fk_fornecedor_has_produto_fornecedor1_idx` (`idfornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor_has_produto_fornecedor1`
    FOREIGN KEY (`idfornecedor`)
    REFERENCES `mydb`.`fornecedor` (`idfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_has_produto_produto1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `mydb`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
