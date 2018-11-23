FROM openjdk:8-jre-alpine

MAINTAINER Filipe Bojikian Rissi <f.b.rissi@gmail.com>

COPY start.vmoptions .
COPY application.jar .
COPY send-mail.jar .
COPY send_logger.pem .ssh/
COPY entrypoint.sh error.sh /usr/bin/

RUN apk add --no-cache openssh \
    && mkdir -p /var/jvm/dump \
    && mkdir -p /var/jvm/logs

ENTRYPOINT ["entrypoint.sh"]