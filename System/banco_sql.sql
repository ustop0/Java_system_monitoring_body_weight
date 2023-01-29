-- MySQL Script generated by MySQL Workbench
-- Wed 20 Oct 2021 07:45:05 PM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_patp7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_patp7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_patp7` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd_patp7` ;

-- -----------------------------------------------------
-- Table `bd_patp7`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_patp7`.`login` (
  `cod_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `ativo` VARCHAR(1) NULL DEFAULT 'A',
  PRIMARY KEY (`cod_usuario`),
  UNIQUE INDEX `nome_usuario_UNIQUE` (`nome_usuario` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_patp7`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_patp7`.`pessoa` (
  `cod_pessoa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `sexo` VARCHAR(1) NULL DEFAULT NULL,
  `altura` DECIMAL(3,2) NULL DEFAULT NULL,
  `peso` DECIMAL(6,3) NULL DEFAULT NULL,
  `data_medicao` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `ativ_fisica` VARCHAR(1) NULL DEFAULT NULL,
  `ativ_frequencia` VARCHAR(1) NULL,
  `bebidas_alcool` VARCHAR(1) NULL DEFAULT NULL,
  `bebidas_frequencia` VARCHAR(1) NULL,
  `alimentacao` VARCHAR(1) NULL DEFAULT NULL,
  `alimentacao_tipo` VARCHAR(1) NULL,
  `fumante` VARCHAR(1) NULL DEFAULT NULL,
  `doenca` VARCHAR(1) NULL DEFAULT NULL,
  `doenca_nome` VARCHAR(1) NULL,
  `medicamentos` VARCHAR(1) NULL DEFAULT NULL,
  `jornada_trabalho` VARCHAR(1) NULL DEFAULT NULL,
  `forma_trabalho` VARCHAR(1) NULL,
  `ativ_diaria` VARCHAR(1) NULL DEFAULT NULL,
  `ativo` VARCHAR(1) NULL DEFAULT 'A',
  PRIMARY KEY (`cod_pessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_patp7`.`questionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_patp7`.`questionario` (
  `cod_questionario` INT NOT NULL AUTO_INCREMENT,
  `data_preenchimento` DATE NULL DEFAULT NULL,
  `peso` DECIMAL(6,3) NULL DEFAULT NULL,
  `status` VARCHAR(1) NULL DEFAULT NULL,
  `ocorrencia` VARCHAR(1) NULL DEFAULT NULL,
  `comentario` TEXT NULL,
  `ativo` VARCHAR(1) NULL DEFAULT 'A',
  `pessoa_cod_pessoa` INT NOT NULL,
  PRIMARY KEY (`cod_questionario`, `pessoa_cod_pessoa`),
  INDEX `fk_questionario_pessoa_idx` (`pessoa_cod_pessoa` ASC) VISIBLE,
  CONSTRAINT `fk_questionario_pessoa`
    FOREIGN KEY (`pessoa_cod_pessoa`)
    REFERENCES `bd_patp7`.`pessoa` (`cod_pessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
