#!/bin/bash

#Università degli Studi di Verona
#Dipartimento di Informatica
#Laboratorio di Sistemi Operativi - AA 2015/16
#Imola Davide
#VR386238

#Script che visualizza il totale delle presentazioni per le relative aule in ordine crescente.
echo "Hai scelto la funzione di osservare quante prenotazioni hanno le varie Aule."
echo ""
#Viene utilizzato un file temporaneo dove vengono memorizzati per ogni aula quante prenotazioni ci sono prima di andare a ordinarle.
touch pren.txt
for arg
do
	#Ciclo che per ogni aula calcola quante prenotazioni sono state eseguite.
	num=$(cut -d";" -f1 aule.txt | grep $arg | wc -l)
	echo "$arg: $((num))" >> pren.txt
done

#Ordino il file secondo il numero e poi rimuovo il file temporaneo.
sort -n -t " " -k2 pren.txt
rm pren.txt