--Queries for Shop

SELECT nombre FROM producto;
SELECT nombre ,precio FROM producto;
SELECT * FROM producto;
SELECT nombre , precio , precio * 1.1 AS precio_dolars FROM producto;
SELECT nombre AS nom_de_producte , precio AS euros , precio * 1.1 AS dòlars FROM producto;
SELECT UPPER(nombre) , precio FROM producto;
SELECT LOWER(nombre) , precio FROM producto;
SELECT nombre , UPPER(LEFT(nombre,2)) FROM fabricante;
SELECT nombre , ROUND(precio) FROM producto;
SELECT nombre , TRUNCATE(precio,0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre , precio FROM producto ORDER BY nombre ASC , precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre , precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre , precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.codigo ASC;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Crucial') AND precio > 200;
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate' ORDER BY producto.codigo;
SELECT * FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'Asus' OR nombre = 'Hewlett-Packard' OR nombre = 'Seagate') ORDER BY codigo ASC;
SELECT producto.nombre , producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre , producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT DISTINCT fabricante.codigo , fabricante.nombre FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
SELECT fabricante.nombre , producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;
SELECT nombre FROM producto WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio ASC LIMIT 1;
SELECT nombre FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));


--Queries for University

SELECT apellido1 , apellido2 , nombre FROM persona ORDER BY apellido1 , apellido2 , nombre;
SELECT nombre , apellido1 , apellido2 FROM persona WHERE telefono IS NULL;
SELECT * FROM persona WHERE fecha_nacimiento LIKE '1999%';
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT persona.apellido1 , persona.apellido2 , persona.nombre , departamento.nombre AS nombre_departamento FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1 , persona.apellido2 , persona.nombre;
SELECT asignatura.nombre FROM asignatura INNER JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE persona.nif = '26902806m';
SELECT nombre FROM departamento WHERE id IN (SELECT DISTINCT id_departamento FROM profesor WHERE id_profesor IN (SELECT DISTINCT id_profesor FROM asignatura WHERE id IN (SELECT id FROM asignatura WHERE id_grado = (SELECT id FROM grado WHERE nombre = 'Grado en Ingeniería Informática (Plan 2015)'))));
SELECT * FROM persona WHERE id IN (SELECT DISTINCT id_alumno FROM alumno_se_matricula_asignatura WHERE id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019));


-- LEFT JOIN // RIGHT JOIN

SELECT departamento.nombre , apellido1 , apellido2 , persona.nombre FROM persona LEFT JOIN profesor ON (id_profesor = persona.id) INNER JOIN departamento ON (id_departamento = departamento.id) WHERE tipo = 'profesor';
SELECT persona.nombre FROM persona LEFT JOIN profesor ON (persona.id = profesor.id_profesor) WHERE persona.tipo = 'profesor' AND profesor.id_departamento IS NULL;
SELECT nombre FROM departamento LEFT JOIN profesor ON (id = id_departamento) GROUP BY nombre HAVING COUNT(id_departamento) = 0;
SELECT persona.nombre FROM persona LEFT JOIN asignatura ON (persona.id = asignatura.id_profesor) WHERE persona.tipo = 'profesor' GROUP BY persona.id HAVING COUNT(asignatura.id) = 0;
SELECT asignatura.nombre FROM asignatura LEFT JOIN persona ON (asignatura.id_profesor = persona.id) WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON (departamento.id = profesor.id_departamento) LEFT JOIN asignatura ON (profesor.id_profesor = asignatura.id_profesor) WHERE asignatura.id_profesor IS NULL;



-- Consultes resum

SELECT COUNT(tipo) AS alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(fecha_nacimiento) AS nacidos_1999 FROM persona WHERE fecha_nacimiento LIKE '1999%';
SELECT departamento.nombre AS departamento, COUNT(profesor.id_profesor) AS total_profesores FROM profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY total_profesores DESC;
SELECT departamento.nombre AS departamento, COUNT(profesor.id_profesor) AS total_profesores FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY total_profesores DESC;
SELECT grado.nombre AS grado , COUNT(asignatura.id) AS asignaturas FROM grado LEFT JOIN asignatura ON (grado.id = asignatura.id_grado) GROUP BY grado.nombre ORDER BY asignaturas DESC;
SELECT grado.nombre AS grado , COUNT(asignatura.id) AS asignaturas FROM grado INNER JOIN asignatura ON (grado.id = asignatura.id_grado) GROUP BY grado.nombre HAVING COUNT(asignatura.id) > 40;
SELECT grado.nombre AS nombre_grado , asignatura.tipo AS tipo_asignatura , SUM(asignatura.creditos) AS total_creditos FROM grado INNER JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre , asignatura.tipo ORDER BY grado.nombre , asignatura.tipo;
SELECT curso_escolar.anyo_inicio AS inicio_curso , COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS alumnos_matriculados FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio ORDER BY curso_escolar.anyo_inicio;
SELECT persona.id , persona.nombre , apellido1 , apellido2 , COUNT(asignatura.id) AS cantidad_asignaturas FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY cantidad_asignaturas DESC;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT DISTINCT persona.nombre FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;



