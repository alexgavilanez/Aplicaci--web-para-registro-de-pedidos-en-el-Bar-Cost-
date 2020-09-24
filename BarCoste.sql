/* RelacionalBarCoste: */
CREATE DATABASE BarCoste;
USE BarCoste;
CREATE TABLE Bebidas (
    id_bebida INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    precio FLOAT
);

CREATE TABLE Ingredientes (
    id_ingrediente INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    stock INTEGER
);

CREATE TABLE Bebidas_Ingredientes (
    id_bebida_ingrediente INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Fk_id_bebida INTEGER,
    Fk_id_ingrediente INTEGER
);

CREATE TABLE Persona (
    cedula VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(50),
    fecha_nacimiento DATE
);

CREATE TABLE Administrador (
    id_administrador INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cedula VARCHAR(50),
    sueldo FLOAT,
    hora_entrada DATE,
    hora_salida DATE,
    usuario VARCHAR(50),
    contraseña VARCHAR(50)
);

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Fk_cedula VARCHAR(50),
    bebida_favorita VARCHAR(50),
    usuario VARCHAR(50),
    contraseña VARCHAR(50)
);

CREATE TABLE Cliente_Consumo (
    id_cli_consumo INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Fk_id_cliente INTEGER,
    Fk_id_bebida INTEGER,
    fecha_consumo DATE,
    valor_consumo FLOAT
);
 
ALTER TABLE Bebidas_Ingredientes ADD CONSTRAINT FK_Bebidas_Ingredientes_2
    FOREIGN KEY (Fk_id_bebida) REFERENCES Bebidas (id_bebida);
    
ALTER TABLE Bebidas_Ingredientes ADD CONSTRAINT FK_Bebidas_Ingredientes_3    
    FOREIGN KEY (Fk_id_ingrediente)REFERENCES Ingredientes (id_ingrediente);
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_2
    FOREIGN KEY (cedula)
    REFERENCES Persona (cedula);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (Fk_cedula)
    REFERENCES Persona (cedula);
 
ALTER TABLE Cliente_Consumo ADD CONSTRAINT FK_Cliente_Consumo_2
    FOREIGN KEY (Fk_id_cliente) REFERENCES Cliente (id_cliente);

ALTER TABLE Cliente_Consumo ADD CONSTRAINT FK_Cliente_Consumo_3    
    FOREIGN KEY (Fk_id_bebida) REFERENCES Bebidas (id_bebida);
    