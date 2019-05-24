csf -a 201.217.241.180
csf -a 10.0.2.3
echo ""
#Host=`hostname`
###############Escanear archivos infectados###############################

if [ -a '/usr/sbin/snmpd' ]; then
        echo; echo; echo "SNMP ya se encuentra instalado"
mv -f /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.bak2
echo "rocommunity 201.217.241.184
rocommunity  200.73.117.4
syslocation  "Chile"
syscontact  soporte@itfinden.com
">>/etc/snmp/snmpd.conf
service snmpd restart
/etc/init.d/snmpd start
/usr/sbin/csf -a 201.217.241.184
/usr/sbin/csf -a 200.73.117.4
echo "SNMP instalado funciona?"
chkconfig snmpd on
else
echo; echo -n 'Descargando archivos'
yum -y install net-snmp net-snmp-utils
chkconfig snmpd on
mv -f /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.bak
echo "rocommunity 201.217.241.184
rocommunity 200.73.117.4
syslocation  "Chile"
syscontact  noc@powerhost.cl
">>/etc/snmp/snmpd.conf
service snmpd restart

/etc/init.d/snmpd start
/usr/sbin/csf -a 201.217.241.184
/usr/sbin/csf -a 200.73.117.4
echo "SNMP instalado"
fi
