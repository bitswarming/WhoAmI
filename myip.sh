#!/bin/bash -u 
set +e
function whoami {
 declare -a ipproviders=(
 "dig +short myip.opendns.com @resolver1.opendns.com"
 "dig +short myip.opendns.com @resolver2.opendns.com"
 "dig +short myip.opendns.com @resolver3.opendns.com"
 "dig +short myip.opendns.com @resolver4.opendns.com"
 "dig +short whoami.akamai.net @ns1-1.akamaitech.net"
 "dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"
 "curl -s whatismyip.akamai.com"
 "curl -s checkip.amazonaws.com"
 "curl -s myip.dnsomatic.com"
 "curl -s icanhazip.com"
 )
 for url in "${ipproviders[@]}"; do 
   myip=$($url | sed 's/"//g')
   if [ $? != 0  ]; then 
     echo ""
   else 
     if [[ $myip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
       echo $myip
       break
     else 
        echo "fail"
     fi
   fi
 done
}
trap whoami EXIT
