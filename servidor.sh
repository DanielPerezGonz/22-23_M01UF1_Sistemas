#!/bin/bash

echo "Servidor Transfer Unite Recursive Internationel Protocol: TURIP"

echo "(0) LISTEN"
HS=(`nc -l 2223`) | (cut -d " " -f 1)
IP=(`nc -l 2223`) | (cut -d " " -f 2)

if [ "$HS" != "HOLI_TURIP" ]
then 
	echo "ERROR 1: Handshake incorrecto"
	exit 1
fi
