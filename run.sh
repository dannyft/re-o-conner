#!/bin/bash

url=$1
BASEDIR=$(dirname $0)

if [ ! -d "$url" ]; then
    mkdir $url
fi

if [ ! -d "$url/recon" ]; then
    mkdir $url/recon
fi

if [ ! -d "$url/scan" ]; then
    mkdir $url/scan
fi

#
# Assetfinder
#
echo "[+] Harvesting subdomains with assetfinder"
docker run -i --rm assetfinder $url > $url/recon/tmp_assetfinder.txt
grep $url $url/recon/tmp_assetfinder.txt > $url/recon/assetfinder.txt
rm $url/recon/tmp_assetfinder.txt

#
# Amass
#
echo "[+] Harvesting subdomains with amass"
docker run -i --rm caffix/amass enum -d $url > $url/recon/amass.txt

#
# One for all
#
echo "[+] Harvesting subdomains with OneForAll"
mkdir $url/recon/oneforall
docker run -i --rm -v $(pwd)/$url/recon/oneforall:/opt/oneforall/results oneforall --target $url run

#
# Concat subdomains
#
cat $url/recon/assetfinder.txt $url/recon/amass.txt $url/recon/oneforall/all_subdomain_result_*.txt | sort | uniq > $url/recon/subdomains.txt

#
# Find live subdomains
#
echo "[+] Probing for alive domains"
cat $url/recon/subdomains.txt | docker run -i --rm httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ':443' | sort | uniq > $url/recon/alive.txt

#
# Run scan URL script
#
if [ -n "$URLSCAN_API_KEY" ]; then

    cat $url/recon/alive.txt | while read line
    do
        python3 $BASEDIR/urlscan/urlscan.py $line $url/scan >> $url/scan/results.txt
    done

fi