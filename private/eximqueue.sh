#!/bin/bash
strContador=$(/usr/sbin/exim -bpc)
if [ $strContador -gt 600 ]
then
TEMPFILE=/root/itfinden/logs-scripts-itfinden/exim.txt
rm -rf $TEMPFILE
Host=`hostname`
Asunto="Maquina $Host tiene mas de 600 correos en cola"
echo "*****************************************************************************" >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
echo "Total de correos en cola: "                                                    >> $TEMPFILE
echo ""  >> $TEMPFILE
/usr/sbin/exim -bpc >> $TEMPFILE
echo ""
echo "*****************************************************************************" >> $TEMPFILE
echo "Saludos Bot de monitoreo :)"  >> $TEMPFILE
 mail -s "$Asunto" $(/bin/cat -- /root/itfinden/.envios) < $TEMPFILE
rm -rf /var/spool/exim/input/*
else
echo "funciona?"
fi
