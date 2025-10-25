-- Crear BD (si no existe, hazlo manualmente en pgAdmin o psql)
-- CREATE DATABASE control_notas;

CREATE TABLE catedratico (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(150),
    pin VARCHAR(32) NOT NULL
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    id_catedratico INT NOT NULL REFERENCES catedratico(id)
);

CREATE TABLE estudiante (
    id SERIAL PRIMARY KEY,
    carnet VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    pin VARCHAR(32) NOT NULL
);

CREATE TABLE matricula (
    id SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL REFERENCES estudiante(id),
    id_curso INT NOT NULL REFERENCES curso(id)
);

CREATE TABLE nota (
    id SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL REFERENCES estudiante(id),
    id_curso INT NOT NULL REFERENCES curso(id),
    primer_parcial NUMERIC(5,2) DEFAULT 0,
    segundo_parcial NUMERIC(5,2) DEFAULT 0,
    actividades NUMERIC(5,2) DEFAULT 0,
    evaluacion_final NUMERIC(5,2) DEFAULT 0,
    total_acumulado NUMERIC(6,2) DEFAULT 0,
    sde BOOLEAN DEFAULT FALSE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO catedratico(nombre, correo, pin) VALUES
('Eduardo Javier Estrada Macal','eduardo.estrada@umg.edu.gt','1234');

INSERT INTO curso(nombre, id_catedratico) VALUES
('Programación I', 1),
('Base de Datos', 1);

INSERT INTO estudiante(carnet, nombre, pin) VALUES
('2021001', 'Juan Pérez', '0001'),
('2021002', 'María López', '0002'),
('2021003', 'Carlos Hernández', '0003');

INSERT INTO matricula(id_estudiante, id_curso) VALUES
(1,1),(2,1),(3,1),
(1,2),(2,2);
