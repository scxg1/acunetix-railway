FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ttyd curl wget git vim nano htop net-tools \
    iputils-ping python3 python3-pip sudo socat \
    libxslt1.1 libxml2 libpq5 \
    && rm -rf /var/lib/apt/lists/*

# تثبيت Acunetix
RUN wget -q https://github.com/xiv3r/Acunetix-v24.10.241106172/releases/download/acunetix/acunetix_24.10.241106172_x64.sh -O /tmp/acunetix.sh \
    && bash /tmp/acunetix.sh -- --no-start \
    && rm /tmp/acunetix.sh

# تطبيق الـ crack
RUN git clone https://github.com/xiv3r/Acunetix-v24.10.241106172.git /tmp/crack \
    && cp /tmp/crack/wvsc /home/acunetix/.acunetix/v_241106172/scanner/wvsc \
    && chown acunetix:acunetix /home/acunetix/.acunetix/v_241106172/scanner/wvsc \
    && chmod +x /home/acunetix/.acunetix/v_241106172/scanner/wvsc \
    && rm -f /home/acunetix/.acunetix/data/license/* \
    && cp /tmp/crack/license_info.json /home/acunetix/.acunetix/data/license/ \
    && cp /tmp/crack/wa_data.dat /home/acunetix/.acunetix/data/license/ \
    && chown acunetix:acunetix /home/acunetix/.acunetix/data/license/license_info.json \
    && chown acunetix:acunetix /home/acunetix/.acunetix/data/license/wa_data.dat \
    && chmod 444 /home/acunetix/.acunetix/data/license/license_info.json \
    && chmod 444 /home/acunetix/.acunetix/data/license/wa_data.dat \
    && rm -rf /tmp/crack

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/start.sh"]
