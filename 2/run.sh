#! /bin/bash
while IFS=',' read -r f1 f2 f3 f4 rest
do
    echo "Element1 : $f1"
    echo "Element2 : $f2"
    echo "Element3 : $f3"
    echo "Element4 : $f4"
    arr+=( "$f1" )
done <data

