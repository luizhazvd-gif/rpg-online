-- =====================================================
-- Projeto: Jogo de RPG online
-- Atividade: Criação das tabelas com DDL (SQL Server)
-- Entidades: Usuarios, Classes, Habilidades,
--            Personagens, Classes_Habilidades
-- =====================================================

-- 1. Criação do banco de dados
CREATE DATABASE RPGOnlineDB;
GO

-- 2. Seleção do banco para criar as tabelas dentro dele
USE RPGOnlineDB;
GO

-- =====================================================
-- 3. Tabelas independentes (sem chave estrangeira)
-- =====================================================

-- Tabela de usuários (jogadores)
CREATE TABLE Usuarios
(
    UsuarioId INT PRIMARY KEY IDENTITY
    ,Email VARCHAR(120) NOT NULL UNIQUE
    ,Senha VARCHAR(255) NOT NULL
);
GO

-- Tabela de classes dos personagens (guerreiro, mago, etc.)
CREATE TABLE Classes
(
    ClasseId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(60) NOT NULL UNIQUE
    ,Descricao VARCHAR(500)
);
GO

-- Tabela de habilidades
CREATE TABLE Habilidades
(
    HabilidadeId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(60) NOT NULL UNIQUE
);
GO

-- =====================================================
-- 4. Tabelas dependentes (com chave estrangeira)
-- =====================================================

-- Tabela de personagens
-- Relacionamentos: USUARIOS 1:N PERSONAGENS | CLASSES 1:N PERSONAGENS
CREATE TABLE Personagens
(
    PersonagemId INT PRIMARY KEY IDENTITY
    ,NomePersonagem VARCHAR(60) NOT NULL UNIQUE
    ,UsuarioId INT NOT NULL FOREIGN KEY REFERENCES Usuarios(UsuarioId)
    ,ClasseId INT NOT NULL FOREIGN KEY REFERENCES Classes(ClasseId)
);
GO

-- Tabela associativa (resolve o relacionamento N:N entre CLASSES e HABILIDADES)
-- Chave primária composta, formada por duas chaves estrangeiras
CREATE TABLE Classes_Habilidades
(
    ClasseId INT NOT NULL FOREIGN KEY REFERENCES Classes(ClasseId)
    ,HabilidadeId INT NOT NULL FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
    ,PRIMARY KEY (ClasseId, HabilidadeId)
);
GO

-- =====================================================
-- 5. Conferência das tabelas criadas
-- =====================================================
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
GO
