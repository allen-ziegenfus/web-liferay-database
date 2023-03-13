#!/bin/bash

DATABASE_DIR=./database/docker-entrypoint-initdb.d
DATABASE_FILE_DEST=${DATABASE_DIR}/lportal.sql.gz
rm -f ${DATABASE_FILE_DEST}
mkdir -p $DATABASE_DIR

SERVER=https://files.liferay.com/private/lrdcom/developer_lportal-2023-03-09_11-00-PST.sql.gz

echo "LDAP User name:"
read LDAP_USERNAME
echo "Downloading from ${SERVER} authenticating as ${LDAP_USERNAME}"
curl -su $LDAP_USERNAME -o ${DATABASE_FILE_DEST} ${SERVER}
