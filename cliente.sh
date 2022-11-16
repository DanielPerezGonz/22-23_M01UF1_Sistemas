#!/bin/bash

SERVER_AD="localhost"
IP_LOCAL="127.0.0.1"
PORT="2223"

echo "Cliente TURIP"

echo "(1) SEND MSG: HOLI_TURIP"

IP_MD5=`echo $IP_LOCAL | md5sum | cut -d " " -f 1` 

echo "HOLI_TURIP $IP_LOCAL $IP_MD5" | nc $SERVER_AD $PORT

echo "(2) LISTEN: Comprobacion Handshake"

MSG=`nc -l $PORT`

echo $MSG

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 1: Handshake incorrecto"
	exit 1
fi

echo "(5) SEND MSG"

FILE_NAME="IP.IP"

echo "FILE_NAME $FILE_NAME" | nc $SERVER_AD $PORT

echo "(6) LISTEN"

MSG=`nc -l $PORT`

echo $MSG

if [ "$MSG" != "OK_TURIP" ]
then
	echo "ERROR 2: Prefijo incorrecto"
	exit 2
fi

echo "(9) SEND: Datos de IP.IP"

cat ip_ip/$FILE_NAME | nc $SERVER_AD $PORT

exit 0
