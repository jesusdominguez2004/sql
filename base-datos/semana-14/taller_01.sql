-- taller 01

-- 01. Los ID de los estudiantes que tienen una S en su nombre 
-- y pertenecen al departamento de "Comp. Sci.":
select ID as "id_estudiantes"
from student
where name like "%s%" and dept_name = "Comp. Sci."
order by ID asc;

-- 02. El salón de clases con mayor capacidad de toda la universidad:
select building, capacity
from classroom
where capacity in (
	select max(capacity)
	from classroom
);

-- 03. El departamento con mayor número de profesores:
select dept_name
from (
	select distinct dept_name, dept_count(dept_name) as teachers
	from department
	order by teachers
) as subquery
where teachers in (
	select max(teachers)
	from (
		select distinct dept_name, dept_count(dept_name) as teachers
		from department
		order by teachers
	) as subquery
);

-- 04. El promedio del número de estudiantes por curso:
select avg(students)
from (
	select distinct course_id, course_count_takes(course_id) as students
	from course
	order by students
) as subquery;

-- 05. El número de cursos que cada docente ha dictado:
select distinct ID as "id_docente", teacher_count(ID) as cursos_dictados
from instructor
order by cursos_dictados;