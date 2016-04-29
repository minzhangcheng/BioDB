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


def map(source, sourceType, targetType, table, mysql):
    return mysql.find({sourceType: source}, [targetType], table)[0][0]

