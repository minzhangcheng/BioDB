# ############################################################################
#
# Copyright (C) 2016 Minzhang Cheng
# Contact: minzhangcheng@gmail.com
#
# This file is part of the BioDB, a database for biological data analysis.
#
# GNU Lesser General Public License Usage
# This file may be used under the terms of the GNU Lesser General Public
# License version 3 as published by the Free Software Foundation and
# appearing in the file LICENSE included in the packaging of this file.
# Please review the following information to ensure the GNU Lesser
# General Public License version 3 requirements will be met:
# http://www.gnu.org/licenses/gpl-3.0.html
#
# ############################################################################


from sqlobject import *


def connect(**kwargs):
    svr = {'host': 'biodb.cmz.ac.cn', 'port': 3306,
           'username': 'biodb_select', 'password': 'biodb_select',
           'database': 'biodb'
           }
    for i in svr:
        if i in kwargs:
            svr[i] = kwargs[i]
        if 'passwd' in kwargs:
            svr['password'] = kwargs['passwd']
    uri = 'mysql://%s:%s@%s:%d/%s' % (svr['username'], svr['password'],
                                      svr['host'], svr['port'],
                                      svr['database'])
    connection = connectionForURI(uri)
    sqlhub.processConnection = connection


class tcga_program(SQLObject):
    program_id = StringCol(length=55)
    name = StringCol(length=55)
    dbgap_accession_number = StringCol(length=55)


class tcga_project(SQLObject):
    project_id = StringCol(length=55)
    program_id = StringCol(length=55)
    name = StringCol(length=255)
    dbgap_accession_number = StringCol(length=55)
    disease_type = StringCol(length=255)
    primary_site = StringCol(length=255)


class tcga_tissue_source_site(SQLObject):
    tissue_source_site_id = StringCol(length=55)
    code = StringCol(length=55)
    bcr_id = StringCol(length=55)
    name = StringCol(length=55)
    project = StringCol(length=55)


class tcga_case(SQLObject):
    case_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    tissue_source_site_id = StringCol(length=55)


class tcga_sample(SQLObject):
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
    treatment_id = StringCol(length=55)
    project_id = StringCol(length=55)
    submitter_id = StringCol(length=55)
    case_id = StringCol(length=55)
    days_to_treatment = IntCol()
    therapeutic_agents = StringCol(length=55)
    treatment_intent_type = StringCol(length=55)
    treatment_or_therapy = StringCol(length=55)


class tcga_family_history(SQLObject):
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







