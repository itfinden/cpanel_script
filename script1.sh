
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


#Copiar  archivos
cp /root/itfinden-cpanel_script/private/diario.sh /etc/private/diario.sh
cp /root/itfinden-cpanel_script/private/eximqueue.sh /etc/private/eximqueue.sh
cp /root/itfinden-cpanel_script/private/smartd.sh /etc/private/smartd.sh

#Configuracion para servidor dedicado

cat <(crontab -l) <(echo "0 8 * * * /root/itfinden-cpanel_script/liberaswap.sh") | crontab -
cat <(crontab -l) <(echo "0 8 * * * /etc/private/diario.sh>/dev/null 2>&1") | crontab -
cat <(crontab -l) <(echo "0 8 * * * /etc/private/eximqueue.sh>/dev/null 2>&1") | crontab -
cat <(crontab -l) <(echo "0 8 * * * /etc/private/smartd.sh>/dev/null 2>&1") | crontab -
