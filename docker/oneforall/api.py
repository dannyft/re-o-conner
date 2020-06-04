import os

def get_env_var(key, default=""):
    if key in os.environ:
        return os.environ[key]
    else:
        return default

censys_api_id = get_env_var('CENSYS_API_ID')
censys_api_secret = get_env_var('CENSYS_API_SECRET')

binaryedge_api = get_env_var('BINARYEDGE_API')

chinaz_api = get_env_var('CHINAZ_API')

bing_api_id = get_env_var('BING_API_ID')
bing_api_key = get_env_var('BING_API_KEY')

securitytrails_api = get_env_var('SECURITYTRAILS_API')

fofa_api_email = get_env_var('FOFA_API_EMAIL')
fofa_api_key = get_env_var('FOFA_API_KEY')

google_api_key = get_env_var('GOOGLE_API_KEY')
google_api_cx = get_env_var('GOOGLE_API_CX')

riskiq_api_username = get_env_var('RISKIQ_API_USERNAME')
riskiq_api_key = get_env_var('RISKIQ_API_KEY')

shodan_api_key = get_env_var('SHODAN_API_KEY')

threatbook_api_key = get_env_var('THREATBOOK_API_KEY')

virustotal_api_key = get_env_var('VT_API_KEY')

zoomeye_api_usermail = get_env_var('ZOOMEYE_API_USERMAIL')
zoomeye_api_password = get_env_var('ZOOMEYE_API_PASSWORD')

spyse_api_token = get_env_var('SPYSE_API_TOKEN')

circl_api_username = get_env_var('CIRCL_API_USERNAME')
circl_api_password = get_env_var('CIRCL_API_PASSWORD')

dnsdb_api_key = get_env_var('DNSDB_API_KEY')

ipv4info_api_key = get_env_var('IPV4INFO_API_KEY')

passivedns_api_addr = get_env_var('PASSIVEDNS_API_ADDR')
passivedns_api_token = get_env_var('PASSIVEDNS_API_TOKEN')

github_api_user = get_env_var('GITHUB_API_USER')
github_api_token = get_env_var('GITHUB_API_TOKEN')

cloudflare_api_token = get_env_var('CLOUDFLARE_API_TOKEN')
