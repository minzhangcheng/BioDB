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
-- Module hpa
-- Version 0.1
--
-- ---------------------------------------------------------------------------


set @module_name = 'hpa';
set @module_version = '0.1';
set @release_date = '20160423';

CREATE TABLE hpa_normal (
    id          INTEGER     AUTO_INCREMENT,
    protein_id  VARCHAR(25),
    dbxref_id	INTEGER,
    symbol      VARCHAR(15),
    tissue		VARCHAR(25),
    cell_type	VARCHAR(50),
    expr_level	VARCHAR(10),
    expr_type	VARCHAR(10),
    reliability	VARCHAR(15),
    
    PRIMARY KEY (id),
    FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
    UNIQUE (protein_id),
    INDEX (symbol),
    INDEX (tissue),
    INDEX (cell_type),
    INDEX (expr_level),
    INDEX (reliability)
);

CREATE TABLE hpa_cancer (
	id			INTEGER		AUTO_INCREMENT,
	protein_id	VARCHAR(25),
    dbxref_id	INTEGER,
	symbol		VARCHAR(15),
	tumor		VARCHAR(55),
	expr_level	VARCHAR(10),
	count		INTEGER,
	total_count	INTEGER,
  	ratio		FLOAT,
	expr_type	VARCHAR(10),
	
	PRIMARY KEY (id),
	FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
	UNIQUE (protein_id),
	INDEX (symbol),
    INDEX (tumor),
    INDEX (expr_level),
    INDEX (ratio),
    INDEX (count),
    INDEX (total_count)
);

CREATE TABLE hpa_localization (
	id			INTEGER		AUTO_INCREMENT,
	protein_id	VARCHAR(25),
    dbxref_id	INTEGER,
	symbol		VARCHAR(15),
	main_loc	VARCHAR(100),
	other_loc	VARCHAR(100),
	expr_type	VARCHAR(10),
	reliability	VARCHAR(15),
	main_go		VARCHAR(100),
	other_go	VARCHAR(100),
	
	PRIMARY KEY (id),
	FOREIGN KEY (dbxref_id) REFERENCES dbxref(id),
	UNIQUE (protein_id),
	INDEX (symbol),
	INDEX (main_loc),
	INDEX (other_loc),
	INDEX (reliability),
	INDEX (main_go),
	INDEX (other_go)
);

INSERT INTO module_installed VALUES
    (@module_name, @module_version, @release_date)
;

INSERT INTO module_depend VALUES
    (@module_name, @module_version, 'basic', '>=0.1')
;
