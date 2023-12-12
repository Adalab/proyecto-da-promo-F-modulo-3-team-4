-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empleados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empleados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empleados` DEFAULT CHARACTER SET utf8 ;
USE `empleados` ;

-- -----------------------------------------------------
-- Table `empleados`.`salarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleados`.`salarios` (
  `employee_number` INT NOT NULL,
  `monthly_rate` INT NULL,
  `percent_salary_hike` INT NULL,
  `hourly_rate` FLOAT NULL,
  `daily_rate` FLOAT NULL,
  `monthly_income` FLOAT NULL,
  PRIMARY KEY (`employee_number`),
  UNIQUE INDEX `employee_number_UNIQUE` (`employee_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleados`.`valoraciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleados`.`valoraciones` (
  `employee_number` INT NOT NULL,
  `environment_satisfaction` INT NULL,
  `job_involvement` INT NULL,
  `job_satisfaction` INT NULL,
  `performance_rating` FLOAT NULL,
  `relationship_satisfaction` INT NULL,
  ` work_life_balance` FLOAT NULL,
  PRIMARY KEY (`employee_number`),
  UNIQUE INDEX `employee_number_UNIQUE` (`employee_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleados`.`gestión_interna_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleados`.`gestión_interna_empresa` (
  `employee_number` INT NOT NULL,
  `attrition` VARCHAR(45) NULL,
  `business_travel` VARCHAR(45) NULL,
  `department` VARCHAR(45) NULL,
  `job_level` INT NULL,
  `job_role` VARCHAR(45) NULL,
  `overtime` VARCHAR(45) NULL,
  `stock_option_level` INT NULL,
  `training_times_last_year` INT NULL,
  ` years_at_company` INT NULL,
  `years_since_last_promotion` INT NULL,
  `years_with_curr_manager` INT NULL,
  `remote_work` VARCHAR(45) NULL,
  PRIMARY KEY (`employee_number`),
  UNIQUE INDEX `employee_number_UNIQUE` (`employee_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleados`.`datos_personales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleados`.`datos_personales` (
  `employee_number` INT NOT NULL,
  `age` INT NOT NULL,
  `date_birth` INT NULL,
  `gender` VARCHAR(45) NULL,
  `marital_status` VARCHAR(45) NULL,
  `distance_from_home` FLOAT NULL,
  `num_companies_worked` INT NULL,
  `total_working_years` INT NULL,
  `education` VARCHAR(45) NULL,
  `education_field` VARCHAR(45) NULL,
  `salarios_employee_number` INT NOT NULL,
  `valoraciones_employee_number` INT NOT NULL,
  `gestión_interna_empresa_employee_number` INT NOT NULL,
  PRIMARY KEY (`employee_number`, `salarios_employee_number`, `valoraciones_employee_number`, `gestión_interna_empresa_employee_number`),
  UNIQUE INDEX `employee_number_UNIQUE` (`employee_number` ASC) VISIBLE,
  INDEX `fk_datos_personales_salarios_idx` (`salarios_employee_number` ASC) VISIBLE,
  INDEX `fk_datos_personales_valoraciones1_idx` (`valoraciones_employee_number` ASC) VISIBLE,
  INDEX `fk_datos_personales_gestión_interna_empresa1_idx` (`gestión_interna_empresa_employee_number` ASC) VISIBLE,
  CONSTRAINT `fk_datos_personales_salarios`
    FOREIGN KEY (`salarios_employee_number`)
    REFERENCES `empleados`.`salarios` (`employee_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_personales_valoraciones1`
    FOREIGN KEY (`valoraciones_employee_number`)
    REFERENCES `empleados`.`valoraciones` (`employee_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_personales_gestión_interna_empresa1`
    FOREIGN KEY (`gestión_interna_empresa_employee_number`)
    REFERENCES `empleados`.`gestión_interna_empresa` (`employee_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `empleados` ;

-- -----------------------------------------------------
-- Placeholder table for view `empleados`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleados`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `empleados`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `empleados`.`view1`;
USE `empleados`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
