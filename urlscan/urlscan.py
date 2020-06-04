#!/usr/bin/env python3

import requests
import time
import sys
import json
import shutil
import os

timeout = 5

api_key = os.environ['URLSCAN_API_KEY']
url = sys.argv[1]
output_dir = sys.argv[2]

headers = {
    "Content-Type": "application/json",
    "API-Key": api_key,
}

data = {
    'url': url, 
}

if '@' in url:
    sys.stderr.write("FAILED: '%s' Auth information included or an e-mail address!\n" % (url))
    exit()

response = requests.post("https://urlscan.io/api/v1/scan/", headers=headers, json=data)
if response.status_code == 200:
    uuid = response.json()['uuid']
    print("%s: %s" % (url, response.json()['result']))

    waiting = True
    sys.stderr.write('Waiting for results on "%s".' % (url))
    sys.stderr.flush()
    while waiting:
        time.sleep(timeout)
        response = requests.get("https://urlscan.io/api/v1/result/%s/" % (uuid))
        if response.status_code == 404:
            sys.stderr.write('.')
            sys.stderr.flush()
        elif response.status_code == 200:
            sys.stderr.write(" done.\n")
            waiting = False

            output = json.dumps(response.json(), sort_keys=True, indent=4, separators=(',', ': '))
            with open("%s/%s.json" % (output_dir, url), "w") as fp:
                fp.write(output)

            time.sleep(timeout)
            response = requests.get("https://urlscan.io/screenshots/%s.png" % (uuid), stream=True)
            with open("%s/%s.png" % (output_dir, url), "wb") as fp:
                shutil.copyfileobj(response.raw, fp)

            time.sleep(timeout)

        else:
            sys.stderr.write(" FAILED.\n")

else:
    sys.stderr.write("FAILED: %s\n" % (response.content))
    time.sleep(timeout)

