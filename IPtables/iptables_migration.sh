read -p "Press ENTER to transfer from firewalld to iptables"

systemctl stop firewalld
systemctl mask firewalld
yum -y install iptables-services
systemctl enable iptables

systemctl start iptables

