sudo chmod 755 /etc/named
sudo mkdir /etc/named/zones
cp ./db.gekko.cluster.local /etc/named/zones
cp ./db.10.0 /etc/named/zones
sudo named-checkconf
read -p "Did that work? Were you stupid?"
service named restart
systemctl enable named

read -p "Press ENTER to modify /etc/resolv.conf"
sudo chattr -i /etc/resolv.conf
sudo echo "search gekko.cluster.local" > /etc/resolv.conf
sudo echo "nameserver 127.0.0.1" >> /etc/resolv.conf
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sudo chattr +i /etc/resolv.conf

read -p "Press ENTER to setup headnode hostname file"
sudo echo "headnode.gekko.cluster.local" > /etc/hostname
