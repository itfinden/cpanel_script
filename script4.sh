echo "Aplicando SSH en runlevel 3"
mv /etc/rc3.d/S55sshd /etc/rc3.d/S40sshd

#################################################

##desahabilitando servicios
cd /root
for service in \
   avahi-daemon \
   avahi-dnsconfd \
   bluetooth \
   capi \
   conman \
   cpus \
   irda \
   lisa \
   netplugd \
   ifplugd \
   NetworkManager \
   NetworkManagerDispatcher \
   netfs \
   netplugd \
   ncsd \
   oddjobd \
   openvpn \
   pcmcia \
   pcscd \
   portsentry \
   postfix \
   rawdevices \
   rdisc \
   rpcgssd \
   rpcidmapd \
   saslauthd \
   tcsd \
   vsftpd \
   winbind \
   wpa_supplicant \
   xfs \
   ypbind ;
   do
echo "Disabling service: ${service}"
/sbin/chkconfig ${service} off &>/dev/null
/sbin/service ${service} stop &>/dev/null
done
#########################################################

/scripts/restartsrv_chkservd

#Hardering MySQL
/bin/cat /dev/null > /etc/my.cnf
echo "
#Reglas de MySQL
[mysqld]
max_connections = 500
query_cache_type =1
query_cache_limit = 2M
query_cache_size = 64M
join_buffer_size = 1M
tmp_table_size = 128M
max_heap_table_size = 128M
table_open_cache = 400
#key_buffer = 2048M
key_buffer_size = 2048M
innodb_buffer_pool_size = 2048M
#Best Practices Reference
open_files_limit=10000
max_allowed_packet=268435456
myisam_sort_buffer_size = 128M
read_buffer_size = 1M
sort_buffer_size = 2M
">>/etc/my.cnf
/sbin/service mysql restart
systemctl restart mysql.service

#Hardering Kernel
/sbin/sysctl -w "net.ipv4.tcp_syncookies=1"
/sbin/sysctl -w "kernel.exec-shield=1"
/sbin/sysctl -w "kernel.randomize_va_space=1"
/sbin/sysctl -w "kernel.randomize_va_space=1"
/sbin/sysctl -w "net.ipv4.conf.all.rp_filter=1"
/sbin/sysctl -w "net.ipv4.conf.lo.rp_filter=1"
/sbin/sysctl -w "net.ipv4.conf.eth0.rp_filter=1"
/sbin/sysctl -w "net.ipv4.conf.default.rp_filter=1"
/sbin/sysctl -w "net.ipv4.icmp_echo_ignore_broadcasts=1"
/sbin/sysctl -w "net.ipv4.conf.all.accept_redirects=0"
/sbin/sysctl -w "net.ipv4.conf.all.send_redirects=0"
/sbin/sysctl -w "net.ipv4.tcp_sack=0"
/sbin/sysctl -w "net.ipv4.ip_forward=0"
/sbin/sysctl -w "net.ipv4.conf.all.accept_source_route=0"
/sbin/sysctl -w "net.ipv4.conf.lo.accept_source_route=0"
/sbin/sysctl -w "net.ipv4.conf.eth0.accept_source_route=0"
/sbin/sysctl -w "net.ipv4.conf.default.accept_source_route=0"
/sbin/sysctl -w "net.ipv4.tcp_fin_timeout=15"
/sbin/sysctl -w "net.ipv4.tcp_keepalive_time=7200"
/sbin/sysctl -p
#################################################################


#Instalando SNMP

if [ -a '/usr/sbin/snmpd' ]; then
        echo; echo; echo "SNMP ya se encuentra instalado"
mv -f /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.bak2
echo "rocommunity 201.217.241.184
rocommunity 200.73.112.3
syslocation  "Chile"
syscontact  soporte@itfinden.com
">>/etc/snmp/snmpd.conf
service snmpd restart
/etc/init.d/snmpd start
/usr/sbin/csf -a 201.217.241.184
/usr/sbin/csf -a 200.73.112.3
echo "SNMP instalado funciona?"
chkconfig snmpd on
else
echo; echo -n 'Descargando archivos desde mirror powerhost...'

yum -y install net-snmp net-snmp-utils
chkconfig snmpd on
mv -f /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.bak
echo "rocommunity  P0w3rH0sT 201.217.241.184
rocommunity  200.73.112.3
syslocation  "Chile"
syscontact  soporte@itfinden.com
">>/etc/snmp/snmpd.conf
service snmpd restart
/etc/init.d/snmpd start
/usr/sbin/csf -a 201.217.241.184
/usr/sbin/csf -a 200.73.112.3
echo "SNMP instalado"
fi







