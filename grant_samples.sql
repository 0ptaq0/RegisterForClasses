----professor1 can modify type of classes, course dates, number of people per classes (independently from capacity of classrom), grade students
grant insert, update, select on course_section, course to professor1;
grant execute on function liczba_studentow(int,int) to professor1;
grant upadte on enrollment to professor1;

----student1 can enroll on classes 
create view for_student_view as select c_section_id, c_id, semester_id, staff.staff_lastname, l.room_nr, c_section_date, c_section_time, c_section_during, c_section_type from course_section
join staff using (staff_id)
join location l using (location_id);
grant insert on enrollment to student1;
grant select on for_student_view to student1;