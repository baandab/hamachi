FROM ubuntu:20.10

ENV HAMACHI_VERSION 2.1.0.203-1
ENV HAMACHI_ARCH amd64.deb
ENV HAMACHI_NAME logmein-hamachi_$HAMACHI_VERSION_$HAMACHI_ARCH
ENV HAMACHI_URL https://www.vpn.net/installers/$HAMACHI_NAME

RUN apt-get update

RUN apt-get install psmisc wget ssh inetutils-ping

RUN wget $HAMACHI_URL
RUN dpkg -i $HAMACHI_NAME

COPY ["Scripts/hamachi_startup.sh", "/usr/local/bin/"]

RUN cd "/usr/local/bin/" \
 && chmod +x "hamachi_startup.sh" \
 && cleanimage

WORKDIR /usr/local/bin
CMD ./hamach_startup.sh