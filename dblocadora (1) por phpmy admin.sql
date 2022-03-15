-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Mar-2022 às 14:59
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dblocadora`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcategoria`
--

CREATE TABLE `tbcategoria` (
  `codigo_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbcategoria`
--

INSERT INTO `tbcategoria` (`codigo_categoria`, `nome_categoria`) VALUES
(1, 'Acao'),
(2, 'Aventura'),
(3, 'Isekai'),
(4, 'Comedia'),
(5, 'romance');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbclasse`
--

CREATE TABLE `tbclasse` (
  `codigo_classe` int(11) NOT NULL,
  `nome_classe` varchar(20) NOT NULL,
  `preco_classe` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbclasse`
--

INSERT INTO `tbclasse` (`codigo_classe`, `nome_classe`, `preco_classe`) VALUES
(1, 'Lançamento', '12.00'),
(2, 'Lançamento', '90.00'),
(3, 'Lançamento', '30.00'),
(4, 'Lançamento', '15.00'),
(5, 'Lançamento', '34.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `codigo_cli` int(11) NOT NULL,
  `CPF_cli` char(11) DEFAULT NULL,
  `nome_cli` varchar(20) NOT NULL,
  `data_cadastro` date DEFAULT NULL,
  `cidade_cli` varchar(20) DEFAULT NULL,
  `UF_cli` char(2) DEFAULT 'PR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbcliente`
--

INSERT INTO `tbcliente` (`codigo_cli`, `CPF_cli`, `nome_cli`, `data_cadastro`, `cidade_cli`, `UF_cli`) VALUES
(1, '12345678911', 'Pedro', '2021-10-15', 'Foz do Iguaçu', 'PR'),
(2, '92730491090', 'Rubens', '2021-12-05', 'Curitiba', 'PR'),
(3, '41874322058', 'Caio', '2021-04-20', 'Rio de Janeiro', 'RJ'),
(4, '89766895007', 'Lukas', '2021-12-24', 'Sao Paulo', 'SP'),
(5, '95058095068', 'Luis', '2021-07-11', 'Foz do Iguaçu', 'PR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbemprestimodevolucao`
--

CREATE TABLE `tbemprestimodevolucao` (
  `codigo_cli` int(11) NOT NULL,
  `codigo_filme` int(11) NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao_prevista` date NOT NULL,
  `data_devolucao_efetiva` date DEFAULT NULL,
  `valor_multa` decimal(4,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbemprestimodevolucao`
--

INSERT INTO `tbemprestimodevolucao` (`codigo_cli`, `codigo_filme`, `data_emprestimo`, `data_devolucao_prevista`, `data_devolucao_efetiva`, `valor_multa`) VALUES
(1, 1, '2022-01-05', '2022-02-05', '2022-02-10', '10.00'),
(2, 2, '2022-02-03', '2022-03-03', '2022-03-10', '26.00'),
(3, 3, '2022-02-10', '2022-03-10', '2022-03-18', '30.00'),
(4, 4, '2022-02-20', '2022-03-20', '2022-05-10', '99.99'),
(5, 5, '2022-02-27', '2022-03-28', '2022-04-05', '58.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfilme`
--

CREATE TABLE `tbfilme` (
  `codigo_filme` int(11) NOT NULL,
  `codigo_titulo` int(11) DEFAULT NULL,
  `nome_distribuidor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbfilme`
--

INSERT INTO `tbfilme` (`codigo_filme`, `codigo_titulo`, `nome_distribuidor`) VALUES
(1, 1, 'Cinepix'),
(2, 2, 'Paris Entertemit'),
(3, 3, 'Fenix Guarujá'),
(4, 4, 'Gavéa das graças'),
(5, 5, 'Rio Filmes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtitulo`
--

CREATE TABLE `tbtitulo` (
  `codigo_titulo` int(11) NOT NULL,
  `nome_titulo` varchar(50) NOT NULL,
  `ano` decimal(4,0) DEFAULT NULL,
  `codigo_categoria` int(11) DEFAULT NULL,
  `codigo_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbtitulo`
--

INSERT INTO `tbtitulo` (`codigo_titulo`, `nome_titulo`, `ano`, `codigo_categoria`, `codigo_classe`) VALUES
(1, 'Indiana Jones', '2002', 1, 1),
(2, 'Hugo - Animal da floresta', '2008', 2, 2),
(3, 'SAO', '2012', 3, 3),
(4, 'Minami-ke', '2010', 4, 4),
(5, 'Toradora', '2011', 5, 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
