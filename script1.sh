
if [ -d '/root/itfinden' ]; then
        echo; echo; echo "Directorio de logs ya existe"
else
        mkdir /root/itfinden
fi

#Verificando si el directorio logs-scripts existe

if [ -d '/root/itfinden/logs-scripts-itfinden' ]; then
        echo; echo; echo "Directorio de logs ya existe"
else
        mkdir /root/itfinden/logs-scripts-itfinden
fi

# no eliminar esto
mkdir /etc/private
# fin esto
rm -rf /etc/private/.envios
rm -rf /etc/private/.envios2
rm -rf /root/itfinden/.envios
rm -rf /root/itfinden/.envios2

echo; echo -n 'Generando archivo el cual contiene los correos electronicos.....'
echo "soporte@itfinden.com" >> /etc/private/.envios
echo "soporte@itfinden.com" >> /etc/private/.envios2


#Configuracion para servidor dedicados

echo -n ''
echo; echo -n 'Creando cron jobs.....'
rm -rf /etc/cron.d/mejoramiento
echo "SHELL=/bin/sh
0 21 * * * root sh /etc/private/act.sh>/dev/null 2>&1
*/5 * * * * root sh /etc/private/eximqueue.sh>/dev/null 2>&1
0 22 * * * root sh /etc/private/smartd.sh>/dev/null 2>&1
" >> /etc/cron.d/mejoramiento

