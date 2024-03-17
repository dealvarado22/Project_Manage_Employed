-- Creación de la tabla Departamentos
CREATE TABLE Departamentos (
    ID_Departamentos INT AUTO_INCREMENT PRIMARY KEY,
    NombreDepartamento VARCHAR(255),
    DescripcionDepartamento TEXT
);

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
    ID_Empleados INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    FechaNacimiento DATE,
    Genero ENUM('Masculino', 'Femenino'),
    DepartamentoID INT,
    FechaContratacion DATE,
    Salario DECIMAL(10, 2),
    Email VARCHAR(255),
    Telefono VARCHAR(20),
    Direccion TEXT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(ID_Departamentos)
);

-- Creación de la tabla HorasLaborales
CREATE TABLE HorasLaborales (
    EmpleadoID INT,
    Fecha DATE,
    HoraEntrada TIME,
    HoraSalida TIME,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(ID_Empleados)
);

-- Creación de la tabla EstadosVacaciones
CREATE TABLE EstadosVacaciones (
    ID_Estado INT AUTO_INCREMENT PRIMARY KEY,
    Estado VARCHAR(50) UNIQUE
);

-- Llenar la tabla EstadosVacaciones
INSERT INTO EstadosVacaciones (Estado) VALUES ('pendiente'), ('aprobado'), ('rechazado'), ('Parciales');

-- Creación de la tabla Vacaciones
CREATE TABLE Vacaciones (
    ID_Vacaciones INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoID INT,
    FechaInicio DATE,
    FechaFin DATE,
    EstadoID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(ID_Empleados),
    FOREIGN KEY (EstadoID) REFERENCES EstadosVacaciones(ID_Estado)
);

-- Creación de la tabla Informes
CREATE TABLE Informes (
    ID_Informes INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoID INT,
    TipoInforme VARCHAR(255),
    FechaGeneracion DATE,
    ContenidoInforme TEXT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(ID_Empleados)
);
