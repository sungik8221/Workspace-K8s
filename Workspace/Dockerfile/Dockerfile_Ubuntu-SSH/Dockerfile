FROM ubuntu:22.04
RUN mkdir /TempFolder
WORKDIR /TempFolder
COPY auto.sh .
RUN chmod +x /TempFolder/auto.sh
ENV DEBCONF_NOWARNINGS="yes"
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND teletype
CMD /TempFolder/auto.sh
