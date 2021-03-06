USE universidad;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999/01/01' AND  '1999/12/31';
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K'; 
SELECT asignatura.nombre FROM asignatura JOIN grado ON  curso = 3 AND cuatrimestre = 1 AND grado.id = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'Departamento' FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM curso_escolar JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno where nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON asignatura.id_grado = 4;
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE anyo_inicio = 2018 AND anyo_fin = 2019;  
SELECT departamento.nombre AS 'Departamento', persona.apellido1, persona.apellido2, persona.nombre FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT a.nombre FROM asignatura a WHERE a.id_profesor IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar IS NULL;
SELECT COUNT(*)  AS 'Total alumnos' FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS 'Nacidos en 1999' FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999/01/01' AND  '1999/12/31';
SELECT COUNT(id_profesor) AS 'N??mero de profesores', departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre; 
SELECT grado.nombre, COUNT(asignatura.id) AS 'N??mero de asignaturas' FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre;
SELECT grado.nombre, COUNT(asignatura.id) AS 'N??mero de asignaturas' FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id WHERE COUNT(asignatura.id) > 40 GROUP BY grado.nombre;