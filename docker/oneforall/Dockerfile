FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends git python3-pip python3-uvloop python3-setuptools python3-wheel \
    && apt-get install -y --no-install-recommends build-essential python3-dev libffi-dev libxml2-dev libxslt1-dev libldns-dev \
    && mkdir /opt/oneforall \
    && git clone https://github.com/shmilylty/OneForAll /opt/oneforall \
    && pip3 install -r /opt/oneforall/requirements.txt \
    && chmod +x /opt/oneforall/oneforall.py

COPY api.py /opt/oneforall/config/api.py

WORKDIR /opt/oneforall
ENTRYPOINT ["/opt/oneforall/oneforall.py"]
