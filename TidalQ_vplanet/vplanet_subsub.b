alias vplanet="/home/hector/Dropbox/UNIVERSIDAD/Pittsburgh/Habitable_zones/vplanet/vplanet"

#!/bin/sh

lista1=`ls -d */`

#echo $lista1

for i in $lista1; do

cd ./$i

lista2=`ls -d */`

#echo $lista2

for j in $lista2; do

cd ./$j

vplanet vpl.in

cd ..

done 

cd ..

done


# If executed via sh run_MESA_subsub.b, interrupt with CTRL + C

# If executed via sh run_MESA_subsub.b &, more things could be written on the terminal, or the terminal could even be closed as the script will run on the background

# If the execution wants to be aborted, kill via top (k+name of process). If the username does not appear there, press u, write the username and press enter, then k+name of process

