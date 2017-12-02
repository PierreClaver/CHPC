sudo chattr -i /etc/resolv.conf
sudo echo "search gekko.cluster.local" > /etc/resolv.conf
sudo echo "nameserver 10.0.0.1" >> /etc/resolv.conf
sudo chattr +i /etc/resolv.conf

echo "node1 or node2"
read -p "Give node name > " NODE_NAME
DOMAIN_NAME=".gekko.cluster.local"
sudo echo $NODE_NAME$DOMAIN_NAME > /etc/hostname
