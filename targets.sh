#!/bin/bash

LIST=$1
BASEDIR=$(dirname $0)

cat $LIST | while read line
do
    echo "================================================================================"
    echo " Target: $line "
    echo ""
    bash $BASEDIR/run.sh $line
done
