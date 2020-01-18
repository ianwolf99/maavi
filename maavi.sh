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
 echo -e "$red [$green+$red]  2:$off Load Suite  ";
 echo -e "$red [$green+$red]  3:$off Load Suite behind Tor ";
 echo -e "$red [$green+$red]  4:$off Load Suite using OWASP Top 10 All in 1 Injection ";
 echo -e "$red [$green+$red]  5:$off Load Suite using OWASP Top 10 All in 1 Injection behind Tor ";
 echo "";
 echo -ne "$red [$green+$red] Select An Option   : $off " ;
 read Option
     if [ $Option -eq "1" ]
 then
 echo -ne "$red[$green+$red] Enter Absolute Url : $off ";
 read victim
 wafw00f $victim
     fi

     if [ $Option -eq "2" ]
 then
 ruby maavi.rb
 echo -ne "$red[$green+$red] Enter Absolute Url : $off ";
 read victim
 ruby maavi.rb fuzzpayloads $victim"fuzz"
    fi

     if [ $Option -eq "3" ]
 then
 ruby maaviproxy.rb
 echo -ne "$red[$green+$red] Enter Absolute Url : $off ";
 read victim
 sudo killall tor
 xterm -e tor &
 sleep 10
 ruby maaviproxy.rb fuzzpayloads $victim"fuzz"
    fi

     if [ $Option -eq "4" ]
 then
 ruby maavi.rb
 echo -ne "$red[$green+$red] Enter Absolute Url : $off ";
 read victim
 proxychains ruby maavi.rb owasptop10allin1injections $victim"fuzz"
    fi

     if [ $Option -eq "5" ]
 then
 ruby maaviproxy.rb
 echo -ne "$red[$green+$red] Enter Absolute Url : $off ";
 read victim
 sudo killall tor
 xterm -e tor &
 sleep 10
 proxychains ruby maaviproxy.rb owasptop10allin1injections $victim"fuzz" &
    fi
