use Registration;
drop trigger if exists update_total_credit;

delimiter //
create trigger update_total_credit
after insert on Registration_details for each row
begin
	declare total float;
    select sum(Credit) into total from Registration_details
    join section using (SectionID) 
	join course using (CourseID) 
    where RegistrationID = new.RegistrationID;
    
	update Registration set TotalCredit = total
	where RegistrationID = new.RegistrationID;
end//
delimiter ;

show triggers;

insert into registration_details Value (3, 2, 1);
insert into registration_details Value (4, 1, 1);
insert into registration_details Value (5, 2, 2);

select * From registration;