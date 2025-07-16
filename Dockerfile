FROM registry.hub.docker.com/library/debian:latest AS build

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl gpg lsb-release
RUN curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

RUN apt-get update
RUN apt-get install -y cloudflare-warp

COPY start.sh /start.sh
RUN chmod +x ./start.sh

COPY mdm.xml /var/lib/cloudflare-warp/mdm.xml

ENTRYPOINT ["./start.sh"]