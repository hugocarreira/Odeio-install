#!/bin/bash

# Instalação Padrão
echo -e "\e[00;31mCurl é necessario, será instalado.\e[00m"
sudo apt-get install curl

echo -e "\e[00;31mGit é necessario, será instalado.\e[00m"
sudo apt-get install git

# Chrome Browser
echo -e "\e[00;31mDeseja instalar Chromium Browser? [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
    sudo apt-get install chromium-browser
fi

# Spotify
echo -e "\e[00;31mDeseja instalar Spotify? [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client
fi
# Sublime Text 3
echo -e "\e[00;31mDeseja instalar Sublime Text 3? [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
  	sudo apt-get update
  	sudo apt-get install sublime-text-installer
  	echo -e "\e[01;33mPackages para serem instalados Sublime (./packages-sublime.txt)\e[1;33m"
  	echo -e "Color Scheme
	  	Additional PHP Snippets
	  	All Autocomplete
	  	BracketHighlighter
	  	Codeigniter Snippets
	  	Coler BracketHighlighter
	  	EditorConfig
	  	GitGutter
	  	Grunt
	  	Grunt Snippets
	  	MarkdownEditing
	  	Material Tehem
	  	Node Complementions
	  	Nodejs
	  	PHP-Twig
	  	PhpDoc
	  	SideBarEnhancements
	  	SublimeCodeIntel
	  	SublimeLinter
	  	SublimeLinter-json
	  	Sublimelinter-php
	  	TrailingSpaces
	  	VCS Gutter" >> packages-sublime.txt
fi


# Terminator
echo -e "\e[00;31mDeseja instalar Terminator? [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	sudo add-apt-repository ppa:gnome-terminator
	sudo apt-get update
	sudo apt-get install terminator
fi

# Zsh with theme
echo -e "\e[00;31mDeseja instalar oh-my-zsh com Honukai Theme? [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	sudo apt-get update
	sudo apt-get install zsh
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	cd ~/Downloads
	git clone https://github.com/hugocarreira/oh-my-zsh-theme.git zsh-theme
	cd zsh-theme
	cp -i honukai.zsh-theme ~/.oh-my-zsh/themes/
	cp -i .zshrc ~/
	source ~/.zshrc
fi

# Vagrant without Box
echo -e "\e[00;31mDeseja instalar Vagrant? [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	sudo apt-get update
	sudo apt-get install virtualbox
	sudo apt-get install virtualbox-dkms
	cd ~/Downloads
	wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
	sudo dpkg -i vagrant_1.8.1_x86_64.deb
	sudo apt-get install -f
fi

# Htop
echo -e "\e[00;31mDeseja instalar Htop [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	sudo apt-get update
	sudo apt-get install htop
fi

# NodeJS
echo -e "\e[00;31mDeseja instalar NodeJS 6x [y/n]\e[00m"
read answer
if [[ $answer =~ "y" ]]; then
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install nodejs
	sudo apt-get update
	sudo apt-get install build-essential
fi

# Auto remove padrão.
echo -e "\e[00;31mAutoremove será executado para limpar arquivos desnecessários.\e[00m"
sudo apt-get autoremove

echo -e "\e[00;31mScript desenvolvido por github.com/hugocarreira - MIT LICENSE\e[00m"
