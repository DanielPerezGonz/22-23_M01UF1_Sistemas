#!/bin/bash

SERVER_AD="localhost"

PORT="2223"

echo "Cliente TURIP"

echo "(1) SEND MSG: HOLI_TURIP"

echo "HOLI_TURIP 127.0.0.1" | nc $SERVER_AD $PORT

echo "(2) LISTEN: Comprobacion Handshake"

MSG=`nc -l $PORT`

echo $MSG

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"
	exit 1
fi

echo "(5) SEND MSG"

echo "FILE_NAME IP.IP" | nc $SERVER_AD $PORT

echo "(6) LISTEN"

MSG=`nc -l $PORT`

echo $MSG

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	exit 2
fi



exit 0
