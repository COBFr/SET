#!/bin/bash
# Script pour la préparation des dates 

#Date du lundi de la première semaine de cours : yyyymmjj
D="20140901"

# nombre de semaine à afficher
SEM="37"

# Liste des lundis des semaine de vacances : jjmm séparé par des espaces
VAC="2010 2710 2212 2912 1602 0604 1304"

# Affichage des variables afin de contrôlle
echo -n "% Date de référence : $D :" ; date -d "$D"
echo "% Vacances $VAC"

# On passe la date donnée une semaine en avance pour la caller sur l'itération hebdomadaire
D="$(date -d "$D -7 days" +%Y%m%d)"

# Construction du test des vacances
SED="$(echo "s/^\(${VAC}\).*/vac/" | sed -e 's/ /\\|/g')"
#SED="s/^\(2110\|2810\|2312\|3012\|0303\|1404\|2104\).*/vac/"

# Boucle sur le nombre de semaine
echo "\newcommand\bashtit{%"
for i in $(seq -w 1 $SEM)
do
	# ajoute une semaine à la date
	D="$(date -d "$D +7 days" +%Y%m%d)"
	# boucle qui vérifie que la date donnée n'est pas une semaine de vacance
	while [[ $(echo ${D:6:2}${D:4:2} | sed -e "$SED") = "vac" ]]
	do
		D="$(date -d "$D +7 days" +%Y%m%d)"
		TABV="|"
	done

	# Ajout de la collone dans le tableau LaTeX
	TAB="${TAB}${TABV}A"
	unset TABV

	# Affichage du résultat sur le terminal
	echo -e "\t$(date -d "$D" "+\\\tit{%d}{%m}")$(date -d "$D +4 days" "+{%d}{%m}"){$i}%"
done
echo "}"

## Sortie LaTeX
# Collones à chaques lignes
echo "\newcommand\bashtab{$(echo $TAB | sed -e 's/|//g'|sed -e 's/./\&/g')}"

# Nombre de collones
echo "\newcommand\bashnum{$(( $(echo $TAB | wc -m) - 3 ))}"

# Affiche de la ligne de gestion des collones LaTeX
echo "\newcommand\bashcol{\begin{tabular}{|cc|${TAB}}}"


# désafectation des variables
unset D DD SED i SEM VAC TAB

