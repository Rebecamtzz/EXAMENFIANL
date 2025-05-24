--Actualizando Datos: Actualizar la información existente en las tablas para reflejar cambios o correcciones.

UPDATE Profesores
SET Email = 'nuevo.email@universidad.edu'
WHERE IDProfesor = 1;
SELECT * FROM Profesores

UPDATE Estudiantes
SET Direccion = 'Av. Central 123, Zona Universitaria'
WHERE IDEstudiante = 3;
SELECT * FROM Estudiantes

UPDATE Cursos
SET NombreCurso = 'Bases de Datos Avanzadas'
WHERE IDCurso = 2;
SELECT * FROM Cursos

UPDATE Inscripciones
SET Calificacion = 9.5
WHERE IDInscripcion = 4;
SELECT * FROM Inscripciones

UPDATE Departamentos
SET NombreDepartamento = 'Ciencias de la Computación'
WHERE IDDepartamento = 1;
SELECT * FROM Departamentos

UPDATE Horarios
SET HoraInicio = '15:00', HoraFin = '17:00'
WHERE IDHorario = 2;
SELECT * FROM Horarios

--Eliminando Datos: Eliminar registros de las tablas que ya no sean relevantes.
--Eliminar estudiantes que no están inscritos en ningún curso
DELETE FROM Estudiantes
WHERE IDEstudiante NOT IN (
    SELECT DISTINCT IDEstudiante FROM Inscripciones
);

--Eliminar cursos que no tienen inscripciones ni están en programas de estudio
DELETE FROM Cursos
WHERE IDCurso NOT IN (SELECT DISTINCT IDCurso FROM Inscripciones)
  AND IDCurso NOT IN (SELECT DISTINCT IDCurso FROM ProgramasCursos);

--Eliminar profesores que no están asignados a ningún curso
  DELETE FROM Profesores
WHERE IDProfesor NOT IN (
    SELECT DISTINCT IDProfesor FROM CursosProfesores
);

--Eliminar departamentos que no tienen profesores ni cursos
DELETE FROM Departamentos
WHERE IDDepartamento NOT IN (
    SELECT IDDepartamento FROM Profesores
    UNION
    SELECT IDDepartamento FROM Cursos
);

--Eliminar carreras que no están asociadas a ningún estudiante
DELETE FROM Carreras
WHERE IDCarrera NOT IN (
    SELECT DISTINCT IDCarrera FROM Estudiantes
    UNION
    SELECT DISTINCT IDCarrera FROM EstudiantesCarreras
);
--Eliminar campus que no estén asociados a ningún curso
DELETE FROM Campus
WHERE IDCampus NOT IN (
    SELECT DISTINCT IDCampus FROM Cursos
);

--Realizando Consultas (Búsquedas): Formular y ejecutar consultas para obtener información específica de la base de datos
--Listar todos los estudiantes con su carrera
SELECT E.IDEstudiante, E.Nombre, E.Apellido, C.NombreCarrera
FROM Estudiantes E
LEFT JOIN Carreras C ON E.IDCarrera = C.IDCarrera;

--Mostrar los cursos, su departamento y el campus donde se imparten
SELECT Cu.NombreCurso, D.NombreDepartamento, Ca.NombreCampus
FROM Cursos Cu
JOIN Departamentos D ON Cu.IDDepartamento = D.IDDepartamento
JOIN Campus Ca ON Cu.IDCampus = Ca.IDCampus;

--Ver las inscripciones de cada estudiante con su calificación y curso:
SELECT E.Nombre || ' ' || E.Apellido AS Estudiante, 
       Cu.NombreCurso, I.Calificacion
FROM Inscripciones I
JOIN Estudiantes E ON I.IDEstudiante = E.IDEstudiante
JOIN Cursos Cu ON I.IDCurso = Cu.IDCurso;

--Obtener los profesores junto con los cursos que imparten
SELECT P.Nombre || ' ' || P.Apellido AS Profesor, Cu.NombreCurso
FROM CursosProfesores CP
JOIN Profesores P ON CP.IDProfesor = P.IDProfesor
JOIN Cursos Cu ON CP.IDCurso = Cu.IDCurso;

--Ver todos los horarios de clases con nombre de curso y horas
SELECT Cu.NombreCurso, H.FechaInicio, H.FechaFin, H.HoraInicio, H.HoraFin
FROM Horarios H
JOIN Cursos Cu ON H.IDCurso = Cu.IDCurso;

--Obtener el número total de estudiantes por carrera
SELECT C.NombreCarrera, COUNT(E.IDEstudiante) AS TotalEstudiantes
FROM Carreras C
LEFT JOIN Estudiantes E ON C.IDCarrera = E.IDCarrera
GROUP BY C.NombreCarrera;

--Selección Básica: Muestra todos los nombres y apellidos de los estudiantes.
SELECT Nombre, Apellido FROM Estudiantes;

--láusula WHERE: Encuentra todos los cursos que tienen 3 créditos.
SELECT * FROM Cursos WHERE Creditos = 3;

--INNER JOIN: Obtén una lista que muestre el nombre del estudiante y el nombre del curso en el que está inscrito.
SELECT E.Nombre AS NombreEstudiante, C.NombreCurso
FROM Estudiantes E
INNER JOIN Inscripciones I ON E.IDEstudiante = I.IDEstudiante
INNER JOIN Cursos C ON I.IDCurso = C.IDCurso;

--LEFT JOIN: Muestra todos los estudiantes y, si están inscritos en algún curso, el nombre del curso. Si un estudiante no está inscrito en ningún curso, el campo del nombre del curso debe mostrar un valor que lo indique (ej: NULL).
SELECT E.Nombre, E.Apellido, C.NombreCurso
FROM Estudiantes E
LEFT JOIN Inscripciones I ON E.IDEstudiante = I.IDEstudiante
LEFT JOIN Cursos C ON I.IDCurso = C.IDCurso;

--RIGHT JOIN: Lista todos los cursos y, si tienen estudiantes inscritos, el nombre de los estudiantes. Muestra todos los cursos, incluso si no tienen estudiantes inscritos actualmente.
SELECT C.NombreCurso, E.Nombre, E.Apellido
FROM Cursos C
RIGHT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
RIGHT JOIN Estudiantes E ON I.IDEstudiante = E.IDEstudiante
ORDER BY C.NombreCurso;
--GROUP BY y COUNT: Calcula cuántos estudiantes están inscritos en cada curso. Muestra el nombre del curso y la cantidad de estudiantes.
SELECT C.NombreCurso, COUNT(I.IDEstudiante) AS TotalEstudiantes
FROM Cursos C
LEFT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
GROUP BY C.NombreCurso
ORDER BY TotalEstudiantes DESC;
--BETWEEN: Encuentra todos los estudiantes que nacieron entre el 1 de enero de 1995 y el 31 de diciembre de 1998.
SELECT Nombre, Apellido, FechaNacimiento
FROM Estudiantes
WHERE FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';
--ORDER BY: Muestra todos los cursos ordenados alfabéticamente por su nombre.
SELECT * FROM Cursos ORDER BY NombreCurso ASC;
--CTE: Crea una tabla de expresión común que liste el número de inscripciones por estudiante. Luego, consulta esta CTE para encontrar los 3 estudiantes con más inscripciones, mostrando el nombre del estudiante y el número de inscripciones.
WITH InscripcionesPorEstudiante AS (
    SELECT 
        IDEstudiante,
        COUNT(*) AS TotalInscripciones
    FROM Inscripciones
    GROUP BY IDEstudiante
)
SELECT 
    e.Nombre, 
    e.Apellido, 
    i.TotalInscripciones
FROM InscripcionesPorEstudiante i
JOIN Estudiantes e ON e.IDEstudiante = i.IDEstudiante
ORDER BY i.TotalInscripciones DESC
LIMIT 3;
--Consulta Compleja 1: Para cada departamento, muestra el nombre del departamento y el nombre del curso con la mayor cantidad de estudiantes inscritos.
WITH InscripcionesPorCurso AS (
    SELECT 
        IDCurso,
        COUNT(*) AS TotalInscritos
    FROM Inscripciones
    GROUP BY IDCurso
),
CursoMaxPorDepartamento AS (
    SELECT 
        c.IDDepartamento,
        c.NombreCurso,
        ipc.TotalInscritos,
        ROW_NUMBER() OVER (PARTITION BY c.IDDepartamento ORDER BY ipc.TotalInscritos DESC) AS rn
    FROM Cursos c
    LEFT JOIN InscripcionesPorCurso ipc ON c.IDCurso = ipc.IDCurso
)
SELECT 
    d.NombreDepartamento,
    cm.NombreCurso,
    COALESCE(cm.TotalInscritos, 0) AS TotalInscritos
FROM CursoMaxPorDepartamento cm
JOIN Departamentos d ON cm.IDDepartamento = d.IDDepartamento
WHERE cm.rn = 1;
--Consulta Compleja 2: Encuentra a los profesores que imparten más de dos cursos, mostrando su nombre, apellido y la cantidad de cursos que imparten.
SELECT 
    p.Nombre,
    p.Apellido,
    COUNT(cp.IDCurso) AS CursosImpartidos
FROM Profesores p
JOIN CursosProfesores cp ON p.IDProfesor = cp.IDProfesor
GROUP BY p.IDProfesor, p.Nombre, p.Apellido
HAVING COUNT(cp.IDCurso) > 2;

--Consulta Compleja 3: Lista los nombres de los programas de estudio y, para cada programa, el nombre del curso con el promedio de calificación más alto.
WITH PromediosPorCurso AS (
    SELECT 
        pc.IDPrograma,
        c.IDCurso,
        c.NombreCurso,
        AVG(i.Calificacion) AS PromedioCalificacion
    FROM ProgramasCursos pc
    JOIN Cursos c ON pc.IDCurso = c.IDCurso
    LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
    GROUP BY pc.IDPrograma, c.IDCurso, c.NombreCurso
),
CursoMaxPromedio AS (
    SELECT
        IDPrograma,
        NombreCurso,
        PromedioCalificacion,
        ROW_NUMBER() OVER (PARTITION BY IDPrograma ORDER BY PromedioCalificacion DESC NULLS LAST) AS rn
    FROM PromediosPorCurso
)
SELECT 
    pe.NombrePrograma,
    cmp.NombreCurso,
    cmp.PromedioCalificacion
FROM CursoMaxPromedio cmp
JOIN ProgramasEstudio pe ON cmp.IDPrograma = pe.IDPrograma
WHERE cmp.rn = 1;

