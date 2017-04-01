#!/bin/bash

#Università degli Studi di Verona
#Dipartimento di Informatica
#Laboratorio di Sistemi Operativi - AA 2015/16
#Imola Davide
#VR386238

#Script di Prenotazione
ERRORE=0 
AULAOK=0

#Visualizzo le aule disponibili.
echo "Hai scelto la funzione di Prenotazione. Ecco l'elenco delle Aule disponibili:"
echo ""

for arg
do
	echo "  $arg"
done

echo ""
echo -n "Inserire il nome dell'aula che si desidera prenotare: "
read class

#Controllo che la classe inserita esista.
for arg
do
	if [ $arg = $class ]; then
		AULAOK=1
 	fi
done

#Richiedo in input le varie informazioni per la prenotazione.
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
	#Controllo che non vi sia già una prenotazione esistente.
	if [ $((righe)) -eq 0 ]; then
		echo -n "Inserire il proprio nome utente: "
		read utente
		#Effettuo prenotazione.
		echo "$class;$data;$ora;$utente" >> aule.txt
		echo "Prenotazione effettuata con successo."
	else
		echo "Aula già prenotata!"
	fi
else
	echo "Si è verificato un errore durante la prenotazione. Si prega di riprovare."
fi