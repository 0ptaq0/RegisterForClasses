drop TRIGGER t_check_semester on enrollment;
drop function check_semester();

drop trigger t_check_amount on enrollment;
drop function check_amount();

drop trigger t_check_date on enrollment;
drop function check_date();

drop TRIGGER t_check_if_location_is_occupied on course_section;
drop function check_if_location_is_occupied();

drop function liczba_studentow(int, int);

drop TRIGGER t_check_course_section on course_section;
drop function check_course_section();

drop TRIGGER t_check_enrollment on enrollment;
drop function check_enrollment();

drop view for_student_view;

drop table course cascade;
drop table semester cascade;
drop table staff cascade;
drop table student cascade;
drop table location cascade;
drop table course_section cascade;
drop table enrollment cascade;