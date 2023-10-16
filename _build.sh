#!/bin/sh
set -xe

FILES=`find . -name '[^_]*.xml'`

for FILE in ${FILES}; do
	TARGET=${FILE%.xml}.html
	echo '<!doctype html>' > ${TARGET}
	xml tr template.xslt ${FILE} >> ${TARGET}
done
