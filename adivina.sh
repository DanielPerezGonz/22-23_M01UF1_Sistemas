#!/bin/bash

echo "Comienza el juego"
NUMERO_RANDOM=$(( $RANDOM % 100 + 1))
NUM=0
while [ $NUM -ne $NUMERO_RANDOM ]
do
	echo "Adivina el numero del 1 al 100"
	read NUM
	if [ "$NUM" -gt $NUMERO_RANDOM ]
	then
		echo "Es menor"
	elif [ $NUM -lt $NUMERO_RANDOM ]
	then
		echo "Es mayor"
	else
		echo "Correcto" 
	fi
done
