#!/bin/bash

#Università degli Studi di Verona
#Dipartimento di Informatica
#Laboratorio di Sistemi Operativi - AA 2015/16
#Imola Davide
#VR386238

#Script di cancellazione della prenotazione.
ERRORE=0
AULAOK=0

echo "Hai scelto la funzione di Eliminazione della prenotazione. Ecco l'elenco delle Aule disponibili:"
echo ""

for arg
do
	echo "  $arg"
done

echo ""
echo -n "Inserire il nome dell'aula di cui si desidera eliminare la prenotazione: "
read class
#Selezione dell'aula da mostrare e relativa ricerca per vedere se l'aula inserita esiste.
for arg
do
	if [ $arg = $class ]; then
		AULAOK=1
 	fi
done

if [ $((AULAOK)) -eq 1 ]; then
	echo -n "Inserire il giorno nella quale si vuole prenotare (formato aaaammgg): "
	read data
	echo -n "Inserire l'ora di prenotazione: "
	read ora
	if [ $((ora)) -ge 18 ] || [ $((ora)) -le 7 ]; then
		ERRORE=1
		echo "L'orario inserito non è valido."
	fi
else
	echo "L'Aula richiesta non risulta nel nostro elenco."
	ERRORE=1
fi

if [ $ERRORE = "0" ]; then
	righe=$(grep "$class;$data;$ora" aule.txt | wc -l)
	#Controllo se vi è la prenotazione. Se esiste la elimino salvando il file.
	if [ $((righe)) -eq 1 ]; then
		numero=$(grep -n "$class;$data;$ora" aule.txt | cut -d":" -f1)
		sed -i -e $((numero))d aule.txt
		echo "Eliminazione avvenuta con successo."
	else
		echo "La prenotazione richiesta non esiste!"
	fi
else
	echo "Si è verificato un errore durante l'eliminazione. Si prega di riprovare."
fi