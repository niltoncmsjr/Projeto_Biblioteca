-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/04/2024 às 15:09
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca_senac`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `fk_pessoa` int(11) NOT NULL,
  `fk_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `fk_pessoa`, `fk_funcionario`) VALUES
(4, 2, 1),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos_livros`
--

CREATE TABLE `emprestimos_livros` (
  `id` int(11) NOT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  `fk_emprestimo` int(11) NOT NULL,
  `fk_livro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `emprestimos_livros`
--

INSERT INTO `emprestimos_livros` (`id`, `data_emprestimo`, `data_devolucao`, `fk_emprestimo`, `fk_livro`) VALUES
(4, '2024-04-08', '2024-04-16', 4, 1),
(5, '2024-04-09', '2024-04-11', 5, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(11) NOT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `logradouro` varchar(150) DEFAULT NULL,
  `bairro` varchar(150) DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `uf` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='					';

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `cep`, `logradouro`, `bairro`, `cidade`, `uf`) VALUES
(1, '12510546', 'Rua Francisca de Oliveira Brito', 'Jardim França II', 'Guaratinguetá', 'SP'),
(2, '12509830', 'Rua Antônia Mateus da Silva', 'Vila Municipal I', 'Guaratinguetá', 'SP'),
(3, '', '', '', '', 'Selecione...');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `fk_pessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `cargo`, `login`, `senha`, `fk_pessoa`) VALUES
(1, 'Atendente', 'nilton', '123', 1),
(2, 'Atendente', 'marcele', '123', 3),
(3, 'Selecione...', 'nicolle', '123', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `paginas` int(11) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `nome`, `descricao`, `categoria`, `autor`, `paginas`, `isbn`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'arry Potter é um garoto cujos pais, feiticeiros, foram assassinados por um poderosíssimo bruxo', 'Magias', 'J.K. Rowling ', 208, '8532530788'),
(2, 'Sitio do Picapau Amarelo', 'O livro da coleção \"trenzinho\", conta algumas histórias curtas, recomendadas para crianças', 'Infantil', 'Monteiro Lobato', 20, '8595201390'),
(4, 'O Menino Maluquinho 1', 'um menininho traquinas, diziam... ficou conhecido como menino maluqunho ', 'infantil', 'Ziraldo Alves ', 112, '9788506055106'),
(5, 'Crepúsculo', 'Autora conta a historia de uma jovem que se apaixona por um vampiro.', 'Adolescentes', 'Stephenie Meyer', 480, '9788598078304');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `sobrenome` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `fk_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='	';

--
-- Despejando dados para a tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `sobrenome`, `data_nascimento`, `cpf`, `email`, `telefone`, `numero`, `complemento`, `fk_endereco`) VALUES
(1, 'Nilton', 'Junior', '1994-05-30', '43535080835', 'nilton@gmail.com', '(12)99789-7475', '9', 'Casa de Esquina', 1),
(2, 'Nicolle', 'Kananda', '2005-03-14', '346.546.789.78', 'nicolle@gmail.com', '(12)99789-7475', '96', 'Sobrado', 2),
(3, 'Marcele', 'Silva', '2005-03-14', '399.463.058-44', 'marcele@gmail.com', '(12)99767-4298', '9', 'Rua 9', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`,`fk_pessoa`,`fk_funcionario`),
  ADD KEY `fk_emprestimos_pessoas1_idx` (`fk_pessoa`),
  ADD KEY `fk_emprestimos_funcionarios1_idx` (`fk_funcionario`);

--
-- Índices de tabela `emprestimos_livros`
--
ALTER TABLE `emprestimos_livros`
  ADD PRIMARY KEY (`id`,`fk_emprestimo`,`fk_livro`),
  ADD KEY `fk_emprestimos_livros_emprestimos1_idx` (`fk_emprestimo`),
  ADD KEY `fk_emprestimos_livros_livros1_idx` (`fk_livro`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`,`fk_pessoa`),
  ADD KEY `fk_funcionarios_pessoas1_idx` (`fk_pessoa`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`,`fk_endereco`),
  ADD KEY `fk_clientes_enderecos_idx` (`fk_endereco`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `emprestimos_livros`
--
ALTER TABLE `emprestimos_livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk_emprestimos_funcionarios1` FOREIGN KEY (`fk_funcionario`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimos_pessoas1` FOREIGN KEY (`fk_pessoa`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `emprestimos_livros`
--
ALTER TABLE `emprestimos_livros`
  ADD CONSTRAINT `fk_emprestimos_livros_emprestimos1` FOREIGN KEY (`fk_emprestimo`) REFERENCES `emprestimos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimos_livros_livros1` FOREIGN KEY (`fk_livro`) REFERENCES `livros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_funcionarios_pessoas1` FOREIGN KEY (`fk_pessoa`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `pessoas`
--
ALTER TABLE `pessoas`
  ADD CONSTRAINT `fk_clientes_enderecos` FOREIGN KEY (`fk_endereco`) REFERENCES `enderecos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
