#!/bin/bash -
#===============================================================================
#
#          FILE: attr.sh
#
#         USAGE: ./attr.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: ASHISH GAURAV
#  ORGANIZATION:
#       CREATED: 04/11/18 11:27
#      REVISION:  ---
#===============================================================================

echo -e "\n" > ATTRIBUTIONS.md; \
cd opt/src

GO_DEPS="$(find * -maxdepth 3 -mindepth 2 -type d)"

make_attr () {
 	echo -e "\n## $1 \n\n" >> ATTRIBUTIONS.md;
	echo -e "$2\n" >> ATTRIBUTIONS.md;
	echo -e '\n---\n' >> ATTRIBUTIONS.md;
	cat $1/$2 >> ATTRIBUTIONS.md;
	echo -e '\n---\n' >> ATTRIBUTIONS.md;
	echo -e '\n---\n' >> ATTRIBUTIONS.md;
	echo -e "\n\n" >> ATTRIBUTIONS.md;
}

for gdep in $GO_DEPS; do
	if [ -f $gdep/LICENSE ];then
        make_attr $gdep LICENSE
	else
		if [ -f $gdep/LICENSE.txt ];then
            make_attr $gdep LICENSE.txt
		else
			if [ -f $gdep/NOTICE ];then
                make_attr $gdep NOTICE
			fi;
		fi;
	fi;
done
mv ATTRIBUTIONS.md ../../


