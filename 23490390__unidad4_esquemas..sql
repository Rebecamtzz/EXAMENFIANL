-- Tabla: Departamentos
CREATE TABLE Departamentos (
    IDDepartamento SERIAL PRIMARY KEY,
    NombreDepartamento VARCHAR(100) NOT NULL,
    Edificio VARCHAR(100)
);

-- Tabla: Estudiantes
CREATE TABLE Estudiantes (
    IDEstudiante SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE,
    Direccion VARCHAR(150),
    Ciudad VARCHAR(100),
    Email VARCHAR(100)
);

-- Tabla: Cursos
CREATE TABLE Cursos (
    IDCurso SERIAL PRIMARY KEY,
    NombreCurso VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Creditos INT,
    Semestre VARCHAR(20),
    IDDepartamento INT,
    FOREIGN KEY (IDDepartamento) REFERENCES Departamentos(IDDepartamento)
);

-- Tabla: Inscripciones
CREATE TABLE Inscripciones (
    IDInscripcion SERIAL PRIMARY KEY,
    IDEstudiante INT,
    IDCurso INT,
    FechaInscripcion DATE,
    Calificacion NUMERIC(4,2),
    FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
    FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso)
);

-- Tabla: Profesores
CREATE TABLE Profesores (
    IDProfesor SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Titulo VARCHAR(100),
    IDDepartamento INT,
    FOREIGN KEY (IDDepartamento) REFERENCES Departamentos(IDDepartamento)
);

-- Tabla: Aulas
CREATE TABLE Aulas (
    IDAula SERIAL PRIMARY KEY,
    NombreAula VARCHAR(50) NOT NULL,
    Capacidad INT,
    Ubicacion VARCHAR(100)
);

-- Tabla: Horarios
CREATE TABLE Horarios (
    IDHorario SERIAL PRIMARY KEY,
    IDCurso INT,
    IDAula INT,
    FechaInicio DATE,
    FechaFin DATE,
    HoraInicio TIME,
    HoraFin TIME,
    FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
    FOREIGN KEY (IDAula) REFERENCES Aulas(IDAula)
);

-- Tabla Intermedia: CursosProfesores (relación muchos a muchos)
CREATE TABLE CursosProfesores (
    IDCursoProfesor SERIAL PRIMARY KEY,
    IDCurso INT,
    IDProfesor INT,
    FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
    FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor)
);

-- Tabla: ProgramasEstudio
CREATE TABLE ProgramasEstudio (
    IDPrograma SERIAL PRIMARY KEY,
    NombrePrograma VARCHAR(100) NOT NULL,
    DescripcionPrograma TEXT
);

-- Tabla Intermedia: ProgramasCursos (relación muchos a muchos)
CREATE TABLE ProgramasCursos (
    IDProgramaCurso SERIAL PRIMARY KEY,
    IDPrograma INT,
    IDCurso INT,
    FOREIGN KEY (IDPrograma) REFERENCES ProgramasEstudio(IDPrograma),
    FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso)
);
--Agregar Tablas:
-- Tabla: Campus
CREATE TABLE Campus (
    IDCampus SERIAL PRIMARY KEY,
    NombreCampus VARCHAR(100) NOT NULL,
    DireccionCampus VARCHAR(150)
);

-- Tabla: Carreras
CREATE TABLE Carreras (
    IDCarrera SERIAL PRIMARY KEY,
    NombreCarrera VARCHAR(100) NOT NULL,
    TituloOtorgado VARCHAR(100)
);
--Agregar una relación de muchos a muchos entre Estudiantes y Carreras
-- Tabla intermedia: EstudiantesCarreras
CREATE TABLE EstudiantesCarreras (
    IDEstudianteCarrera SERIAL PRIMARY KEY,
    IDEstudiante INT,
    IDCarrera INT,
    FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
    FOREIGN KEY (IDCarrera) REFERENCES Carreras(IDCarrera)
);

--En la tabla Estudiantes, agregar una clave foránea IDCarrera que haga referencia a la tabla Carreras.
ALTER TABLE Estudiantes
ADD COLUMN IDCarrera INT REFERENCES Carreras(IDCarrera);
SELECT * FROM Estudiantes

--En la tabla Cursos, agregar una columna IDCampus como clave foránea, referenciando la tabla Campus.
ALTER TABLE Cursos
ADD COLUMN IDCampus INT REFERENCES Campus(IDCampus);
SELECT * FROM Cursos

--Modificar la tabla Profesores para incluir un campo Email
ALTER TABLE Profesores
ADD COLUMN Email VARCHAR(100);
SELECT * FROM Profesores

--Eliminar Tablas/Campos
--Eliminar la columna Ciudad de la tabla Estudiantes.
ALTER TABLE Estudiantes
DROP COLUMN Ciudad;
SELECT * FROM Estudiantes


--Eliminar la tabla Aulas
DROP TABLE IF EXISTS Aulas CASCADE;
SELECT * FROM Aulas
