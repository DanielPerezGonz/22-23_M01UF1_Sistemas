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
PRF=`echo $MSG | cut -d " " -f 1`
FN=`echo $MSG | cut -d " " -f 2`

echo "(7) SEND: Comprobacion"
if [ "$PRF" != "FILE_NAME" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	echo "KO_TURIP" | nc $IP $PORT
	exit 2
fi

echo "OK_TURIP" | nc $IP $PORT









exit 0
