sudo yum install openssh-server
read -p "Press ENTER to generate new /etc/ ssh keys"
sudo ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa
sudo ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -t ecdsa
sudo ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -t ed25519
read -p "Press ENTER to restart ssh server"
service sshd restart
service sshd status -l
