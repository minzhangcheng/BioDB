-- ---------------------------------------------------------------------------
--
-- Copyright (C) 2015 Minzhang Cheng
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
-- Module basic
-- Version 0.1
--
-- ---------------------------------------------------------------------------


set @module_name = 'basic';
set @module_version = '0.1';
set @release_date = '20160423';

CREATE TABLE species (
    id              INTEGER     AUTO_INCREMENT,
    ncbi_taxa_id    INTEGER,
    common_name     VARCHAR(255),
    lineage_string  TEXT,
    genus           VARCHAR(55),
    species         VARCHAR(255),
    parent_id       INTEGER,
    left_value      INTEGER,
    right_value     INTEGER,
    taxonomic_rank  VARCHAR(255),
    
    PRIMARY KEY (id),
    UNIQUE (ncbi_taxa_id),
    INDEX (common_name),
    INDEX (genus),
    INDEX (species),
    INDEX (parent_id),
    INDEX (left_value),
    INDEX (right_value),
    INDEX (genus, species),
    INDEX (left_value, right_value),
    INDEX (genus, left_value, right_value)
);

CREATE TABLE db (
    id          INTEGER		AUTO_INCREMENT,
    name        VARCHAR(55),
    fullname    VARCHAR(255),
    datatype    VARCHAR(255),
    generic_url VARCHAR(255),
    url_syntax  VARCHAR(255),
    url_example VARCHAR(255),
    uri_prefix  VARCHAR(255),
    
    PRIMARY KEY (id),
    UNIQUE (name),
    INDEX (fullname),
    INDEX (datatype)
);

CREATE TABLE dbxref (
    id          INTEGER     AUTO_INCREMENT,
    db_id       INTEGER,
    ref         VARCHAR(255),
    ref_type    VARCHAR(55),
    ref_desc    VARCHAR(255),
    
    PRIMARY KEY (id),
    FOREIGN KEY (db_id) REFERENCES db(id),
    UNIQUE (db_id, ref),
    INDEX (ref)
);

CREATE TABLE gene (
    id          INTEGER     AUTO_INCREMENT,
    symbol      VARCHAR(255),
    dbxref_id   INTEGER,
    species_id  INTEGER,
    type   VARCHAR(55),
    fullname    TEXT,
    
    PRIMARY KEY (id),
    FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
    FOREIGN KEY (species_id) REFERENCES species(id),
    INDEX (symbol),
    INDEX (species_id),
    INDEX (type),
    INDEX (symbol, species_id)
);

CREATE TABLE gene_dbxref (
    gene_id     INTEGER,
    dbxref_id   INTEGER,
    
    PRIMARY KEY (gene_id, dbxref_id),
    FOREIGN KEY (gene_id) REFERENCES gene(id),
    FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
    INDEX (gene_id),
    INDEX (dbxref_id)
);

INSERT INTO module_installed VALUES
    (@module_name, @module_version, @release_date)
;