#!/bin/bash

#Università degli Studi di Verona
#Dipartimento di Informatica
#Laboratorio di Sistemi Operativi - AA 2015/16
#Imola Davide
#VR386238

#Script che mostra in ordine di data e orario le prenotazioni di una determinata aula.
AULAOK=0

echo "Hai scelto la funzione di osservare le prenotazioni di una determinata Aula. Scegli quale vuoi vedere:"
echo ""
#Selezione dell'aula da mostrare e relativa ricerca per vedere se l'aula inserita esiste.
for arg
do
	echo "  $arg"
done

echo ""
echo -n "Inserire il nome dell'aula della quale si vogliono vedere le prenotazioni: "
read class

for arg
do
	if [ $arg = $class ]; then
		AULAOK=1
 	fi
done

if [ $((AULAOK)) -eq 1 ]; then
	echo ""
	echo "PRENOTAZIONI AULA $class"
	echo ""
	echo "Giorno Ora Utente"
	echo ""
	#Visualizzo le prenotazioni dell'aula in formato aaaammdd oo user.
	grep "$class;" aule.txt | sed 's/;/ /g' | cut -d" " -f2-4 | sort -n -k1 -k2
else
	echo "L'Aula inserita non è tra quelle elencate. Riprova."
fi