#!/bin/bash

# Script pour la préparation des dates 

D="26/08/2013"
DD="${D:6:4}${D:3:2}${D:0:2}"
 
JS="$(date -d $DD +%u)"
echo    "              Jour : $JS"
((JS==1)) && LUN=-7 || LUN=$((1-JS))
((JS==7)) && DIM=7  || DIM=$((7-JS))
 
echo -n " Date de référence : " ; date -d "$DD"
echo -n "   Lundi précédent : " ; date -d "$DD $LUN days"
echo -n "  Dimanche suivant : " ; date -d "$DD $DIM days"

for i in $(seq 1 45)
do
	echo -ne "$(echo $i | sed "s/^\([1-9]\)$/0\1/") "
	date -d "$DD $((7*$i-7)) days" "+%a %Y/%m/%d"
	#date -d "$DD $((7*$i-7)) days" +%Y%m%d-%H%M%S
done

unset D J DD JS LUN DIM

