#!/bin/bash

# Title: Snatch
# Version: 1.0
# Contact: hwac121@protonmail.com

# URL: http://www.majikcat.com
# GitHub: 

#-----------------------------------------------------------------

# Description:
# Snatch is used to find, choose, and snatch a handshake from a network
# AP and it's connecting client. Do not use on a network without
# explicit permission as this would be illegal. This software was
# designed strictly for pentesting and educational purposes only.
# The author is not responsible for any abuse of this program by the
end-user.

#=================================================================
#                         CHECK FOR ROOT
#=================================================================

if [ "$EUID" -ne 0 ]
  then echo "Please run as root or sudo ./install.sh"
  exit
fi

clear
echo -e "  _____ ____    ____  ______   __  __ __ "
echo -e " / ___/|    \  /    ||      | /  ]|  |  |"
echo -e "(   \_ |  _  ||  o  ||      |/  / |  |  |"
echo -e " \__  ||  |  ||     ||_|  |_/  /  |  _  |"
echo -e " /  \ ||  |  ||  _  |  |  |/   \_ |  |  |"
echo -e " \    ||  |  ||  |  |  |  |\     ||  |  |"
echo -e "  \___||__|__||__|__|  |__| \____||__|__|"
echo -e " "
echo -e "========================================================="

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

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' mdk3 | grep "install ok installed")
echo Checking for mdk3: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "mdk3 not installed. Attempting to install mdk3 now..."
  sleep 0.15
  apt-get install mdk3
fi

#=================================================================
#            INSTALLING MAIN PROGRAM AND MAKING GLOBAL
#=================================================================

cp snatch.sh /bin/snatch
chmod +x /bin/snatch
chmod +x snatch.sh

#=================================================================
#                    SOMETHING GOES HERE...
#=================================================================

echo -e "Be sure to checkout TX Power Blast v2.0 to boost your wifi antenna before using this."
echo -e "It can really improve the performance."
sleep 4
clear
echo -e "Installation complete!"
sleep 2
clear
