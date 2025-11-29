CREATE DATABASE MariaPan;
USE MariaPan;

CREATE TABLE Sucursal (
    ID_Sucursal INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100),
    Fecha_Inauguracion DATE
);

CREATE TABLE Equipo (
    ID_Equipo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Tipo VARCHAR(20),
    ID_Sucursal INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

CREATE TABLE Empleado (
    ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50),
    Cargo VARCHAR(50),
    ID_Sucursal INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursal(ID_Sucursal)
);

CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Precio DECIMAL(10,2),
    Cantidad_Stock INT
);

CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    ID_Empleado INT,
    Total DECIMAL(10,2),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Detalle_Venta (
    ID_Detalle INT PRIMARY KEY AUTO_INCREMENT,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);
