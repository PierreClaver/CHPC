yum install -y nfs-utils
read -p "Press enter to acknowledge that this is the first time running this script, if not go to /etc/sysconfig/nfs and remove the last two lines (MOUNT... and RPC...)"
mkdir /var/nfsshare
chmod -R 777 /var/nfsshare/
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
service nfs start
Mount='MOUNTD_NFS_V3="yes"'
RPC='RPCNFSDARGS="-N 4"'

echo $Mount >> /etc/sysconfig/nfs
echo $RPC >> /etc/sysconfig/nfs

read -p "Press enter to acknowledge two error messages due to the clump of enable/start commands and that its okay...breath...you didn't break anything...only Frikkie's dreams" 
