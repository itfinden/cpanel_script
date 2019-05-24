cd /usr/src
rm -fv /usr/src/cmc.tgz
wget http://download.configserver.com/cmc.tgz
tar -xzf cmc.tgz
cd cmc
sh install.sh
rm -Rfv /usr/src/cmc*

