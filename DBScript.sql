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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`educacion` (
  `id_educacion` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_educacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia_laboral` (
  `id_exp_lab` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `experiencia_laboralcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_exp_lab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyectos` (
  `id_proyecto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `tags` VARCHAR(45) NULL,
  PRIMARY KEY (`id_proyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `educacion_id_educacion` INT NOT NULL,
  `experiencia_laboral_id_exp_lab` INT NOT NULL,
  `proyectos_id_proyecto` INT NOT NULL,
  PRIMARY KEY (`id_persona`),
  INDEX `fk_persona_educacion_idx` (`educacion_id_educacion` ASC) VISIBLE,
  INDEX `fk_persona_experiencia_laboral1_idx` (`experiencia_laboral_id_exp_lab` ASC) VISIBLE,
  INDEX `fk_persona_proyectos1_idx` (`proyectos_id_proyecto` ASC) VISIBLE,
  CONSTRAINT `fk_persona_educacion`
    FOREIGN KEY (`educacion_id_educacion`)
    REFERENCES `mydb`.`educacion` (`id_educacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_experiencia_laboral1`
    FOREIGN KEY (`experiencia_laboral_id_exp_lab`)
    REFERENCES `mydb`.`experiencia_laboral` (`id_exp_lab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_proyectos1`
    FOREIGN KEY (`proyectos_id_proyecto`)
    REFERENCES `mydb`.`proyectos` (`id_proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`domicilio` (
  `id_domicilio` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_domicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `domicilio_id_domicilio` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuarios_domicilio1_idx` (`domicilio_id_domicilio` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_domicilio1`
    FOREIGN KEY (`domicilio_id_domicilio`)
    REFERENCES `mydb`.`domicilio` (`id_domicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tecnologias` (
  `id_tecnologia` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tecnologia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proyectos_has_tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyectos_has_tecnologias` (
  `proyectos_id_proyecto` INT NOT NULL,
  `tecnologias_id_tecnologia` INT NOT NULL,
  PRIMARY KEY (`proyectos_id_proyecto`, `tecnologias_id_tecnologia`),
  INDEX `fk_proyectos_has_tecnologias_tecnologias1_idx` (`tecnologias_id_tecnologia` ASC) VISIBLE,
  INDEX `fk_proyectos_has_tecnologias_proyectos1_idx` (`proyectos_id_proyecto` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_has_tecnologias_proyectos1`
    FOREIGN KEY (`proyectos_id_proyecto`)
    REFERENCES `mydb`.`proyectos` (`id_proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyectos_has_tecnologias_tecnologias1`
    FOREIGN KEY (`tecnologias_id_tecnologia`)
    REFERENCES `mydb`.`tecnologias` (`id_tecnologia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
