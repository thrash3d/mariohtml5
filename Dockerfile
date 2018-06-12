FROM tomcat:9

MAINTAINER github.com/PengBAI

RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

ADD webapp/ /usr/local/tomcat/webapps/ROOT/

## Create non-root user and give sudo access :
RUN useradd -ms /bin/bash mario \
    && usermod -aG root mario \
    && echo 'ALL  ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && chown -R mario:root /usr/local/tomcat

USER mario

EXPOSE 8080
CMD ["catalina.sh", "run"]

