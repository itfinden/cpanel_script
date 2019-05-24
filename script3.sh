##instalando firewall
#if [ -f '/etc/csf/csf.conf' ]; then
#       echo "Firewall ya se encuentra instalado"
##wget -q -O /etc/csf/csf.conf http://10.0.2.6/phinstall/dedicado/utilitario/csf.conf
##wget -q -O /etc/csf/csf.pignore http://10.0.2.6/phinstall/dedicado/utilitario/csf.pignore
#/usr/sbin/csf -r
#else
#cd /root
#wget https://download.configserver.com/csf.tgz
#tar -xzf csf.tgz
#cd csf
#sh install.sh
##wget -q -O /etc/csf/csf.conf http://10.0.2.6/phinstall/dedicado/utilitario/csf.conf
##wget -q -O /etc/csf/csf.pignore http://10.0.2.6/phinstall/dedicado/utilitario/csf.pignore
#rm -rf /root/csf.tgz
#echo  'Agregando a la lista blanca el rango del datacenter.....'
#/usr/sbin/csf -a 10.0.2.3
#/usr/sbin/csf -a 201.217.242.182
#/usr/sbin/csf -a 200.73.112.4
#/usr/sbin/csf -a 201.217.242.180
#/usr/sbin/csf -a 200.73.112.7
#/usr/sbin/csf -a 201.217.241.184
#/usr/sbin/csf -a 200.73.112.3
#/usr/sbin/csf -x
#fi

####################################################################

#Instalando cmq
if [ -d '/usr/local/cpanel/whostmgr/docroot/cgi/configserver/cmq' ]; then
       echo "Herramienta CMQ  ya se encuentra instalado"
else
cd /root
wget https://download.configserver.com/cmq.tgz
tar -xzf cmq.tgz
cd cmq
sh install.sh
rm -rf /root/cmq.tgz
fi

#Instalando cmc
if [ -d '/usr/local/cpanel/whostmgr/docroot/cgi/configserver/cmc' ]; then
       echo "Herramienta CMC  ya se encuentra instalado"
else
cd /root
wget https://download.configserver.com/cmc.tgz
tar -xzf cmc.tgz
cd cmc
sh install.sh
rm -rf /root/cmc.tgz
fi

#Instalando cmm
if [ -d '/usr/local/cpanel/whostmgr/docroot/cgi/configserver/cmm' ]; then
       echo "Herramienta CMM  ya se encuentra instalado"
else
cd /root
wget https://download.configserver.com/cmm.tgz
tar -xzf cmm.tgz
cd cmm
sh install.sh
rm -rf /root/cmm.tgz
fi
