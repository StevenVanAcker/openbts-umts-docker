FROM ubuntu:18.04

COPY install-openbts-umts.sh /opt
RUN chmod +x /opt/install-openbts-umts.sh
RUN /opt/install-openbts-umts.sh

