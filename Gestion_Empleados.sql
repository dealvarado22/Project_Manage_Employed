-- Creacion de la base de datos
CREATE DATABASE IF NOT EXISTS Gestión_Empleados;
-- Usar la base de datos
USE Gestión_Empleados;

-- Tabla de Cargos
CREATE TABLE Cargo (
    ID_Cargo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Cargo VARCHAR(255),
    Descripcion_Cargo VARCHAR(255)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    Empleado_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_empleado VARCHAR(100) NOT NULL,
    Apellido_empleado VARCHAR(100) NOT NULL,
    Nacimiento_empleado DATE NOT NULL,
    ID_Cargo INT,
    Fecha_Contratacion_empleado DATE NOT NULL,
    Salario_empleado DECIMAL(10, 2) NOT NULL,
    DUI_empleado VARCHAR(20) NOT NULL,
    Direccion_empleado VARCHAR(200) NOT NULL,
    Telefono_empleado VARCHAR(20) NOT NULL,
    Email_empleado VARCHAR(100) NOT NULL,
    Contacto_emergencia_empleado VARCHAR(100),
    Telefono_emergencia_empleado VARCHAR(20),
    CONSTRAINT fk_cargo_empleado FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
);

-- Tabla de Horario Laboral
CREATE TABLE Horario_Laboral (
    Horario_laboral_ID INT AUTO_INCREMENT PRIMARY KEY,
    Empleado_ID INT,
    Fecha_inicio_horario DATE NOT NULL,
    Fecha_finalizacion_horario DATE,
    Hora_entrada TIME NOT NULL,
    Hora_salida TIME NOT NULL,
    CONSTRAINT fk_horario_empleado FOREIGN KEY (Empleado_ID) REFERENCES Empleados(Empleado_ID)
);

-- Tabla de Estados Vacaciones
CREATE TABLE Estados_Vacaciones (
    ID_Estado INT AUTO_INCREMENT PRIMARY KEY,
    Estado_Vacacion VARCHAR(50) NOT NULL
);

-- Tabla de Vacaciones
CREATE TABLE Vacaciones (
    Vacacion_ID INT AUTO_INCREMENT PRIMARY KEY,
    Empleado_ID INT,
    Fecha_inicio_vacacion DATE NOT NULL,
    Fecha_fin_vacacion DATE NOT NULL,
    Estado_Vacacion INT,
    CONSTRAINT fk_vacacion_empleado FOREIGN KEY (Empleado_ID) REFERENCES Empleados(Empleado_ID),
    CONSTRAINT fk_estado_vacacion FOREIGN KEY (Estado_Vacacion) REFERENCES Estados_Vacaciones(ID_Estado)
);

-- Tabla de Informes
CREATE TABLE Informes (
    Informe_ID INT AUTO_INCREMENT PRIMARY KEY,
    Empleado_ID INT,
    Fecha_creacion DATE NOT NULL,
    Fecha_cierre DATE NOT NULL,
    Tipo_informe VARCHAR(100) NOT NULL,
    Detalles_informe TEXT,
    CONSTRAINT fk_informe_empleado FOREIGN KEY (Empleado_ID) REFERENCES Empleados(Empleado_ID)
);
