FROM ubuntu:20.10

ENV HAMACHI_VERSION 2.1.0.203-1_amd64.deb
ENV HAMACHI_NAME logmein-hamachi_$HAMACHI_VERSION
ENV HAMACHI_URL https://www.vpn.net/installers/$HAMACHI_NAME

RUN apt-get update -qq

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget ssh inetutils-ping psmisc

RUN wget $HAMACHI_URL

RUN dpkg -i $HAMACHI_NAME

COPY ["Scripts/hamachi_startup.sh", "/usr/local/bin/"]

RUN cd "/usr/local/bin/" \
 && chmod +x "hamachi_startup.sh" 

WORKDIR /usr/local/bin
CMD /usr/local/bin/hamachi_startup.sh