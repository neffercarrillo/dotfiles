#! /usr/bin/env bash

SCRIPT_NAME="set.sh"

for i in $(ls src/); do
    if [ -h ~/.$i ]; then
	echo $SCRIPT_NAME": deleting file" ~/.$i
	rm -f ~/.$i
	echo $SCRIPT_NAME": creating link to ."$i "from "$(pwd)/src/$i
	ln -s $(pwd)/src/$i ~/.$i
    else
	echo $SCRIPT_NAME": creating link to ."$i "from "$(pwd)/src/$i
	ln -s $(pwd)/src/$i ~/.$i			
    fi
done
        
