#!/bin/bash

#Comprobando directorio

if [ -d '/root/itfinden' ]; then
        echo; echo; echo "Directorio de logs ya existe"
else
        mkdir /root/itfinden
fi

#Verificando si el directorio logs-scripts-itfinden existe

if [ -d '/root/itfinden/logs-scripts-itfinden' ]; then
        echo; echo; echo "Directorio de logs ya existe"
else
        mkdir /root/itfinden/logs-scripts-itfinden
fi

#Verificando si el directorio smart existe

if [ -d '/root/itfinden/logs-scripts-itfinden/smart' ]; then
        echo; echo; echo "Directorio smart ya existe"
else
        mkdir /root/itfinden/logs-scripts-itfinden/smart
fi

#borramos log

rm -rf /root/itfinden/logs-scripts-itfinden/smart/resultado-smart.log

#ejecutamos el comando de CPanel y lo guardamos en un log

/scripts/smartcheck >>/root/itfinden/logs-scripts-itfinden/smart/resultado-smart.log


DBS=`cat /root/itfinden/logs-scripts-itfinden/smart/resultado-smart.log|grep Errors`
        for b in $DBS ;
        do
echo ""
done
if [ "$b" = "Errors:" ]; then
Host=`hostname`

Asunto="Posible falla de disco duro en $Host"
TEMPFILE=/root/itfinden/logs-scripts-itfinden/smart/envio.log
rm -rf $TEMPFILE

echo "*****************************************************************************" >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
echo "En el servidor $Host se ha detectado el siguiente error en uno de sus discos duros " >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
cat /root/itfinden/logs-scripts-itfinden/smart/resultado-smart.log >> $TEMPFILE
echo ""  >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
echo "Favor de comprobar este problema y tomar las medidas necesarias " >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
echo "Saludos Bot de monitoreo :)"  >> $TEMPFILE
echo ""                                                                              >> $TEMPFILE
mail -s "$Asunto" $(/bin/cat -- /root/itfinden/.envios) < $TEMPFILE
rm -rf $TEMPFILE
else
echo ""
echo "No me apetece saber como te llamas"
fi
