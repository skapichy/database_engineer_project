-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemonDB` ;
USE `little_lemonDB` ;

-- -----------------------------------------------------
-- Table `little_lemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemonDB`.`MenuItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`MenuItem` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  `StarterName` VARCHAR(255) NOT NULL,
  `DessertName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  `MenuItemID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menuitem_id_fk_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `menuitem_id_fk`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `little_lemonDB`.`MenuItem` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemonDB`.`Customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemonDB`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemonDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemonDB`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemonDB`.`Booking` (
  `BookingID` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `little_lemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
