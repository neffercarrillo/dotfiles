#! /usr/bin/env bash

SCRIPT_NAME="set.sh"

for i in $( ls ); do
    if [ $i != "set.sh" ]; then
		if [ -a ~/.$i ]; then
			echo $SCRIPT_NAME": deleting file" ~/.$i
			rm -f ~/.$i
			echo $SCRIPT_NAME": creating link to ."$i "from "$(pwd)/$i
			ln -s $(pwd)/$i ~/.$i
		else
			echo $SCRIPT_NAME": creating link to ."$i "from "$(pwd)/$i
			ln -s $(pwd)/$i ~/.$i			
		fi
	fi
done
        
