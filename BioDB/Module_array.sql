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
-- Module array
-- Version 0.1
--
-- ---------------------------------------------------------------------------


set @module_name = 'array';
set @module_version = '0.1';

CREATE TABLE array_array (
    id          INTEGER     AUTO_INCREMENT,
    species_id  INTEGER,
    name        VARCHAR(255),
    company     VARCHAR(255),
    oligo_count INTEGER,
    array_type  VARCHAR(55),
    array_desc  TEXT,
    
    PRIMARY KEY (id),
    FOREIGN KEY (species_id) REFERENCES species(id),
    UNIQUE (name, company),
    INDEX (species_id),
    INDEX (name),
    INDEX (company),
    INDEX (array_type),
    INDEX (species_id, array_type),
    INDEX (species_id, company),
    INDEX (species_id, name)
);

CREATE TABLE array_oligo (
    id      INTEGER     AUTO_INCREMENT,
    name    VARCHAR(55),
    seq     VARCHAR(128),
    
    PRIMARY KEY (id),
    INDEX (name)
);

CREATE TABLE array_probe (
    id          INTEGER     AUTO_INCREMENT,
    array_id    INTEGER,
    oligo_id    INTEGER,
    
    PRIMARY KEY (id),
    FOREIGN KEY (array_id) REFERENCES array_array(id),
    FOREIGN KEY (oligo_id) REFERENCES array_oligo(id),
    UNIQUE (array_id, oligo_id),
    INDEX (array_id),
    INDEX (oligo_id)
);

CREATE TABLE array_probe_gene (
    probe_id    INTEGER,
    gene_id     INTEGER,
    
    PRIMARY KEY (probe_id, gene_id),
    FOREIGN KEY (probe_id) REFERENCES array_probe(id),
    FOREIGN KEY (gene_id) REFERENCES gene(id),
    INDEX (probe_id),
    INDEX (gene_id)
);

CREATE TABLE array_probe_dbxref (
    probe_id    INTEGER,
    dbxref_id     INTEGER,
    
    PRIMARY KEY (probe_id, dbxref_id),
    FOREIGN KEY (probe_id) REFERENCES array_probe(id),
    FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
    INDEX (probe_id),
    INDEX (dbxref_id)
);

CREATE TABLE array_probe_go (
    probe_id    INTEGER,
    term_id     INTEGER,
    
    PRIMARY KEY (probe_id, term_id),
    FOREIGN KEY (probe_id) REFERENCES array_probe(id),
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    INDEX (probe_id),
    INDEX (term_id)
);

INSERT INTO module_installed VALUES
    (@module_name, @module_version)
;

INSERT INTO module_depend VALUES
    (@module_name, @module_version, 'basic', '>=0.1'),
    (@module_name, @module_version, 'go', '>=0.1')
;
