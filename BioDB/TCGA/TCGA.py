import BioDB.TCGA.schema


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
