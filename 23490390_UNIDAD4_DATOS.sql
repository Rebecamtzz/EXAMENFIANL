--INSERTAR DATOS 
INSERT INTO Departamentos (NombreDepartamento, Edificio) VALUES
('Ingeniería', 'Edificio A'),
('Ciencias Sociales', 'Edificio B'),
('Artes', 'Edificio C'),
('Ciencias Básicas', 'Edificio D'),
('Educación', 'Edificio E');

INSERT INTO Carreras (NombreCarrera, TituloOtorgado) VALUES
('Ingeniería Informática', 'Ingeniero en Informática'),
('Psicología', 'Licenciado en Psicología'),
('Diseño Gráfico', 'Diseñador Gráfico'),
('Matemáticas', 'Licenciado en Matemáticas'),
('Pedagogía', 'Licenciado en Educación');

INSERT INTO Campus (NombreCampus, DireccionCampus) VALUES
('Campus Norte', 'Av. Universidad 1000'),
('Campus Sur', 'Av. Técnica 2000'),
('Campus Central', 'Calle Central 500'),
('Campus Este', 'Carretera 10 #45'),
('Campus Oeste', 'Ruta 30 Km 5');

INSERT INTO Profesores (Nombre, Apellido, Titulo, IDDepartamento, Email) VALUES
('Mario', 'Sánchez', 'M.Sc. en Computación', 1, 'mario.sanchez@uni.edu'),
('Laura', 'Peña', 'Dra. en Psicología', 2, 'laura.pena@uni.edu'),
('Carlos', 'Díaz', 'Lic. en Diseño', 3, 'carlos.diaz@uni.edu'),
('Marta', 'Ríos', 'M.Sc. en Matemáticas', 4, 'marta.rios@uni.edu'),
('Elena', 'Castro', 'Lic. en Educación', 5, 'elena.castro@uni.edu');

INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera) VALUES
('Ana', 'Martínez', '2001-05-10', 'Calle 123', 'ana.martinez@correo.edu', 1),
('Luis', 'Gómez', '2002-09-20', 'Av. Siempre Viva 742', 'luis.gomez@correo.edu', 2),
('Carla', 'Rodríguez', '2000-12-15', 'Cra. 45 #21-30', 'carla.rodriguez@correo.edu', 1),
('Jorge', 'Pérez', '1998-12-31', 'Calle 8 #14-67', 'jorge.perez@correo.edu', 3),
('María', 'Lozano', '1995-01-01', 'Av. 30 #20', 'maria.lozano@correo.edu', 4);

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, Semestre, IDDepartamento, IDCampus) VALUES
('Bases de Datos', 'Curso de introducción a bases de datos', 4, '2025-I', 1, 1),
('Psicología General', 'Fundamentos de la psicología moderna', 3, '2025-I', 2, 2),
('Diseño Digital', 'Técnicas básicas de diseño', 3, '2025-I', 3, 3),
('Álgebra Lineal', 'Conceptos básicos de álgebra lineal', 4, '2025-I', 4, 1),
('Didáctica General', 'Teorías y prácticas de enseñanza', 3, '2025-I', 5, 2);

INSERT INTO Inscripciones (IDEstudiante, IDCurso, FechaInscripcion, Calificacion) VALUES
(1, 1, '2025-01-15', 4.5),
(2, 2, '2025-01-20', 3.9),
(3, 1, '2025-01-18', 4.2),
(4, 3, '2025-01-22', 3.5),
(5, 4, '2025-01-25', 4.0);

INSERT INTO CursosProfesores (IDCurso, IDProfesor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO CursosProfesores (IDCurso, IDProfesor) VALUES
(2, 1),
(3, 1);
INSERT INTO ProgramasEstudio (NombrePrograma, DescripcionPrograma) VALUES
('Programa TIC', 'Tecnologías de Información'),
('Programa Psicología', 'Estudios psicológicos y humanos'),
('Programa Diseño', 'Creatividad visual y multimedia'),
('Programa Ciencias Exactas', 'Matemáticas y física'),
('Programa Educación', 'Formación pedagógica');

INSERT INTO ProgramasCursos (IDPrograma, IDCurso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO EstudiantesCarreras (IDEstudiante, IDCarrera) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 4);

INSERT INTO Horarios (IDCurso, FechaInicio, FechaFin, HoraInicio, HoraFin) VALUES
(1, '2025-08-01', '2025-12-15', '08:00', '10:00'),
(2, '2025-08-01', '2025-12-15', '10:00', '12:00'),
(3, '2025-08-01', '2025-12-15', '14:00', '16:00'),
(4, '2025-08-01', '2025-12-15', '09:00', '11:00'),
(5, '2025-08-01', '2025-12-15', '13:00', '15:00');

INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera) VALUES
('Sofía', 'Mendoza', '2002-11-12', 'Calle Falsa 456', 'sofia.mendoza@correo.edu', 2),
('Andrés', 'Torres', '1995-01-01', 'Av. Las Palmas 789', 'andres.torres@correo.edu', 3),
('Lucía', 'Ramírez', '1998-12-31', 'Cra. 20 #10-15', 'lucia.ramirez@correo.edu', 1);