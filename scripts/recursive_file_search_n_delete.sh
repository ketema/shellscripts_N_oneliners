#!/bin/bash

#It is the purpose of this script to loop over all the files in a directory
#and the files in subdirectories looking for a pattern and deleting it

if [ -z "${2}" ]; then
	echo "really? try using $(basename ${0}) direcory search_pattern  dummy"
	exit
fi

cd ${1}
SEARCH=${2}

for EACH in $(${1}/$(grep -rH "${SEARCH}" * | cut -f1 -d":")); do
	sed -i "/${SEARCH}/d" ${EACH};
done
