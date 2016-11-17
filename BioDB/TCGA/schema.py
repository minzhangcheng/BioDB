from sqlobject import *

# connection = connectionForURI('mysql://biodb_select:biodb_select@mysql.cmz.ac.cn/biodb')
connection = connectionForURI('mysql://biodb_admin:biodb_admin123456@127.0.0.0.1/biodb')
sqlhub.processConnection = connection


class tcga_program(SQLObject):
    id = IntCol()
    program_id = StringCol(length=55)
    name = StringCol(length=55)
    dbgap_accession_number = StringCol(length=55)


class tcga_project(SQLObject):
    id = IntCol()
    project_id = StringCol(length=55)
    program_id = StringCol(length=55)
    name = StringCol(length=255)
    dbgap_accession_number = StringCol(length=55)
    disease_type = StringCol(length=255)
    primary_site = StringCol(length=255)


class tcga_tissue_source_site(SQLObject):
    id = IntCol()
    tissue_source_site_id = StringCol(length=55)
    code = StringCol(length=55)
    bcr_id = StringCol(length=55)
    name = StringCol(length=55)
    project = StringCol(length=55)


class tcga_case(SQLObject):
    id = IntCol()
    case_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    tissue_source_site_id = StringCol(length=55)


class tcga_sample(SQLObject):
    id = IntCol()
    sample_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    sample_type = StringCol(length=55)
    sample_type_id = IntCol()
    composition = StringCol(length=55)
    current_weight = FloatCol()
    days_to_collection = IntCol()
    days_to_sample_procurement= IntCol()
    freezing_method = StringCol(length=55)
    initial_weight = FloatCol()
    intermediate_dimension = StringCol(length=55)
    is_ffpe = StringCol(length=55)
    longest_dimension = StringCol(length=55)
    oct_embedded = StringCol(length=55)
    pathology_report_uuid = StringCol(length=55)
    preservation_method = StringCol(length=55)
    shortest_dimension = StringCol(length=55)
    time_between_clamping_and_freezing = StringCol(length=55)
    time_between_excision_and_freezing = StringCol(length=55)
    tissue_type = StringCol(length=55)
    tumor_code = StringCol(length=55)
    tumor_code_id = StringCol(length=55)
    tumor_descriptor = StringCol(length=55)


class tcga_demographic(SQLObject):
    id = IntCol()
    demographic_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    ethnicity = StringCol(length=55)
    gender = StringCol(length=55)
    race = StringCol(length=55)
    year_of_birth = IntCol()
    year_of_death = IntCol()


class tcga_diagnosis(SQLObject):
    id = IntCol()
    diagnosis_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    age_at_diagnosis = IntCol()
    classification_of_tumor = StringCol(length=55)
    days_to_last_follow_up = IntCol(length=55)
    days_to_last_known_disease_status = IntCol(length=55)
    days_to_recurrence = IntCol(length=55)
    last_known_disease_status = StringCol(length=55)
    morphology = StringCol(length=255)
    primary_diagnosis = StringCol(length=255)
    progression_or_recurrence = StringCol(length=55)
    site_of_resection_or_biopsy = StringCol(length=55)
    tissue_or_organ_of_origin = StringCol(length=55)
    tumor_grade = StringCol(length=55)
    tumor_stage = StringCol(length=55)
    vital_status = StringCol(length=55)
    days_to_birth = IntCol()
    days_to_death = IntCol()
    prior_malignancy = StringCol(length=55)


class tcga_exposure(SQLObject):
    id = IntCol()
    exposure_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    alcohol_history = StringCol(length=255)
    alcohol_intensity = StringCol(length=255)
    bmi = FloatCol()
    cigarettes_per_day = FloatCol()
    height = FloatCol()
    weight = FloatCol()
    years_smoked = FloatCol()


class tcga_treatment(SQLObject):
    id = IntCol()
    treatment_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    days_to_treatment = IntCol()
    therapeutic_agents = StringCol(length=55)
    treatment_intent_type = StringCol(length=55)
    treatment_or_therapy = StringCol(length=55)


class tcga_family_history(SQLObject):
    id = IntCol()
    family_history_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    relationship_age_at_diagnosis = FloatCol()
    relationship_gender = StringCol(length=55)
    relationship_primary_diagnosis = StringCol(length=255)
    relationship_type = StringCol(length=55)
    relative_with_cancer_history = StringCol(length=55)
    

class tcga_workflow(SQLObject):
    id = IntCol()
    workflow_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    sample_id = StringCol(length=55)
    workflow_link = StringCol(length=255)
    workflow_type = StringCol(length=55)
    workflow_end_datetime = StringCol(length=55)
    workflow_start_datetime = StringCol(length=55)
    workflow_version = StringCol(length=55)


class tcga_file_expression(SQLObject):
    id = IntCol()
    file_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    workflow_id = StringCol(length=55)
    data_category = StringCol(length=55)
    data_format = StringCol(length=55)
    data_type = StringCol(length=55)
    experimental_strategy = StringCol(length=55)
    file_name = StringCol(length=55)
    file_size = IntCol()
    md5sum = StringCol(length=55)
    state_comment = StringCol(length=55)


class tcga_expression(SQLObject):
    file_id = StringCol(length=55)
    gene_id = StringCol(length=55)
    value = FloatCol()







