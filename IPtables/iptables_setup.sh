read -p "Press ENTER to flush iptables"
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --append POSTROUTING --out-interface ens3 -j MASQUERADE
iptables --append FORWARD --in-interface ens4 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

service iptables save

service iptables restart
