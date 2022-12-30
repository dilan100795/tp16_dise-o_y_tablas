-- MySQL Script generado por MySQL Workbench
-- Dom 2 de octubre 17:59:42 2022
-- Modelo: Nuevo Modelo Versión: 1.0
-- Ingeniería avanzada de MySQL Workbench

SET @CHEQUES_UNICOS_ANTIGUOS = @@CHEQUES_UNICOS, CHEQUES_UNICOS = 0 ;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 ;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = ' ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION ' ;

-- ------------------------------------------------ -----
-- Esquema mydb
-- ------------------------------------------------ -----

-- ------------------------------------------------ -----
-- Esquema mydb
-- ------------------------------------------------ -----
CREAR  ESQUEMA  SI NO EXISTE ` mydb` CONJUNTO DE CARACTERES POR DEFECTO utf8 ;
-- ------------------------------------------------ -----
-- Juegos de esquema
-- ------------------------------------------------ -----
UTILIZAR ` mibd` ; _

-- ------------------------------------------------ -----
-- Tabla `mydb`.`categorias`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` categorías ` (
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` nombre `  VARCHAR ( 50 ) NO NULO ,
  CLAVE PRINCIPAL ( ` id ` ),
  ÍNDICE ÚNICO ` id_ÚNICO ` ( ` id `  ASC ) VISIBLE,
  ÍNDICE ÚNICO ` categoría_ÚNICO` ( ` nombre `  ASC ) VISIBLE )
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mydb`.`usuarios`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` usuarios ` (
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` nombre `  VARCHAR ( 50 ) NO NULO ,
  ` apellido `  VARCHAR ( 50 ) NOT NULL ,
  ` correo electrónico` VARCHAR  ( 200 ) NO NULO ,
  ` contraseña `  VARCHAR ( 50 ) NO NULO ,
  ` categorias_id `  INT UNSIGNED NOT NULL ,
  ÍNDICE ÚNICO ` id_ÚNICO ` ( ` id `  ASC ) VISIBLE,
  ÍNDICE ÚNICO ` email_UNIQUE ` ( ` email `  ASC ) VISIBLE,
  ÍNDICE ` fk_usuarios_categorias_idx ` ( ` categorias_id `  ASC ) VISIBLE,
  CLAVE PRINCIPAL ( ` id ` ),
  CONSTRAINT  ` fk_usuarios_categorias` _
    CLAVE EXTRANJERA ( ` categorias_id ` )
    REFERENCIAS  ` mydb` . _ ` categorías ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN)
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mydb`.`cursos`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` cursos` ( _
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` título `  VARCHAR ( 45 ) NO NULO ,
  ` descripción `  VARCHAR ( 600 ) NO NULO ,
  ` imagen `  VARCHAR ( 150 ) NO NULO ,
  ` fecha_de_inicio `  FECHA  NO NULA ,
  ` fecha de finalización `  DATE  NOT NULL ,
  ` cupo_max `  INT SIN FIRMAR NO NULO ,
  ` unidad_id `  INT UNSIGNED NOT NULL ,
  CLAVE PRINCIPAL ( ` id ` ),
  ÍNDICE ÚNICO ` id_ÚNICO ` ( ` id `  ASC ) VISIBLE)
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mydb`.`unidades`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` unidades ` (
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` título `  VARCHAR ( 50 ) NO NULO ,
  ` descripción `  VARCHAR ( 600 ) NO NULO ,
  ` fecha_de_inicio `  FECHA  NO NULA ,
  ` cursos_id `  INT UNSIGNED NOT NULL ,
  CLAVE PRINCIPAL ( ` id ` ),
  ÍNDICE ÚNICO ` id_ÚNICO ` ( ` id `  ASC ) VISIBLE,
  ÍNDICE ` fk_unidades_cursos1_idx ` ( ` cursos_id `  ASC ) VISIBLE,
  CONSTRAINT  ` fk_unidades_cursos1 `
    CLAVE EXTRANJERA ( ` cursos_id ` )
    REFERENCIAS  ` mydb` . _ ` cursos ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN)
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mydb`.`usuarios_cursos`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` usuarios_cursos ` (
  ` id `  INT UNSIGNED NOT NULL ,
  ` cursos_id `  INT UNSIGNED NOT NULL ,
  ` usuarios_id `  INT UNSIGNED NOT NULL ,
  CLAVE PRINCIPAL ( ` id ` ),
  ÍNDICE ` fk_usuarios_cursos_cursos1_idx ` ( ` cursos_id `  ASC ) VISIBLE,
  ÍNDICE ` fk_usuarios_cursos_usuarios1_idx ` ( ` usuarios_id `  ASC ) VISIBLE,
  CONSTRAINT  ` fk_usuarios_cursos_cursos1 `
    CLAVE EXTRANJERA ( ` cursos_id ` )
    REFERENCIAS  ` mydb` . _ ` cursos ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN,
  CONSTRAINT  ` fk_usuarios_cursos_usuarios1 `
    CLAVE EXTRANJERA ( ` usuarios_id ` )
    REFERENCIAS  ` mydb` . _ ` usuarios ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN)
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mydb`.`clases`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` clases` ( _
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` título `  VARCHAR ( 45 ) NO NULO ,
  ` descripción `  VARCHAR ( 600 ) NO NULO ,
  ` fecha_de_inicio `  FECHA  NO NULA ,
  ` marca_visibilidad ` TINYINT UNSIGNED NOT NULL ,
  ` unidades_id `  INT UNSIGNED NOT NULL ,
  CLAVE PRINCIPAL ( ` id ` ),
  ÍNDICE ` fk_clases_unidades1_idx ` ( ` unidades_id `  ASC ) VISIBLE,
  CONSTRAINT  ` fk_clases_unidades1 `
    CLAVE EXTRANJERA ( ` unidades_id ` )
    REFERENCIAS  ` mydb` . _ ` unidades ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN)
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mibd`.`tipo`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` tipo ` (
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` nombre `  VARCHAR ( 45 ) NO NULO ,
  CLAVE PRIMARIA ( ` id ` ))
MOTOR = InnoDB;


-- ------------------------------------------------ -----
-- Tabla `mydb`.`bloques`
-- ------------------------------------------------ -----
CREAR  TABLA  SI NO EXISTE ` mydb` . ` bloques ` (
  ` id `  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ` título `  VARCHAR ( 45 ) NO NULO ,
  ` marca_visibilidad ` TINYINT NOT NULL ,
  ` clases_id `  INT UNSIGNED NOT NULL ,
  ` type_id `  INT UNSIGNED NOT NULL ,
  ` contenido `  VARCHAR ( 400 ) NO NULO ,
  CLAVE PRINCIPAL ( ` id ` ),
  ÍNDICE ` fk_bloques_clases1_idx ` ( ` clases_id `  ASC ) VISIBLE,
  ÍNDICE ` fk_bloques_type1_idx ` ( ` type_id `  ASC ) VISIBLE,
   RESTRICCIÓN ` fk_bloques_clases1 `
    CLAVE EXTRANJERA ( ` clases_id ` )
    REFERENCIAS  ` mydb` . _ ` clases ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN,
   RESTRICCIÓN ` fk_bloques_type1 `
    CLAVE EXTRANJERA ( ` type_id ` )
    REFERENCIAS  ` mydb` . _ ` tipo ` ( ` id ` )
    EN ELIMINAR SIN ACCIÓN
    EN LA  ACTUALIZACIÓN SIN ACCIÓN)
MOTOR = InnoDB;


ESTABLECER SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
ESTABLECER CHEQUES_ÚNICOS = @CHEQUES_ÚNICOS_ANTIGUOS;