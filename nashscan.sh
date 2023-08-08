#!/bin/bash

cyan='\033[1;32m'
green='\033[0;32m'
orange='\033[0;33m'
echo "----------------------------------------------------------------------"
echo -e " ${cyan}[+] NashScan ||  Created by Sadnan Sakin||"
echo "----------------------------------------------------------------------"
echo ""
echo ""

# Prompt the user to enter the target IP or hostname
read -p "Enter the target IP or hostname: " target

# Prompt the user to enter the scan type
echo "Select the scan type:"
echo "1. TCP Connect Scan with service version"
echo "2. SYN Scan"
echo "3. UDP Scan"
echo "4. Comprehensive Scan"
echo "5. Service and Version Detection"
echo "6. Firewall Bypass Scan"
echo "7. Aggressive Scan with Service and Version Detection"
echo "8. SMTP (Simple Mail Transfer Protocol) Enumeration"
echo "9. DNS(Domain Name Server) Enumeration"

read -p "Enter the scan type number: " scan_type

#echo -e "${green}"
echo -e "${orange}"

# Perform the selected scan based on the user's choice
case $scan_type in
    1)
        echo -e "${green} [+] using this command: nmap -sT -sV $target"
        echo -e "${orange}"
        
        nmap -sT -sV $target
        
        ;;
    2)
        echo -e "${green} [+] using this command: nmap -sS $target"
        echo -e "${orange}"
        
        nmap -sS $target
        ;;
    3)
        echo -e "${green} [+] using this command: sudo nmap -sU $target"
        echo -e "${orange}"
        
        sudo nmap -sU $target
        ;;
    4)
        echo -e "${green} [+] using this command:  nmap -sC -sV $target"
        echo -e "${orange}"
        
        nmap -sC -sV $target
        ;;
    5)
        echo -e "${green} [+] using this command:  nmap -sV $target"
        echo -e "${orange}"
        
        nmap -sV $target
        ;;
    6)
        echo -e "${green} [+] using this command:  nmap -sT -f $target"
        echo -e "${orange}"
        
        nmap -sT -f $target
        ;;
    7)
        echo -e "${green} [+] using this command:  nmap -sV -A $target"
        echo -e "${orange}"
        
        nmap -sV -A $target
        ;;
     8)
        echo -e "${green} [+] using this command:  nmap -p 25 --script=smtp-enum-users $target"
        echo -e "${orange}"
        
        nmap -p 25 --script=smtp-enum-users $target
        ;;
     9)
        echo -e "${green} [+] using this command:  nmap -p 53 -sV  $target"
        echo -e "${orange}"
        
        nmap -p 53 -sV  $target
        echo ""
        echo "Also using dig command"
        dig ns $target
        ;;
    *)
        echo "Invalid scan type selected."
        ;;
esac
