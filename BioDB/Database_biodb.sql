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
-- SCHEMA biodb
-- Version 0.1
--
-- ---------------------------------------------------------------------------


DROP SCHEMA IF EXISTS biodb
;

CREATE SCHEMA biodb
;
USE biodb
;

CREATE TABLE module_installed (
    module      VARCHAR(55),
    version     VARCHAR(55),
    
    PRIMARY KEY (module, version),
    UNIQUE (module),
    INDEX (version)
);

CREATE TABLE module_depend (
    module                  VARCHAR(55),
    version                 VARCHAR(55),
    depend_module           VARCHAR(55),
    depend_module_version   VARCHAR(55),
    
    INDEX (module),
    INDEX (version),
    INDEX (module, version),
    INDEX (depend_module)
);
