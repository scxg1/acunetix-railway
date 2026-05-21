FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ttyd curl wget git vim nano htop net-tools \
    iputils-ping python3 python3-pip sudo socat \
    libxslt1.1 libxml2 libpq5 attr \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/start.sh"]
