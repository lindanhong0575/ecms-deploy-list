delete from ibps_form_field;
delete from ibps_data_template_tpl;

insert into ibps_form_field select * from ibps_form_field_20230328;
insert into ibps_data_template_tpl select * from ibps_data_template_tpl_20230328;

drop table if exists ibps_form_field_20230328;
drop table if exists ibps_data_template_tpl_20230328;