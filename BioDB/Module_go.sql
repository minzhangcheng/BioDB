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
-- Module go
-- Version 0.1
--
-- ---------------------------------------------------------------------------


set @module_name = 'go';
set @module_version = '0.1';

CREATE TABLE go_term (
    id          INTEGER     AUTO_INCREMENT,
    name        VARCHAR(255),
    type        VARCHAR(55),
    go_acc      VARCHAR(255),
    is_obsolete INTEGER,
    is_root     INTEGER,
    is_relation INTEGER,
    
    PRIMARY KEY (id),
    UNIQUE (go_acc),
    INDEX (name),
    INDEX (type),
    INDEX (is_obsolete),
    INDEX (is_root),
    INDEX (is_relation)
);

CREATE TABLE go_term2term (
    id              INTEGER AUTO_INCREMENT,
    term_id_1       INTEGER,
    term_id_2       INTEGER,
    type            INTEGER,
    complete        INTEGER,
    
    PRIMARY KEY (id),
    FOREIGN KEY (term_id_1) REFERENCES go_term(id),
    FOREIGN KEY (term_id_2) REFERENCES go_term(id),
    FOREIGN KEY (type) REFERENCES go_term(id),
    UNIQUE (id, term_id_1, term_id_2, type),
    INDEX (term_id_1),
    INDEX (term_id_2),
    INDEX (type),
    INDEX (term_id_1, type),
    INDEX (term_id_2, type),
    INDEX (term_id_1, term_id_2)
);

CREATE TABLE go_term_dbxref (
    term_id         INTEGER,
    dbxref_id       INTEGER,
    is_definition   INTEGER,
    
    PRIMARY KEY (term_id, dbxref_id, is_definition),
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
    INDEX (term_id),
    INDEX (dbxref_id),
    INDEX (term_id, dbxref_id)
);

CREATE TABLE go_term_definition (
    term_id             INTEGER,
    term_definition     TEXT,
    dbxref_id           INTEGER,
    term_comment        TEXT,
    
    PRIMARY KEY (term_id),
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    FOREIGN KEY (dbxref_id) REFERENCES dbxref(id)
);

CREATE TABLE go_term_subset (
    term_id     INTEGER,
    subset_id   INTEGER,
    
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    FOREIGN KEY (subset_id) REFERENCES go_term(id),
    INDEX (term_id),
    INDEX (subset_id)
);

CREATE TABLE go_term_synonym (
    term_id             INTEGER,
    term_synonym        VARCHAR(255),
    go_acc_synonym      VARCHAR(255),
    synonym_type_id     INTEGER,
    synonym_category_id INTEGER,
    
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    FOREIGN KEY (synonym_type_id) REFERENCES go_term(id),
    FOREIGN KEY (synonym_category_id) REFERENCES go_term(id),
    UNIQUE INDEX (term_id, term_synonym),
    INDEX (term_id),
    INDEX (term_synonym),
    INDEX (synonym_type_id),
    INDEX (synonym_category_id)
);

CREATE TABLE go_term_gene (
    id              INTEGER,
    term_id         INTEGER,
    gene_id         INTEGER,
    is_not          INTEGER,
    role_group      INTEGER,
    assoc_date      DATE,
    source_db_id    INT,
    
    PRIMARY KEY (id),
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    FOREIGN KEY (gene_id) REFERENCES gene(id),
    FOREIGN KEY (role_group) REFERENCES go_term(id),
    FOREIGN KEY (source_db_id) REFERENCES db(id),
    INDEX (term_id),
    INDEX (gene_id),
    INDEX (assoc_date),
    INDEX (source_db_id),
    INDEX (term_id, gene_id)
);

CREATE TABLE go_term_qualifier (
    id                  INTEGER,
    term_gene_id  INTEGER,
    term_id       INTEGER,
    value               VARCHAR(255),
    
    PRIMARY KEY (id),
    FOREIGN KEY (term_id) REFERENCES go_term(id),
    FOREIGN KEY (term_gene_id) REFERENCES go_term(id),
    INDEX (term_gene_id),
    INDEX (term_id),
    INDEX (term_gene_id, term_id)
);


INSERT INTO module_installed VALUES
    (@module_name, @module_version)
;

INSERT INTO module_depend VALUES
    (@module_name, @module_version, 'basic', '>=0.1')
;
