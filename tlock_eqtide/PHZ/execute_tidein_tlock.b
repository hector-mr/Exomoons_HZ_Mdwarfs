#!/usr/local/bin/sh

alias eqtide="/home/hector/Dropbox/UNIVERSIDAD/Pittsburgh/Habitable_zones/EqTide/eqtide"

# Navigate into the directories and execute cript

list1=`ls -d */`

for i in $list1; do

    cd ./$i

    list2=`ls -d */`

        for l in $list2; do

        cd ./$l

        eqtide tide.in

        cd ..

        done 

    cd ..

done