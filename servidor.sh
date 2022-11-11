#!/bin/bash

PORT="2223"

echo "Servidor Transfer Unite Recursive Internationel Protocol: TURIP"

echo "(0) LISTEN"
MSG=`nc -l $PORT`
HS=`echo $MSG | cut -d " " -f 1`
IP=`echo $MSG | cut -d " " -f 2`

echo "(3) SEND: Comprobacion"
if [ "$HS" != "HOLI_TURIP" ]
then 
	echo "ERROR 1: Handshake incorrecto"
	echo "KO_TURIP" | nc $IP $PORT
	exit 1
fi

echo "OK_TURIP" | nc $IP $PORT

echo "(4) LISTEN"

MSG=`nc -l $PORT`
PREFIX=`echo $MSG | cut -d " " -f 1`
FILE_NAME=`echo $MSG | cut -d " " -f 2`

echo "(7) SEND: Comprobacion"
if [ "$PREFIX" != "FILE_NAME" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	echo "KO_TURIP" | nc $IP $PORT
	exit 2
fi

echo "OK_TURIP" | nc $IP $PORT

echo "(8) LISTEN: Datos de IP.IP"

`nc -l $PORT` > inbox/$FILE_NAME





exit 0
