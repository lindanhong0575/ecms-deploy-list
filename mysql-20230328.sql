drop table if exists ibps_form_field_20230328;
drop table if exists ibps_data_template_tpl_20230328;
CREATE TABLE ibps_form_field_20230328 SELECT * FROM ibps_form_field;
CREATE TABLE ibps_data_template_tpl_20230328 SELECT * FROM ibps_data_template_tpl;

-- ASTAR-929
UPDATE ibps_form_field f, ibps_form_def d
SET f.FIELD_OPTIONS_='{"required":false,"default_value_type":"fixed","placeholder":null,"selector_type":"org","store":"json","is_single":"false","filter":[],"display_mode":"path","expand_by_depth":"","org_level":"2","mobile":true,"buttons":[{"label":"add","style":"btn-primary","icon":"fa fa-add","position":"toolbar","type":"add"},{"label":"delete","style":"btn-danger","icon":"fa fa-remove","position":"all","type":"remove"}],"columns":"","relation":"one2many","default_value":"","other_filter":null,"other_filter_include_sub":"false","other_filter_condition":null,"select_mode":"any","level":"3","split":"."}'
WHERE f.form_id_ = d.ID_ and d.KEY_ = 'templateWorkflows' and f.name_ = 'groups';

-- Bug #11331
update ibps_data_template_tpl t, ibps_data_template_def d
SET DISPLAY_COLUMNS_='[{"label":"Sensitivity Classification​ Id","name":"sensi_classify_id_","$index":1},{"label":"Sensitivity Classification Nm","name":"sensi_classify_nm_","$index":2},{"label":"S/N","name":"sort_","sortable":"Y","align":"left","same":"N","noRightStyle":"","field_type":"text","rights":[{"type":"all"}],"$index":3}]'
WHERE t.template_id_ = d.ID_ and  d.key_ = 'sensiclassify';

update ibps_data_template_tpl t, ibps_data_template_def d
set t.DISPLAY_COLUMNS_='[{"label":"Security Classification ID","name":"security_class_id","$index":1},{"label":"Security Classification Name","name":"security_class_nm","$index":2},{"label":"S/N","name":"sort_","sortable":"Y","align":"left","same":"N","noRightStyle":"","field_type":"text","rights":[{"type":"all"}],"$index":3}]'
WHERE t.template_id_ = d.ID_ and  d.key_ = 'secclassify';

update ibps_form_field f, ibps_form_def d
SET LABEL_='S/N', LABEL_DFLT_='S/N', LABEL_EN_='S/N'
WHERE f.form_id_ = d.ID_ and d.KEY_ = 'sensiclassify' and f.name_ = 'sort';
update ibps_form_field f, ibps_form_def d
SET LABEL_='S/N', LABEL_DFLT_='S/N', LABEL_EN_='S/N'
WHERE f.form_id_ = d.ID_ and d.KEY_ = 'securityclassify' and f.name_ = 'sort';
