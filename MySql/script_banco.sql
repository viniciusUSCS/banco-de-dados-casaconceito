-- MySQL Script generated by MySQL Workbench
-- Wed Sep 28 18:10:58 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`agenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`agenda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`agenda` (
  `idagenda` INT NOT NULL,
  `dataatual` VARCHAR(45) NOT NULL,
  `feedback` LONGTEXT NULL,
  PRIMARY KEY (`idagenda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comissao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`comissao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`comissao` (
  `idcomissao` INT NOT NULL,
  `nivel1` FLOAT NULL,
  `nivel2` FLOAT NULL,
  `nivel3` FLOAT NULL,
  `desiger_iddesiger` INT NOT NULL,
  `desiger_usuario_idusuario` INT NOT NULL,
  `desiger_usuario_pessoa_cpf` VARCHAR(90) NOT NULL,
  `desiger_usuario_pessoa_idpessoa` INT NOT NULL,
  PRIMARY KEY (`idcomissao`, `desiger_iddesiger`, `desiger_usuario_idusuario`, `desiger_usuario_pessoa_cpf`, `desiger_usuario_pessoa_idpessoa`),
  INDEX `fk_comissao_desiger1_idx` (`desiger_iddesiger` ASC, `desiger_usuario_idusuario` ASC, `desiger_usuario_pessoa_cpf` ASC, `desiger_usuario_pessoa_idpessoa` ASC) VISIBLE,
  CONSTRAINT `fk_comissao_desiger1`
    FOREIGN KEY (`desiger_iddesiger` , `desiger_usuario_idusuario` , `desiger_usuario_pessoa_cpf` , `desiger_usuario_pessoa_idpessoa`)
    REFERENCES `mydb`.`desiger` (`iddesiger` , `usuario_idusuario` , `usuario_pessoa_cpf` , `usuario_pessoa_idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`desiger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`desiger` ;

CREATE TABLE IF NOT EXISTS `mydb`.`desiger` (
  `iddesiger` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `unidade` VARCHAR(90) NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `usuario_pessoa_cpf` VARCHAR(90) NOT NULL,
  `usuario_pessoa_idpessoa` INT NOT NULL,
  PRIMARY KEY (`iddesiger`, `usuario_idusuario`, `usuario_pessoa_cpf`, `usuario_pessoa_idpessoa`),
  INDEX `fk_desiger_usuario1_idx` (`usuario_idusuario` ASC, `usuario_pessoa_cpf` ASC, `usuario_pessoa_idpessoa` ASC) VISIBLE,
  CONSTRAINT `fk_desiger_usuario1`
    FOREIGN KEY (`usuario_idusuario` , `usuario_pessoa_cpf` , `usuario_pessoa_idpessoa`)
    REFERENCES `mydb`.`usuario` (`idusuario` , `pessoa_cpf` , `pessoa_idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '								';


-- -----------------------------------------------------
-- Table `mydb`.`empreendimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`empreendimento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`empreendimento` (
  `idempreendimento` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `logradouro` VARCHAR(90) NOT NULL,
  `numero` VARCHAR(90) NOT NULL,
  `metrosquadrados` VARCHAR(90) NOT NULL,
  `cidade` VARCHAR(90) NOT NULL,
  `uf` VARCHAR(90) NOT NULL,
  `incorporadora` VARCHAR(90) NOT NULL,
  `papelpessoa_idpapelpessoa` INT NOT NULL,
  `papelpessoa_pessoa_cpf` VARCHAR(90) NOT NULL,
  `papelpessoa_pessoa_idpessoa` INT NOT NULL,
  `papelpessoa_pessoa_lead_idlead` INT NOT NULL,
  `organizacao_idorganizacao` INT NOT NULL,
  `organizacao_cnpj` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`idempreendimento`, `papelpessoa_idpapelpessoa`, `papelpessoa_pessoa_cpf`, `papelpessoa_pessoa_idpessoa`, `papelpessoa_pessoa_lead_idlead`, `organizacao_idorganizacao`, `organizacao_cnpj`),
  INDEX `fk_empreendimento_papelpessoa1_idx` (`papelpessoa_idpapelpessoa` ASC, `papelpessoa_pessoa_cpf` ASC, `papelpessoa_pessoa_idpessoa` ASC, `papelpessoa_pessoa_lead_idlead` ASC) VISIBLE,
  INDEX `fk_empreendimento_organizacao1_idx` (`organizacao_idorganizacao` ASC, `organizacao_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_empreendimento_papelpessoa1`
    FOREIGN KEY (`papelpessoa_idpapelpessoa` , `papelpessoa_pessoa_cpf` , `papelpessoa_pessoa_idpessoa` , `papelpessoa_pessoa_lead_idlead`)
    REFERENCES `mydb`.`papelpessoa` (`idpapelpessoa` , `pessoa_cpf` , `pessoa_idpessoa` , `pessoa_lead_idlead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empreendimento_organizacao1`
    FOREIGN KEY (`organizacao_idorganizacao` , `organizacao_cnpj`)
    REFERENCES `mydb`.`organizacao` (`idorganizacao` , `cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `idendereco` INT NOT NULL,
  `idtipologradouro` VARCHAR(90) NOT NULL,
  `idlogradouro` VARCHAR(90) NOT NULL,
  `numero` INT NOT NULL,
  `cep` INT NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `pessoa_cpf` VARCHAR(90) NOT NULL,
  `pessoa_idpessoa` INT NOT NULL,
  `pessoa_lead_idlead` INT NOT NULL,
  `tipologra_idtipologra` INT NOT NULL,
  PRIMARY KEY (`idendereco`, `pessoa_cpf`, `pessoa_idpessoa`, `pessoa_lead_idlead`, `tipologra_idtipologra`),
  INDEX `fk_endereco_pessoa1_idx` (`pessoa_cpf` ASC, `pessoa_idpessoa` ASC, `pessoa_lead_idlead` ASC) VISIBLE,
  INDEX `fk_endereco_tipologra1_idx` (`tipologra_idtipologra` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_pessoa1`
    FOREIGN KEY (`pessoa_cpf` , `pessoa_idpessoa` , `pessoa_lead_idlead`)
    REFERENCES `mydb`.`pessoa` (`cpf` , `idpessoa` , `lead_idlead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_tipologra1`
    FOREIGN KEY (`tipologra_idtipologra`)
    REFERENCES `mydb`.`tipologra` (`idtipologra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`feedback` ;

CREATE TABLE IF NOT EXISTS `mydb`.`feedback` (
  `idfeedback` INT NOT NULL,
  `descricao` VARCHAR(250) NULL,
  `agenda_idagenda` INT NOT NULL,
  `pessoa_cpf` VARCHAR(90) NOT NULL,
  `pessoa_idpessoa` INT NOT NULL,
  `pessoa_lead_idlead` INT NOT NULL,
  PRIMARY KEY (`idfeedback`, `agenda_idagenda`, `pessoa_cpf`, `pessoa_idpessoa`, `pessoa_lead_idlead`),
  INDEX `fk_feedback_agenda1_idx` (`agenda_idagenda` ASC) VISIBLE,
  INDEX `fk_feedback_pessoa1_idx` (`pessoa_cpf` ASC, `pessoa_idpessoa` ASC, `pessoa_lead_idlead` ASC) VISIBLE,
  CONSTRAINT `fk_feedback_agenda1`
    FOREIGN KEY (`agenda_idagenda`)
    REFERENCES `mydb`.`agenda` (`idagenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_pessoa1`
    FOREIGN KEY (`pessoa_cpf` , `pessoa_idpessoa` , `pessoa_lead_idlead`)
    REFERENCES `mydb`.`pessoa` (`cpf` , `idpessoa` , `lead_idlead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`incorporadora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`incorporadora` ;

CREATE TABLE IF NOT EXISTS `mydb`.`incorporadora` (
  `idincorporadora` INT NOT NULL,
  `nome` VARCHAR(90) NULL,
  `empreendimento_idempreendimento` INT NOT NULL,
  `empreendimento_papelpessoa_idpapelpessoa` INT NOT NULL,
  `empreendimento_papelpessoa_pessoa_cpf` VARCHAR(90) NOT NULL,
  `empreendimento_papelpessoa_pessoa_idpessoa` INT NOT NULL,
  `empreendimento_papelpessoa_pessoa_lead_idlead` INT NOT NULL,
  `empreendimento_organizacao_idorganizacao` INT NOT NULL,
  `empreendimento_organizacao_cnpj` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`idincorporadora`, `empreendimento_idempreendimento`, `empreendimento_papelpessoa_idpapelpessoa`, `empreendimento_papelpessoa_pessoa_cpf`, `empreendimento_papelpessoa_pessoa_idpessoa`, `empreendimento_papelpessoa_pessoa_lead_idlead`, `empreendimento_organizacao_idorganizacao`, `empreendimento_organizacao_cnpj`),
  INDEX `fk_incorporadora_empreendimento1_idx` (`empreendimento_idempreendimento` ASC, `empreendimento_papelpessoa_idpapelpessoa` ASC, `empreendimento_papelpessoa_pessoa_cpf` ASC, `empreendimento_papelpessoa_pessoa_idpessoa` ASC, `empreendimento_papelpessoa_pessoa_lead_idlead` ASC, `empreendimento_organizacao_idorganizacao` ASC, `empreendimento_organizacao_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_incorporadora_empreendimento1`
    FOREIGN KEY (`empreendimento_idempreendimento` , `empreendimento_papelpessoa_idpapelpessoa` , `empreendimento_papelpessoa_pessoa_cpf` , `empreendimento_papelpessoa_pessoa_idpessoa` , `empreendimento_papelpessoa_pessoa_lead_idlead` , `empreendimento_organizacao_idorganizacao` , `empreendimento_organizacao_cnpj`)
    REFERENCES `mydb`.`empreendimento` (`idempreendimento` , `papelpessoa_idpapelpessoa` , `papelpessoa_pessoa_cpf` , `papelpessoa_pessoa_idpessoa` , `papelpessoa_pessoa_lead_idlead` , `organizacao_idorganizacao` , `organizacao_cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `mydb`.`lead`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`lead` ;

CREATE TABLE IF NOT EXISTS `mydb`.`lead` (
  `idlead` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone1` VARCHAR(15) NOT NULL,
  `telefone2` VARCHAR(15) NULL,
  `datahora` VARCHAR(20) NULL,
  `observacao` LONGTEXT NULL,
  `organizacao_idorganizacao` INT NOT NULL,
  `organizacao_cnpj` VARCHAR(90) NOT NULL,
  `statuslead_idstatuslead` INT NOT NULL,
  PRIMARY KEY (`idlead`, `organizacao_idorganizacao`, `organizacao_cnpj`, `statuslead_idstatuslead`),
  INDEX `fk_lead_organizacao1_idx` (`organizacao_idorganizacao` ASC, `organizacao_cnpj` ASC) VISIBLE,
  INDEX `fk_lead_statuslead1_idx` (`statuslead_idstatuslead` ASC) VISIBLE,
  CONSTRAINT `fk_lead_organizacao1`
    FOREIGN KEY (`organizacao_idorganizacao` , `organizacao_cnpj`)
    REFERENCES `mydb`.`organizacao` (`idorganizacao` , `cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lead_statuslead1`
    FOREIGN KEY (`statuslead_idstatuslead`)
    REFERENCES `mydb`.`statuslead` (`idstatuslead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`organizacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`organizacao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`organizacao` (
  `idorganizacao` INT NOT NULL,
  `razaosocial` VARCHAR(90) NOT NULL,
  `cnpj` VARCHAR(90) NOT NULL,
  `ie` VARCHAR(90) NULL,
  `logradouro` VARCHAR(90) NOT NULL,
  `nometitular` VARCHAR(90) NULL,
  `telefone1` VARCHAR(90) NOT NULL,
  `telefone2` VARCHAR(90) NULL,
  `site` VARCHAR(90) NULL,
  `email` VARCHAR(90) NOT NULL,
  `ramoatividade` VARCHAR(90) NULL,
  `feedback_idfeedback` INT NOT NULL,
  `feedback_agenda_idagenda` INT NOT NULL,
  `feedback_pessoa_cpf` VARCHAR(90) NOT NULL,
  `feedback_pessoa_idpessoa` INT NOT NULL,
  `feedback_pessoa_lead_idlead` INT NOT NULL,
  PRIMARY KEY (`idorganizacao`, `cnpj`, `feedback_idfeedback`, `feedback_agenda_idagenda`, `feedback_pessoa_cpf`, `feedback_pessoa_idpessoa`, `feedback_pessoa_lead_idlead`),
  INDEX `fk_organizacao_feedback1_idx` (`feedback_idfeedback` ASC, `feedback_agenda_idagenda` ASC, `feedback_pessoa_cpf` ASC, `feedback_pessoa_idpessoa` ASC, `feedback_pessoa_lead_idlead` ASC) VISIBLE,
  CONSTRAINT `fk_organizacao_feedback1`
    FOREIGN KEY (`feedback_idfeedback` , `feedback_agenda_idagenda` , `feedback_pessoa_cpf` , `feedback_pessoa_idpessoa` , `feedback_pessoa_lead_idlead`)
    REFERENCES `mydb`.`feedback` (`idfeedback` , `agenda_idagenda` , `pessoa_cpf` , `pessoa_idpessoa` , `pessoa_lead_idlead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`papelpessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`papelpessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`papelpessoa` (
  `idpapelpessoa` INT NOT NULL,
  `administrador` VARCHAR(90) NOT NULL,
  `cliente` VARCHAR(90) NOT NULL,
  `captador` VARCHAR(90) NOT NULL,
  `gerente` VARCHAR(90) NOT NULL,
  `supervisor` VARCHAR(90) NOT NULL,
  `designer` VARCHAR(90) NOT NULL,
  `pessoa_cpf` VARCHAR(90) NOT NULL,
  `pessoa_idpessoa` INT NOT NULL,
  `pessoa_lead_idlead` INT NOT NULL,
  PRIMARY KEY (`idpapelpessoa`, `pessoa_cpf`, `pessoa_idpessoa`, `pessoa_lead_idlead`),
  INDEX `fk_papelpessoa_pessoa1_idx` (`pessoa_cpf` ASC, `pessoa_idpessoa` ASC, `pessoa_lead_idlead` ASC) VISIBLE,
  CONSTRAINT `fk_papelpessoa_pessoa1`
    FOREIGN KEY (`pessoa_cpf` , `pessoa_idpessoa` , `pessoa_lead_idlead`)
    REFERENCES `mydb`.`pessoa` (`cpf` , `idpessoa` , `lead_idlead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '								';


-- -----------------------------------------------------
-- Table `mydb`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`perfil` ;

CREATE TABLE IF NOT EXISTS `mydb`.`perfil` (
  `idperfil` INT NOT NULL,
  `master` VARCHAR(90) NOT NULL,
  `gerente` VARCHAR(90) NOT NULL,
  `supervisor` VARCHAR(90) NOT NULL,
  `captador` VARCHAR(90) NOT NULL,
  `desiger` VARCHAR(90) NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `usuario_pessoa_cpf` VARCHAR(90) NOT NULL,
  `usuario_pessoa_idpessoa` INT NOT NULL,
  PRIMARY KEY (`idperfil`, `usuario_idusuario`, `usuario_pessoa_cpf`, `usuario_pessoa_idpessoa`),
  INDEX `fk_perfil_usuario1_idx` (`usuario_idusuario` ASC, `usuario_pessoa_cpf` ASC, `usuario_pessoa_idpessoa` ASC) VISIBLE,
  CONSTRAINT `fk_perfil_usuario1`
    FOREIGN KEY (`usuario_idusuario` , `usuario_pessoa_cpf` , `usuario_pessoa_idpessoa`)
    REFERENCES `mydb`.`usuario` (`idusuario` , `pessoa_cpf` , `pessoa_idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `idpessoa` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `rg` VARCHAR(90) NOT NULL,
  `cpf` VARCHAR(90) NOT NULL,
  `datanasc` VARCHAR(90) NOT NULL,
  `sexo` VARCHAR(90) NULL,
  `email` VARCHAR(90) NULL,
  `cel1` VARCHAR(90) NOT NULL,
  `cel2` VARCHAR(90) NULL,
  `facebook` VARCHAR(90) NULL,
  `instagram` VARCHAR(90) NULL,
  `lead_idlead` INT NOT NULL,
  PRIMARY KEY (`cpf`, `idpessoa`, `lead_idlead`),
  INDEX `fk_pessoa_lead1_idx` (`lead_idlead` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_lead1`
    FOREIGN KEY (`lead_idlead`)
    REFERENCES `mydb`.`lead` (`idlead`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`statuslead`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`statuslead` ;

CREATE TABLE IF NOT EXISTS `mydb`.`statuslead` (
  `idstatuslead` INT NOT NULL,
  `aberto` VARCHAR(45) NOT NULL,
  `fechado` VARCHAR(45) NOT NULL,
  `andamento` VARCHAR(45) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`idstatuslead`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipoendereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tipoendereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipoendereco` (
  `idtipoendereco` INT NOT NULL,
  `comercial` VARCHAR(90) NOT NULL,
  `residencial` VARCHAR(90) NOT NULL,
  `tipologra_idtipologra` INT NOT NULL,
  PRIMARY KEY (`idtipoendereco`, `tipologra_idtipologra`),
  INDEX `fk_tipoendereco_tipologra1_idx` (`tipologra_idtipologra` ASC) VISIBLE,
  CONSTRAINT `fk_tipoendereco_tipologra1`
    FOREIGN KEY (`tipologra_idtipologra`)
    REFERENCES `mydb`.`tipologra` (`idtipologra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	\n\n\n\n\n';


-- -----------------------------------------------------
-- Table `mydb`.`tipologra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tipologra` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tipologra` (
  `idtipologra` INT NOT NULL,
  `rua` VARCHAR(90) NULL,
  `avenida` VARCHAR(90) NULL,
  `estrada` VARCHAR(90) NULL,
  `viela` VARCHAR(90) NULL,
  `beco` VARCHAR(90) NULL,
  `completmento` LONGTEXT NULL,
  PRIMARY KEY (`idtipologra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`unidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`unidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`unidade` (
  `idunidade` INT NOT NULL,
  `abc` VARCHAR(90) NOT NULL,
  `moema` VARCHAR(90) NOT NULL,
  `pinheiros` VARCHAR(90) NOT NULL,
  `desiger_iddesiger` INT NOT NULL,
  `desiger_usuario_idusuario` INT NOT NULL,
  `desiger_usuario_pessoa_cpf` VARCHAR(90) NOT NULL,
  `desiger_usuario_pessoa_idpessoa` INT NOT NULL,
  PRIMARY KEY (`idunidade`, `desiger_iddesiger`, `desiger_usuario_idusuario`, `desiger_usuario_pessoa_cpf`, `desiger_usuario_pessoa_idpessoa`),
  INDEX `fk_unidade_desiger1_idx` (`desiger_iddesiger` ASC, `desiger_usuario_idusuario` ASC, `desiger_usuario_pessoa_cpf` ASC, `desiger_usuario_pessoa_idpessoa` ASC) VISIBLE,
  CONSTRAINT `fk_unidade_desiger1`
    FOREIGN KEY (`desiger_iddesiger` , `desiger_usuario_idusuario` , `desiger_usuario_pessoa_cpf` , `desiger_usuario_pessoa_idpessoa`)
    REFERENCES `mydb`.`desiger` (`iddesiger` , `usuario_idusuario` , `usuario_pessoa_cpf` , `usuario_pessoa_idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`unigeo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`unigeo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`unigeo` (
  `idunigeo` INT NOT NULL,
  `cidade` VARCHAR(90) NOT NULL,
  `descricao` VARCHAR(90) NULL,
  `tipologra_idtipologra` INT NOT NULL,
  PRIMARY KEY (`idunigeo`, `tipologra_idtipologra`),
  INDEX `fk_unigeo_tipologra1_idx` (`tipologra_idtipologra` ASC) VISIBLE,
  CONSTRAINT `fk_unigeo_tipologra1`
    FOREIGN KEY (`tipologra_idtipologra`)
    REFERENCES `mydb`.`tipologra` (`idtipologra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `pessoa_cpf` VARCHAR(90) NOT NULL,
  `pessoa_idpessoa` INT NOT NULL,
  PRIMARY KEY (`idusuario`, `pessoa_cpf`, `pessoa_idpessoa`),
  INDEX `fk_usuario_pessoa_idx` (`pessoa_cpf` ASC, `pessoa_idpessoa` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pessoa`
    FOREIGN KEY (`pessoa_cpf` , `pessoa_idpessoa`)
    REFERENCES `mydb`.`pessoa` (`cpf` , `idpessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
