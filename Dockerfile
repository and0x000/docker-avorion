FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive 
ENV SERVER_DIRECTORY=/opt/server 
ENV OVERWRITE_DIRECTORY=/opt/server-overwrite
RUN apt-get update &&\
    apt-get install -y curl lib32gcc1 &&\
    apt-get autoremove -y

RUN mkdir -p /opt/steamcmd &&\
    cd /opt/steamcmd &&\
    curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar vxz

RUN mkdir -p ${SERVER_DIRECTORY}
ADD docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod 755 /opt/docker-entrypoint.sh


VOLUME /root/.avorion/galaxies/avorion_galaxy
# Ports required 
EXPOSE 27000 
EXPOSE 27000/udp 
EXPOSE 27003 
EXPOSE 27003/udp 
EXPOSE 27020 
EXPOSE 27021 

# Admin steamID 
ENV USER=nobody

ENTRYPOINT /opt/docker-entrypoint.sh
