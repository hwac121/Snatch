#!/bin/bash

# Title: Snatch wifi pentesting
# Version: 1.0
# Contact: hwac121@protonmail.com

# URL: http://www.majikcat.com
# GitHub: https://github.com/hwac121/Snatch.git

#-----------------------------------------------------------------

# Description:
# Snatch is used to find, choose, and snatch a handshake from a network
# AP and it's connecting client. Do not use on a network without
# explicit permission as this would be illegal. This software was
# designed strictly for pentesting and educational purposes only.
# The author is not responsible for any abuse of this program by the
# end-user.

#=================================================================
#                         CHECK FOR ROOT
#=================================================================

if [ "$EUID" -ne 0 ]
  then echo "\e[31mPlease run as root or sudo ./install.sh\e[0m"
  exit
fi

clear
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
	echo -e "==============================================================="

#=================================================================
#                     CHECK FOR REQUIREMENTS
#=================================================================

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' aircrack-ng | grep "install ok installed")
echo Checking for aircrack-ng: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "aircrack-ng not installed. Attempting to install aircrack-ng now..."
  sleep 0.15
  apt-get install aircrack-ng
fi

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' mdk4 | grep "install ok installed")
echo Checking for mdk4: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "mdk4 not installed. Attempting to install mdk4 now..."
  sleep 0.15
  apt-get install mdk4
fi

#=================================================================
#            INSTALLING MAIN PROGRAM AND MAKING GLOBAL
#=================================================================

echo -e " "
echo -e "Making Snatch available globally..."
cp snatch.sh /bin/snatch
sleep 0.15
echo -e " "
echo -e "Copying files to correct positions..."
chmod +x /bin/snatch
sleep 0.15
echo -e " "
echo -e "Setting proper permissions..."
chmod +x snatch.sh
sleep 0.15

#=================================================================
#                    INSTALLATION COMPLETION
#=================================================================

echo -e "Be sure to checkout the stand-alone software [TX Power Blast v2.0] to boost your wifi antenna."
echo -e "Available on GitHub at: https://github.com/hwac121"
sleep 4
clear
echo -e "Installation complete!"
sleep 2
clear
./snatch.sh
