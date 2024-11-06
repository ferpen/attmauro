-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/11/2024 às 02:06
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
-- Banco de dados: `at9`
--
CREATE DATABASE IF NOT EXISTS `at9` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `at9`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `administracoes`
--

DROP TABLE IF EXISTS `administracoes`;
CREATE TABLE `administracoes` (
  `id` int(11) NOT NULL,
  `receita_id` int(11) DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `administracoes`
--

INSERT INTO `administracoes` (`id`, `receita_id`, `data_registro`) VALUES
(1, 1, '2024-11-06 01:01:18'),
(2, 2, '2024-11-06 01:12:04'),
(3, 3, '2024-11-06 01:58:25'),
(4, 4, '2024-11-05 22:03:52');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enfermeiros`
--

DROP TABLE IF EXISTS `enfermeiros`;
CREATE TABLE `enfermeiros` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `coren` varchar(20) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enfermeiros`
--

INSERT INTO `enfermeiros` (`id`, `nome`, `coren`, `usuario`, `senha`) VALUES
(1, 'didizn', '1235', 'didi', '$2y$10$.KVfa1nfSEatQMkEH7cdJesmU4ecoC0XVm1BDTDZ.HvOHdfyF.MJG');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicos`
--

DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `crm` varchar(20) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medicos`
--

INSERT INTO `medicos` (`id`, `nome`, `especialidade`, `crm`, `usuario`, `senha`) VALUES
(1, 'guguzin', 'neurologista', '1235412', 'ferpen', '$2y$10$zPhB/moxF4S7VIRhL6WpteUPEtpjGVG86bVX2UiUlCexp1NEAhEWW');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `leito` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `leito`) VALUES
(1, 'fernandao', '2'),
(2, 'fernandao', '35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas`
--

DROP TABLE IF EXISTS `receitas`;
CREATE TABLE `receitas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `medicamento` varchar(100) DEFAULT NULL,
  `data_admin` date DEFAULT NULL,
  `hora_admin` time DEFAULT NULL,
  `dose` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `receitas`
--

INSERT INTO `receitas` (`id`, `paciente_id`, `medicamento`, `data_admin`, `hora_admin`, `dose`) VALUES
(1, 1, 'rivotril', '2024-09-12', '22:25:00', 'pesada demais'),
(2, 1, 'rivotril', '2024-11-22', '21:11:00', 'pesada demais'),
(3, 1, 'cocaina pura', '2024-11-26', '04:20:00', 'quatro xicaras de farinha'),
(4, 1, 'PEIDO ENLATADO', '2024-11-14', '22:01:19', 'duas borrifadas'),
(5, 1, 'DOERGA', '2024-10-30', '23:03:00', 'pesada demais');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administracoes`
--
ALTER TABLE `administracoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receita_id` (`receita_id`);

--
-- Índices de tabela `enfermeiros`
--
ALTER TABLE `enfermeiros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administracoes`
--
ALTER TABLE `administracoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `enfermeiros`
--
ALTER TABLE `enfermeiros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `administracoes`
--
ALTER TABLE `administracoes`
  ADD CONSTRAINT `administracoes_ibfk_1` FOREIGN KEY (`receita_id`) REFERENCES `receitas` (`id`);

--
-- Restrições para tabelas `receitas`
--
ALTER TABLE `receitas`
  ADD CONSTRAINT `receitas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
