cd /usr/src
rm -fv /usr/src/cmq.tgz
wget http://download.configserver.com/cmq.tgz
tar -xzf cmq.tgz
cd cmq
sh install.sh
rm -Rfv /usr/src/cmq*
