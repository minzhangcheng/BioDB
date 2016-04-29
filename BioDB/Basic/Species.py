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


from MPL.MySQL import MySQL
import BioDB.Common

__columns = ['ncbi_taxa_id', 'common_name', 'lineage_string', 'genus', 'species',
             'parent_id', 'left_value', 'right_value', 'taxonomic_rank']

def map(source, sourceType, targetType, biodb):
    return BioDB.Common.map(source, sourceType, targetType, 'species', biodb)


def importGo(biodb, infile=None, godb=None, byCMD=True):
    if godb:
        if biodb == godb:
            q = 'INSERT INTO %s.species (%s)\n' \
                % (biodb.database(), ', '.join(__columns))
            q += 'SELECT % sFROM %s.species'\
                % (godb.database(), ', '.join(__columns))
            return biodb.query(q)
        