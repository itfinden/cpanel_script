echo "Creando log de spam"
rm -rf /var/log/registro-spam.log
touch /var/log/registro-spam.log
chown cpaneleximfilter. /var/log/registro-spam.log
chmod 0744 /var/log/registro-spam.log
echo "Hecho.."

echo "Agregando filtro exim"
rm -rf /etc/antivirus2.exim
touch /etc/antivirus2.exim

###########################################################
