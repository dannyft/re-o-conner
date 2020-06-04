#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends docker.io python3-requests

systemctl start docker
systemctl enable docker

docker pull caffix/amass
docker build docker/assetfinder/ -t assetfinder:latest
docker build docker/httprobe/ -t httprobe:latest
docker build docker/oneforall/ -t oneforall:latest

echo ""
echo "+=============================================================================+"
echo "|                                   Api keys                                  |"
echo "|             Enter API keys. If you don't have one just press enter          |"
echo "+-----------------------------------------------------------------------------+"
echo "| Censys         - https://censys.io/api                                      |"
echo "| Chinaz         - http://api.chinaz.com/ApiDetails/Alexa                     |"
echo "| Bing           - https://azure.microsoft.com/zh-cn/services/                |"
echo "| SecurityTrails - https://securitytrails.com/corp/api                        |"
echo "| Fofa           - https://fofa.so/api                                        |"
echo "| Google         - https://developers.google.com/custom-search/v1/overview    |"
echo "| RiskIQ         - https://api.passivetotal.org/api/docs/                     |"
echo "| Shodan         - https://account.shodan.io/register                         |"
echo "| ThreatBook     - https://x.threatbook.cn/nodev4/vb4/myAPI                   |"
echo "| VirusTotal     - https://developers.virustotal.com/reference                |"
echo "| ZoomEye        - https://www.zoomeye.org/doc?channel=api                    |"
echo "| Spyse          - https://spyse.com/                                         |"
echo "| Circl          - https://www.circl.lu/services/passive-dns/                 |"
echo "| DnsDb          - https://www.dnsdb.info/                                    |"
echo "| Ipv4Info       - http://ipv4info.com/tools/api/                             |"
echo "| PassiveDNS     - http://api.passivedns.cn                                   |"
echo "| Github         - https://github.com/settings/tokens                         |"
echo "| Cloudflare     - https://dash.cloudflare.com/profile/api-tokens             |"
echo "| Urlscan.io     - https://urlscan.io/about-api/                              |"
echo "| Facebook       - https://developers.facebook.com/                           |"
echo "+=============================================================================+"
echo ""

source ~/.profile

#
# Urlscan.io
#
if [ -z ${URLSCAN_API_KEY+x} ]; then
    read -p "Urlscan.io API key: " URLSCAN_API_KEY
    if [ -n "$URLSCAN_API_KEY" ]; then
        echo "export URLSCAN_API_KEY=$URLSCAN_API_KEY" >> ~/.profile
    fi
fi

#
# Facebook
#
if [ -z ${FB_APP_ID+x} ]; then
    read -p "Facebook App id: " FB_APP_ID
    if [ -n "$FB_APP_ID" ]; then
        echo "export FB_APP_ID='$FB_APP_ID'" >> ~/.profile
    fi
fi

if [ -z ${FB_APP_SECRET+x} ]; then
    read -p "Facebook App secret: " FB_APP_SECRET
    if [ -n "$FB_APP_SECRET" ]; then
        echo "export FB_APP_SECRET='$FB_APP_SECRET'" >> ~/.profile
    fi
fi

#
# Virustotal
#
if [ -z ${VT_API_KEY+x} ]; then
    read -p "Virustotal API key: " VT_API_KEY
    if [ -n "$VT_API_KEY" ]; then
        echo "export VT_API_KEY='$VT_API_KEY'" >> ~/.profile
    fi
fi

#
# Spyse
#
if [ -z ${SPYSE_API_TOKEN+x} ]; then
    read -p "Spyse API key: " SPYSE_API_TOKEN
    if [ -n "$SPYSE_API_TOKEN" ]; then
        echo "export SPYSE_API_TOKEN='$SPYSE_API_TOKEN'" >> ~/.profile
    fi
fi

#
# Censys
#
if [ -z ${CENSYS_API_ID+x} ]; then
    read -p "Censys API id: " CENSYS_API_ID
    if [ -n "$CENSYS_API_ID" ]; then
        echo "export CENSYS_API_ID='$CENSYS_API_ID'" >> ~/.profile
    fi
fi

if [ -z ${CENSYS_API_SECRET+x} ]; then
    read -p "Censys API secret: " CENSYS_API_SECRET
    if [ -n "$CENSYS_API_SECRET" ]; then
        echo "export CENSYS_API_SECRET='$CENSYS_API_SECRET'" >> ~/.profile
    fi
fi

#
# binaryedge
#
if [ -z ${BINARYEDGE_API+x} ]; then
    read -p "Binaryedge API key: " BINARYEDGE_API
    if [ -n "$BINARYEDGE_API" ]; then
        echo "export BINARYEDGE_API='$BINARYEDGE_API'" >> ~/.profile
    fi
fi

#
# Chinaz
#
if [ -z ${CHINAZ_API+x} ]; then
    read -p "Chinaz API key: " CHINAZ_API
    if [ -n "$CHINAZ_API" ]; then
        echo "export CHINAZ_API='$CHINAZ_API'" >> ~/.profile
    fi
fi

#
# Bing
#
if [ -z ${BING_API_ID+x} ]; then
    read -p "Bing API id: " BING_API_ID
    if [ -n "$BING_API_ID" ]; then
        echo "export BING_API_ID='$BING_API_ID'" >> ~/.profile
    fi
fi

if [ -z ${BING_API_KEY+x} ]; then
    read -p "Bing API key: " BING_API_KEY
    if [ -n "$BING_API_KEY" ]; then
        echo "export BING_API_KEY='$BING_API_KEY'" >> ~/.profile
    fi
fi

#
# SecurityTrails
#
if [ -z ${SECURITYTRAILS_API+x} ]; then
    read -p "SecurityTrails API key: " SECURITYTRAILS_API
    if [ -n "$SECURITYTRAILS_API" ]; then
        echo "export SECURITYTRAILS_API='$SECURITYTRAILS_API'" >> ~/.profile
    fi
fi

#
# fofa
#
if [ -z ${FOFA_API_EMAIL+x} ]; then
    read -p "Fofa Email: " FOFA_API_EMAIL
    if [ -n "$FOFA_API_EMAIL" ]; then
        echo "export FOFA_API_EMAIL='$FOFA_API_EMAIL'" >> ~/.profile
    fi
fi

if [ -z ${FOFA_API_KEY+x} ]; then
    read -p "Fofa API key: " FOFA_API_KEY
    if [ -n "$FOFA_API_KEY" ]; then
        echo "export FOFA_API_KEY='$FOFA_API_KEY'" >> ~/.profile
    fi
fi

#
# Google
#
if [ -z ${GOOGLE_API_KEY+x} ]; then
    read -p "Google API key: " GOOGLE_API_KEY
    if [ -n "$GOOGLE_API_KEY" ]; then
        echo "export GOOGLE_API_KEY='$GOOGLE_API_KEY'" >> ~/.profile
    fi
fi

if [ -z ${GOOGLE_API_CX+x} ]; then
    read -p "Google API cx: " GOOGLE_API_CX
    if [ -n "$GOOGLE_API_CX" ]; then
        echo "export GOOGLE_API_KEY='$GOOGLE_API_CX'" >> ~/.profile
    fi
fi

#
# RiskIQ
#
if [ -z ${RISKIQ_API_USERNAME+x} ]; then
    read -p "RiskIQ username: " RISKIQ_API_USERNAME
    if [ -n "$RISKIQ_API_USERNAME" ]; then
        echo "export RISKIQ_API_USERNAME='$RISKIQ_API_USERNAME'" >> ~/.profile
    fi
fi

if [ -z ${RISKIQ_API_KEY+x} ]; then
    read -p "RiskIQ api key: " RISKIQ_API_KEY
    if [ -n "$RISKIQ_API_KEY" ]; then
        echo "export RISKIQ_API_KEY='$RISKIQ_API_KEY'" >> ~/.profile
    fi
fi

#
# Shodan
#
if [ -z ${SHODAN_API_KEY+x} ]; then
    read -p "Shodan api key: " SHODAN_API_KEY
    if [ -n "$SHODAN_API_KEY" ]; then
        echo "export SHODAN_API_KEY='$SHODAN_API_KEY'" >> ~/.profile
    fi
fi

#
# ThreatBook
#
if [ -z ${THREATBOOK_API_KEY+x} ]; then
    read -p "ThreatBook api key: " THREATBOOK_API_KEY
    if [ -n "$THREATBOOK_API_KEY" ]; then
        echo "export THREATBOOK_API_KEY='$THREATBOOK_API_KEY'" >> ~/.profile
    fi
fi

#
# ZoomEye
#
if [ -z ${ZOOMEYE_API_USERMAIL+x} ]; then
    read -p "ZoomEye e-mail: " ZOOMEYE_API_USERMAIL
    if [ -n "$ZOOMEYE_API_USERMAIL" ]; then
        echo "export ZOOMEYE_API_USERMAIL='$ZOOMEYE_API_USERMAIL'" >> ~/.profile
    fi
fi

if [ -z ${ZOOMEYE_API_PASSWORD+x} ]; then
    read -p "ZoomEye user password: " ZOOMEYE_API_PASSWORD
    if [ -n "$ZOOMEYE_API_PASSWORD" ]; then
        echo "export ZOOMEYE_API_PASSWORD='$ZOOMEYE_API_PASSWORD'" >> ~/.profile
    fi
fi

#
# Circl
#
if [ -z ${CIRCL_API_USERNAME+x} ]; then
    read -p "Circl username: " CIRCL_API_USERNAME
    if [ -n "$CIRCL_API_USERNAME" ]; then
        echo "export CIRCL_API_USERNAME='$CIRCL_API_USERNAME'" >> ~/.profile
    fi
fi

if [ -z ${CIRCL_API_PASSWORD+x} ]; then
    read -p "Circl password: " CIRCL_API_PASSWORD
    if [ -n "$CIRCL_API_PASSWORD" ]; then
        echo "export CIRCL_API_PASSWORD='$CIRCL_API_PASSWORD'" >> ~/.profile
    fi
fi

#
# DnsDb
#
if [ -z ${DNSDB_API_KEY+x} ]; then
    read -p "DNS DB API key: " DNSDB_API_KEY
    if [ -n "$DNSDB_API_KEY" ]; then
        echo "export DNSDB_API_KEY='$DNSDB_API_KEY'" >> ~/.profile
    fi
fi

#
# Ipv4Info
#
if [ -z ${IPV4INFO_API_KEY+x} ]; then
    read -p "Ipv4Info API key: " IPV4INFO_API_KEY
    if [ -n "$IPV4INFO_API_KEY" ]; then
        echo "export IPV4INFO_API_KEY='$IPV4INFO_API_KEY'" >> ~/.profile
    fi
fi

#
# PassiveDNS
#
if [ -z ${PASSIVEDNS_API_ADDR+x} ]; then
    read -p "PassiveDNS API addr: " PASSIVEDNS_API_ADDR
    if [ -n "$PASSIVEDNS_API_ADDR" ]; then
        echo "export PASSIVEDNS_API_ADDR='$PASSIVEDNS_API_ADDR'" >> ~/.profile
    fi
fi

if [ -z ${PASSIVEDNS_API_TOKEN+x} ]; then
    read -p "PassiveDNS API token: " PASSIVEDNS_API_TOKEN
    if [ -n "$PASSIVEDNS_API_TOKEN" ]; then
        echo "export PASSIVEDNS_API_TOKEN='$PASSIVEDNS_API_TOKEN'" >> ~/.profile
    fi
fi

#
# Github
#
if [ -z ${GITHUB_API_USER+x} ]; then
    read -p "Github API user: " GITHUB_API_USER
    if [ -n "$GITHUB_API_USER" ]; then
        echo "export GITHUB_API_USER='$GITHUB_API_USER'" >> ~/.profile
    fi
fi

if [ -z ${GITHUB_API_TOKEN+x} ]; then
    read -p "Github API token: " GITHUB_API_TOKEN
    if [ -n "$GITHUB_API_TOKEN" ]; then
        echo "export GITHUB_API_TOKEN='$GITHUB_API_TOKEN'" >> ~/.profile
    fi
fi

#
# Cloudflare
#
if [ -z ${CLOUDFLARE_API_TOKEN+x} ]; then
    read -p "Cloudflare API token: " CLOUDFLARE_API_TOKEN
    if [ -n "$CLOUDFLARE_API_TOKEN" ]; then
        echo "export CLOUDFLARE_API_TOKEN='$CLOUDFLARE_API_TOKEN'" >> ~/.profile
    fi
fi

source ~/.profile