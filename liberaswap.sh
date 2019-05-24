#!/bin/bash
echo "Comprobando como esta la memoria antes de hacer nada" 
free -m

echo “Vaciando la memoria cache y swap“;

echo "Primero deshabilitamos la Swap"
swapoff -a

echo "Liberando de la cache las pagecache, dentries e inodes"
#sync;sysctl -w vm.drop_caches=3;sync
sync ; echo 3 > /proc/sys/vm/drop_caches

echo "Por ultimo habilitamos la Swap"
swapon -a

echo "Comprobando la memoria despues de hacer los deberes XD"
free -m
