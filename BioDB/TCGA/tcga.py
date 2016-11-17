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


import BioDB.TCGA.schema

from BioDB.TCGA.schema import connect


class Program(BioDB.TCGA.schema.tcga_program):
    pass


class Project(BioDB.TCGA.schema.tcga_project):
    pass


class TissueSourceSite(BioDB.TCGA.schema.tcga_tissue_source_site):
    pass


class Case(BioDB.TCGA.schema.tcga_case):
    pass


class Sample(BioDB.TCGA.schema.tcga_sample):
    pass


class Demographic(BioDB.TCGA.schema.tcga_demographic):
    pass


class Diagnosis(BioDB.TCGA.schema.tcga_diagnosis):
    pass


class Exposure(BioDB.TCGA.schema.tcga_exposure):
    pass


class Treatment(BioDB.TCGA.schema.tcga_treatment):
    pass


class FamilyHistory(BioDB.TCGA.schema.tcga_family_history):
    pass


class Workflow(BioDB.TCGA.schema.tcga_workflow):
    pass


class File_expression(BioDB.TCGA.schema.tcga_file_expression):
    pass


class Expression(BioDB.TCGA.schema.tcga_expression):
    pass
