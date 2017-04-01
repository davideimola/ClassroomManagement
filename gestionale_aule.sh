#!/bin/bash

#Università degli Studi di Verona
#Dipartimento di Informatica
#Laboratorio di Sistemi Operativi - AA 2015/16
#Imola Davide
#VR386238

#Inizio dello Script principale 
touch aule.txt #Creo se non esiste il file aule.txt

aule=("A" "B" "C" "D" "E" "Tessari")

while [ true ] #Ciclo fino a quando non si chiede di chiudere il programma.
do
	#Stampo il menu interattivo
	echo -n "
 1) Prenota
 2) Elimina prenotazione
 3) Mostra Aula
 4) Prenotazioni per aula
 5) Esci

Indicare il numero dell'opzione desiderata: "

	#Leggo da tastiera la scelta dell'utente.
	read choice

	#Eseguo la funzione in base alla scelta dell'Utente.
	case "$choice" in
		"1") ./prenota.sh ${aule[@]};;
		"2") ./elimina.sh ${aule[@]};;
		"3") ./mostra_aula.sh ${aule[@]};;
		"4") ./prenotazioni.sh ${aule[@]};;
		"5") echo "Grazie e alla prossima!"; exit;;
		*) echo "Valore non corretto."
	esac
done