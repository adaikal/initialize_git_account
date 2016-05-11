#!/bin/bash
set -e
install_git() {

	local USERNAME="$1"
	local USERMAIL="$2"

	if ! type git &> /dev/null;then
		echo "not installed"
		echo "installing git..."
		
		apt install -y git

		config_git "$USERNAME" "$USERMAIL"
	
	else
		echo "git is already installed"
		
		config_git "$USERNAME" "$USERMAIL"
	fi
}

config_git() {

	local USERNAME="$1"
	local USERMAIL="$2"

	git config --global user.name "$USERNAME"
        git config --global user.email "$USERMAIL"

#	echo "configured git user details"

}

install_git "$1" "$2"

