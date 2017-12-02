#!/bin/bash
USERSSH=~/.ssh

read -p "Enter ssh server (user@server): " SSH_SERVER
echo $SSH_SERVER

read -p  "Do you want to overwrite/make a new ssh key? [y/n] " -r
echo
#we may want to not create a new key, but rather transfer 
#an old one. (must exist in the first place)

if [[ $REPLY =~ ^[Yy]$ ]]
then
	#[[ "$0" = "$BASH_SOURCE"]] && exit 1 || return 1

	echo "Checking for existing SSH keys..."

	USERKEYBACKUP=$USERSSH/key_backup
	#SSH_SERVER=headnode

	if [ -f $USERSSH/id_rsa ];
	then
		echo ..RSA SSH Key Exists, making a backup.

		if [ ! -e $USERKEYBACKUP ];
		then
			mkdir $USERKEYBACKUP
		fi

		cp $USERSSH/id_rsa* $USERKEYBACKUP
		echo "..Making SSH Key."
	else
		echo "..RSA SSH Key does not exist, making one."
	fi

	ssh-keygen -t rsa
fi

if [ -f $USERSSH/id_rsa ];
then
	echo "..RSA SSH key exists."
	ssh-add
else
	echo "..RSA SSH key does not exist, please make one."
fi

echo "Connecting to server $SSH_SERVER..."

cat $USERSSH/id_rsa.pub | ssh $SSH_SERVER 'cat >> .ssh/authorized_keys'
