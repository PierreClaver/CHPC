yum install nfs-utils
system nfs start
FSTAB="headnode.gekko.cluster.local:/home\t/home\tnfs\t_netdev,intr\t0 0"
echo -e $FSTAB >> /etc/fstab

mount -a

read -p "As in headnode make sure you have only run this scipt once. If not make sure the above line only occurs once. Press enter to aceept that you are KIFF"



