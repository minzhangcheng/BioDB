-- ---------------------------------------------------------------------------
--
-- Copyright (C) 2016 Minzhang Cheng
-- Contact: minzhangcheng@gmail.com
--
-- This file is part of the BioDB, a database for biological data analysis.
--
-- GNU Lesser General Public License Usage
-- This file may be used under the terms of the GNU Lesser General Public
-- License version 3 as published by the Free Software Foundation and
-- appearing in the file LICENSE included in the packaging of this file.
-- Please review the following information to ensure the GNU Lesser
-- General Public License version 3 requirements will be met:
-- http://www.gnu.org/licenses/gpl-3.0.html
--
-- ---------------------------------------------------------------------------

-- ---------------------------------------------------------------------------
--
-- Module tcga
-- Version 0.1
--
-- ---------------------------------------------------------------------------


set @module_name = 'tcga';
set @module_version = '0.1';
set @release_date = '20161116';


CREATE TABLE tcga_program(
    id                      INTEGER     AUTO_INCREMENT,
    program_id              VARCHAR(55),
    name                    VARCHAR(255),
    dbgap_accession_number  VARCHAR(55),

    PRIMARY KEY (id),
    UNIQUE (program_id),
    UNIQUE (name),
    INDEX (dbgap_accession_number)

);

CREATE TABLE tcga_project(
    id                      INTEGER     AUTO_INCREMENT,
    project_id              VARCHAR(55),
    program_id              VARCHAR(55),
    dbgap_accession_number  VARCHAR(55),
    disease_type            VARCHAR(255),
    name                    VARCHAR(255),
    primary_site            VARCHAR(255),

    PRIMARY KEY (id),
    FOREIGN KEY (program_id) REFERENCES tcga_program(program_id),
    UNIQUE (project_id),
    INDEX (dbgap_accession_number),
    INDEX (disease_type),
    INDEX (name),
    INDEX (primary_site)
);

CREATE TABLE tcga_tissue_source_site(
    id                      INTEGER     AUTO_INCREMENT,
    tissue_source_site_id  VARCHAR(55),
    code                    VARCHAR(55),
    bcr_id                  VARCHAR(55),
    name                    VARCHAR(55),
    project                 VARCHAR(55),

    PRIMARY KEY (id),
    UNIQUE (tissue_source_site_id),
    UNIQUE (code),
    INDEX (bcr_id),
    INDEX (name),
    INDEX (project)
);

CREATE TABLE tcga_case(
    id                      INTEGER     AUTO_INCREMENT,
    case_id                 VARCHAR(55),
    project_id              VARCHAR(55),
    submitter_id            VARCHAR(55),
    tissue_source_site_id  VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (tissue_source_site_id) REFERENCES tcga_tissue_source_site(tissue_source_site_id),
    UNIQUE (case_id),
    UNIQUE (project_id, submitter_id),
    INDEX (submitter_id)
);

CREATE TABLE tcga_sample(
    id                      INTEGER     AUTO_INCREMENT,
    sample_id               VARCHAR(55),
    project_id              VARCHAR(55),
    submitter_id            VARCHAR(55),
    case_id                 VARCHAR(55),
    sample_type             VARCHAR(55),
    sample_type_id          INTEGER,
    composition             VARCHAR(55),
    current_weight          FLOAT,
    days_to_collection      INTEGER,
    days_to_sample_procurement  INTEGER,
    freezing_method         VARCHAR(55),
    initial_weight          FLOAT,
    intermediate_dimension  VARCHAR(55),
    is_ffpe                 VARCHAR(55),
    longest_dimension       VARCHAR(55),
    oct_embedded            VARCHAR(55),
    pathology_report_uuid   VARCHAR(55),
    preservation_method     VARCHAR(55),
    shortest_dimension      VARCHAR(55),
    time_between_clamping_and_freezing  VARCHAR(55),
    time_between_excision_and_freezing  VARCHAR(55),
    tissue_type             VARCHAR(55),
    tumor_code              VARCHAR(55),
    tumor_code_id           VARCHAR(55),
    tumor_descriptor        VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (case_id) REFERENCES tcga_case(case_id),
    UNIQUE (project_id, submitter_id),
    INDEX (sample_type),
    INDEX (sample_type_id),
    INDEX (composition),
    INDEX (days_to_collection),
    INDEX (days_to_sample_procurement),
    INDEX (freezing_method),
    INDEX (tumor_code),
    INDEX (tumor_code_id),
    INDEX (tumor_descriptor)
);

CREATE TABLE tcga_demographic (
    id                      INTEGER     AUTO_INCREMENT,
    demographic_id          VARCHAR(55),
    project_id              VARCHAR(55),
    submitter_id            VARCHAR(55),
    case_id                 VARCHAR(55),
    ethnicity               VARCHAR(55),
    gender                  VARCHAR(55),
    race                    VARCHAR(55),
    year_of_birth           INTEGER,
    year_of_death           INTEGER,

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (case_id) REFERENCES tcga_case(case_id),
    UNIQUE (demographic_id),
    UNIQUE (project_id, submitter_id),
    INDEX (ethnicity),
    INDEX (gender),
    INDEX (race),
    INDEX (year_of_birth),
    INDEX (year_of_death)
);

CREATE TABLE tcga_diagnosis (
    id                          INTEGER     AUTO_INCREMENT,
    diagnosis_id                VARCHAR(55),
    project_id                  VARCHAR(55),
    submitter_id                VARCHAR(55),
    case_id                     VARCHAR(55),
    age_at_diagnosis            INTEGER,
    classification_of_tumor     VARCHAR(55),
    days_to_last_follow_up      INTEGER,
    days_to_last_known_disease_status   INTEGER,
    days_to_recurrence          INTEGER,
    last_known_disease_status   VARCHAR(55),
    morphology                  VARCHAR(255),
    primary_diagnosis           VARCHAR(255),
    progression_or_recurrence   VARCHAR(55),
    site_of_resection_or_biopsy VARCHAR(55),
    tissue_or_organ_of_origin   VARCHAR(55),
    tumor_grade                 VARCHAR(55),
    tumor_stage                 VARCHAR(55),
    vital_status                VARCHAR(55),
    days_to_birth               INTEGER,
    days_to_death               INTEGER,
    prior_malignancy            VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (case_id) REFERENCES tcga_case(case_id),
    UNIQUE (diagnosis_id),
    UNIQUE (project_id, submitter_id),
    INDEX (age_at_diagnosis),
    INDEX (classification_of_tumor),
    INDEX (days_to_last_follow_up),
    INDEX (days_to_last_known_disease_status),
    INDEX (last_known_disease_status),
    INDEX (morphology),
    INDEX (progression_or_recurrence),
    INDEX (site_of_resection_or_biopsy),
    INDEX (tumor_grade),
    INDEX (tumor_stage),
    INDEX (vital_status),
    INDEX (days_to_birth),
    INDEX (days_to_death),
    INDEX (prior_malignancy)
);

CREATE TABLE tcga_exposure (
    id                          INTEGER     AUTO_INCREMENT,
    exposure_id                 VARCHAR(55),
    project_id                  VARCHAR(55),
    submitter_id                VARCHAR(55),
    case_id                     VARCHAR(55),
    alcohol_history             VARCHAR(255),
    alcohol_intensity           VARCHAR(255),
    bmi                         FLOAT,
    cigarettes_per_day          FLOAT,
    height                      FLOAT,
    weight                      FLOAT,
    years_smoked                FLOAT,

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (case_id) REFERENCES tcga_case(case_id),
    UNIQUE (exposure_id),
    UNIQUE (project_id, submitter_id),
    INDEX (alcohol_history),
    INDEX (alcohol_intensity),
    INDEX (bmi),
    INDEX (cigarettes_per_day),
    INDEX (height),
    INDEX (weight),
    INDEX (years_smoked)
);

CREATE TABLE tcga_treatment (
    id                          INTEGER     AUTO_INCREMENT,
    treatment_id                VARCHAR(55),
    project_id                  VARCHAR(55),
    submitter_id                VARCHAR(55),
    case_id                     VARCHAR(55),
    days_to_treatment           INTEGER,
    therapeutic_agents          VARCHAR(55),
    treatment_intent_type       VARCHAR(255),
    treatment_or_therapy        VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (case_id) REFERENCES tcga_case(case_id),
    UNIQUE (treatment_id),
    UNIQUE (project_id, submitter_id),
    INDEX (days_to_treatment),
    INDEX (therapeutic_agents),
    INDEX (treatment_intent_type),
    INDEX (treatment_or_therapy)
);

CREATE TABLE tcga_family_history (
    id                              INTEGER     AUTO_INCREMENT,
    family_history_id               VARCHAR(55),
    project_id                      VARCHAR(55),
    submitter_id                    VARCHAR(55),
    case_id                         VARCHAR(55),
    relationship_age_at_diagnosis   FLOAT,
    relationship_gender             VARCHAR(55),
    relationship_primary_diagnosis  VARCHAR(255),
    relationship_type               VARCHAR(55),
    relative_with_cancer_history    VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (case_id) REFERENCES tcga_case(case_id),
    UNIQUE (family_history_id),
    UNIQUE (project_id, submitter_id),
    INDEX (relationship_age_at_diagnosis),
    INDEX (relationship_gender),
    INDEX (relationship_primary_diagnosis),
    INDEX (relationship_type),
    INDEX (relative_with_cancer_history)
);

CREATE TABLE tcga_workflow (
    id                              INTEGER     AUTO_INCREMENT,
    workflow_id      VARCHAR(55),
    project_id                      VARCHAR(55),
    submitter_id                    VARCHAR(55),
    sample_id                       VARCHAR(55),
    workflow_link                   VARCHAR(255),
    workflow_type                   VARCHAR(55),
    workflow_end_datetime           VARCHAR(55),
    workflow_start_datetime         VARCHAR(55),
    workflow_version                VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    UNIQUE (workflow_id),
    UNIQUE (project_id, submitter_id),
    INDEX (workflow_type),
    INDEX (workflow_end_datetime),
    INDEX (workflow_start_datetime)
);

CREATE TABLE tcga_file_expression (
    id                              INTEGER     AUTO_INCREMENT,
    file_id                         VARCHAR(55),
    project_id                      VARCHAR(55),
    submitter_id                    VARCHAR(55),
    workflow_id                     VARCHAR(55),
    data_category                   VARCHAR(55),
    data_format                     VARCHAR(55),
    data_type                       VARCHAR(55),
    experimental_strategy           VARCHAR(55),
    file_name                       VARCHAR(55),
    file_size                       INTEGER,
    md5sum                          VARCHAR(55),
    state_comment                   VARCHAR(55),

    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES tcga_project(project_id),
    FOREIGN KEY (workflow_id) REFERENCES tcga_workflow(workflow_id),
    UNIQUE (file_id),
    UNIQUE (project_id, submitter_id),
    UNIQUE (file_name),
    INDEX (data_category),
    INDEX (data_format),
    INDEX (data_type),
    INDEX (experimental_strategy),
    INDEX (state_comment)
);

CREATE TABLE tcga_expression (
    file_id                         VARCHAR(55),
    gene_id                         VARCHAR(55),
    value                           FLOAT,

    PRIMARY KEY (file_id, gene_id),
    INDEX (file_id),
    INDEX (gene_id)
);



INSERT INTO module_installed VALUES
    (@module_name, @module_version, @release_date)
;

INSERT INTO module_depend VALUES
    (@module_name, @module_version, 'basic', '>=0.1')
;
