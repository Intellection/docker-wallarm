FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
      ca-certificates \
      dirmngr \
      gnupg2 \
      wget && \
    rm -rf /var/lib/apt/lists/* /tmp/*
ENV CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"

# Nginx
ARG NGINX_VERSION="1.20.2-1~focal"
RUN apt-key adv --no-tty --keyserver hkps://keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 && \
    echo 'deb http://nginx.org/packages/ubuntu focal nginx' > /etc/apt/sources.list.d/nginx.list && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y nginx=${NGINX_VERSION} && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Wallarm
ARG WALLARM_VERSION="3.4.1-1"
RUN wget -q -O- https://repo.wallarm.com/wallarm.gpg | apt-key add - && \
    echo 'deb http://repo.wallarm.com/ubuntu/wallarm-node focal/3.4/' > /etc/apt/sources.list.d/wallarm.list && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y \
      nginx-module-wallarm=${WALLARM_VERSION} \
      wallarm-node=${WALLARM_VERSION} && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Nginx Configuration
COPY ./config/nginx/ /etc/nginx/
RUN touch /var/run/nginx.pid
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    usermod -aG wallarm nginx

RUN chown -R nginx:wallarm /var/log/nginx

ENV TERM="xterm"
WORKDIR /

# USER nginx:nginx
# STOPSIGNAL SIGQUIT
CMD ["/bin/bash"]
