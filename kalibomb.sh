#!/bin/env bash

#Description

#Author ALi3nW4rX

#Install Programs
# Reset


#Color Diagram
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White


#Custom Colors
CSWhite='\033[3;97m  \e[0m' #Italic Bold White
WRN='\033[1;91m[\e[0m\033[1;97m!\e[0m\033[1;91m]\e[0m' # [!]
PLS='\033[1;91m[\e[0m\033[1;97m+\e[0m\033[1;91m]\e[0m' # [+]


check_for_root () {
    if [ "$EUID" -ne 0 ]
      then echo -e "\n\n Script must be run with sudo ./pimpmykali.sh or as root \n"
      exit
    else
      # 02.19.21 - Kali 2021.1 + MSF 6.0.30-DEV Released
      # Remove any prior hold on metasploit-framework at startup
      eval apt-mark unhold metasploit-framework >/dev/null 2>&1
    fi
    }

check_distro() {
    distro=$(uname -a | grep -i -c "kali") # distro check
    if [ $distro -ne 1 ]
     then echo -e "\n $blinkexclaim Kali Linux Not Detected - WSL/WSL2/Anything else is unsupported $blinkexclaim \n"; exit
    fi
  }

apt_update() {
    echo -e "\n  $PLS running: apt update \n"
    eval apt -y update
    }

apt_upgrade() {
    echo -e "\n  $PLS running: apt upgrade \n"
    eval apt -y upgrade
    }

apt_autoremove() {
    echo -e "\n  $PLS running: apt autoremove \n"
    eval apt -y autoremove
    }

apt_update_complete() {
    echo -e "\n  $PLS apt update - complete"
    }

apt_upgrade_complete() {
    echo -e "\n  $PLS apt upgrade - complete"
    }

apt_autoremove_complete() {
    echo -e "\n  $PLS apt autoremove - complete"
    }


#-----------------------------APP INSTALLATIONS START---------------------------------


# Install VSCode
install_vscode () {
    if [[ -f /usr/bin/code ]]; then
      echo -e "\n $WRN: $BIWhite VScode Already Installed. . . Skipping Install "
    else
    	echo -e "\n  [+] installing vscode"
      apt_update && apt_update_complete && apt -y install code-oss
      echo -e "\n  [+]  vscode - installed "
    fi
    }

# Install flameshot
install_flameshot () {
    if [[ -f /usr/bin/flameshot ]]; then
      echo -e "\n $WRN: $BIWhite Flameshot Already Installed. . . Skipping Install "
    else
    	echo -e "\n  [+] installing Flameshot"
      apt_update && apt_update_complete && apt -y install flameshot
      echo -e "\n  [+]  Flameshot - installed "
    fi
    }

# Install Terminator
install_Terminator () {
    if [[ -f /usr/bin/terminator ]]; then
      echo -e "\n $WRN: $BIWhite Terminator Already Installed. . . Skipping Install "
    else
    	echo -e "\n  [+] installing Terminator"
      apt_update && apt_update_complete && apt -y install terminator
      echo -e "\n  [+]  Terminator - installed "
    fi
    }

# Install Joplin
install_joplin () {
    if [[ -f /usr/bin/joplin ]]; then
      echo -e "\n $WRN: $BIWhite Joplin Already Installed. . . Skipping Install "
    else
    	echo -e "\n  [+] installing Joplin"
      eval wget https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh
      apt_update && apt_update_complete && apt -y install joplin
      echo -e "\n  [+]  Joplin - installed "
    fi
    }

# Install Steghide
install_steghide () {
    if [[ -f /usr/bin/steghide ]]; then
      echo -e "\n $WRN: $BIWhite Steghide Already Installed. . . Skipping Install "
    else
    	echo -e "\n  [+] installing Steghide"
      apt_update && apt_update_complete && apt -y install steghide
      echo -e "\n  [+]  Steghide - installed "
    fi
    }

#Install Sublime-Text
install_sublime () {
	if [[ -f /usr/bin/subl ]]; then
		echo -e "\n $WRN: $BIWhite Sublime-Text Already Installed. . . Skipping Install "
	else
	echo -e "\n  $greenplus installing sublime text editor"
    # code fix provided by aashiksamuel
    eval wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --no-default-keyring --keyring ./temp-keyring.gpg --import
    eval gpg --no-default-keyring --keyring ./temp-keyring.gpg --export --output sublime-text.gpg
    eval rm temp-keyring.gpg temp-keyring.gpg~
    eval mkdir -p /usr/local/share/keyrings
    eval mv ./sublime-text.gpg /usr/local/share/keyrings
    eval apt-get install apt-transport-https
    eval echo "deb [signed-by=/usr/local/share/keyrings/sublime-text.gpg] https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list
    apt_update && apt_update_complete
    eval apt -y install sublime-text
	fi
}

#Install Venom
install_venom () {
	if [[ -f /usr/bin/venom ]]; then
		echo -e "\n $WRN: $BIWhite Venom Already Installed. . . Skipping Install "
	else
	echo -e "\n  $greenplus installing venom"
	eval git clone https://github.com/r00t-3xp10it/venom.git
	eval cd venom
	eval find ./ -name "*.sh" -exec chmod +x {} \;
	eval find ./ -name "*.py" -exec chmod +x {} \;
	eval cd aux && sudo ./setup.sh
	eval ./venom.sh -u
	apt_update && apt_update_complete
	fi
}

install_all () {
	install_joplin
	install_Terminator
	install_flameshot
	install_vscode
	install_steghide
	install_venom
	echo -e "$banner"
	echo -e "\n YOU'VE BEEN KALI BOMBED!! ENJOY!!"
}

#-----------------------------APP INSTALLATIONS END---------------------------------




#---------------------------------------- Banners Start --------------------------------------------
#Notes on making the banner - copy & paste art to .txt then `cat art.txt | gzip | base64` 

helpbanner=$(base64 -d <<< "H4sIAAAAAAAAA7VSWw7DIAz75xT+WytN40JI7kFy+CUOj3Xt37RAKcbGdaSWAgJgLCpqDqDCTfEK
eeGKwVB9ZDnauGOisG5X67j0BefR4sI7rd2FIjgDO6LITE9pYhsEcdLJsoNUhreXR6vgAbOcecdG
bud8NTyIY20blg76oHSyEB253dlPNtrw/ug1cge3J9FHEPtJl6eepS66NLds7tDIpyfQHHdapKr5
rtl3PsaXiKnLFE1NRB+iy91f8Gv11v/jna2X8gaicgPS4wIAAA=="  | gunzip)

banner=$(base64 -d <<< "H4sIAAAAAAAAA6WQUQ7DMAhD/zmF/9ZK03IhJPcgHH4GknbS+jFphKYB8+oqZiAA5lbBylVU4Ca6
aYHA0OpQtXHHWSXr32xCE25WY6wuT0tVLLH9WTN5TIEFK/TxAR6I6Gw4lrM07YEHcVxHL2ehHtgY
C/74u3RObW9hrhTUMRfjGnHyKa/KBXv6j34PpDCf4Cs7dneXv8Z/sNkbC7OOY+wBAAA="  | gunzip)
#---------------------------------------- Banners End --------------------------------------------




#Help Menu
help_menu () {
	clear
	echo -e "\033[1;91m $helpbanner \e[0m"
	echo -e "*** THIS IS THE HELP MENU ***"
	echo -e "Please read carefully before"
	echo -e "continuing!"
	echo -e "*****************************"
	echo
	read -n1 -p "Please press R to return to main screen" return

	case $return in
		r|R)kali_bomb_menu
	esac
}

#Main Menu
kali_bomb_menu(){
	clear
	echo -e "\033[1;91m $banner \e[0m"

	echo -e "\n   Menu Options:                Description:"
	echo -e "   -------------                ------------"
	echo -e "1. KALI BOMB!                   INSTALLS EVERYTHING!"
	echo -e "2. Install VSCode               VScode IDE for coding"
	echo -e "3. Install Terminator           Terminal for productivity"
	echo -e "4. Install Flameshot            Screen Shot App"
	echo -e "5. Install Joplin               Structured Note App"
	echo -e "6. Install Sublime              Coding Program"
	echo -e "7. Install Steghide             Decode and Decrypt Photo's"

	echo
	read -n1 -p "Please select a menu option or type "X" to quit: " menuitems
	
	case $menuitems in
		1)install_all;;
		2)install_vscode;;
		3)install_Terminator;;
		4)install_flameshot;;
		5)install_joplin;;
		6)install_sublime;;
		7)install_steghide;;
		h|H)help_menu;;
		x|X) echo -e "\n Kali Bomb OUT!!!";;
		*)kali_bomb_menu;;
	esac
}

check_arg () {
	if [ "$1" == "" ]
		then kali_bomb_menu
	else
		case $1 in 
			--menu)kali_bomb_menu	;;
			--help)help_menu		;;
			-h)help_menu			;;
	
	esac
	fi
}




check_for_root
check_distro
check_arg "$1"













