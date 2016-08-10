#!/bin/bash
pushd executor-base 
docker build -t executor-base .
popd
for dir in $(find -type d -name exec\*)
do
	DIR=$(basename $dir)
	pushd $DIR
	docker build -t $DIR .
	popd
done 
