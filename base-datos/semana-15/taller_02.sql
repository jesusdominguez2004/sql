-- taller 02

-- 01. El curso con mayor cantidad de estudiantes por año.
select course_id, students
from (
	select distinct year, course_id, course_count_takes_year(course_id, year) as students
	from takes
	order by year
) as subquery
where students in (
	select max(students)
    from (
		select distinct year, course_id, course_count_takes_year(course_id, year) as students
		from takes
		order by year
    ) as subquery
);

-- 02. El número de estudiantes por departamento.
select distinct dept_name, dept_count_students(dept_name) as students
from department
order by students;

-- 03. El número de estudiantes asesorados por cada docente.
select distinct i_ID as "id_docente", teacher_count_advisor(i_ID) as students
from advisor
order by students;

-- 04. Los salones de cada curso dictado hasta la fecha.
select building, room_number, course_id, year
from section
order by building, year;

select *
from section
order by year;

-- 05. El número de cursos dictados por año.
select distinct year, course_count_teaches(year) as courses
from teaches
order by courses;
