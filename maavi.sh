#!/bin/bash

red="\e[0;31m"
new="\e[0;36m"
green="\e[0;32m"
off="\e[0m"

clear
function banner() {
echo "      
Loader  : Cross Platform Fuzzing and Vulnerability Assessment Suite
Version : 1.9a
Coder   : Haroon Awan [mrharoonawan@gmail.com]
Web     : fb.com/officialharoonawan
Scanner : fuzzpayload for All types
Payload : XSS, Csrf, Ssrf, SSI, OWASP top 10, PHP Injections, 
          Bufferoverflows, Redirects, Open Redirects  
"
}
banner
 echo "";
 echo -e "$red [$green+$red]  1:$off Waf Firewall Identification "; 
 echo -e "$red [$green+$red]  2:$off Load Suite ";
 echo -e "$red [$green+$red]  3:$off Load Suite behind Tor ";
 echo "";
 echo -ne "$red [$green+$red] Select An Option   : $off " ;
 read Option
     if [ $Option -eq "1" ]
 then
 echo -ne "$red [$green+$red] Enter Absolute Url : $off ";
 read victim
 wafw00f $victim
     fi

     if [ $Option -eq "2" ]
 then
 echo -ne "$red [$green+$red] Enter Absolute Url : $off ";
 read victim
 ruby maavi.rb fuzzpayloads $victim"phpfuzz"
    fi

     if [ $Option -eq "3" ]
 then
 echo -ne "$red [$green+$red] Enter Absolute Url : $off ";
 read victim
 xterm -e tor
 sleep 10
 ruby maavi.rb fuzzpayloads $victim"fuzz"
    fi
