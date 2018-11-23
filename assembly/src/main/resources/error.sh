#!/bin/sh

#scp -o StrictHostKeyChecking=no -i .ssh/send_logger.pem /var/jvm/dump/* ${SCP_IP}:${SCP_PATH}/java-test/dump/
#scp -o StrictHostKeyChecking=no -i .ssh/send_logger.pem /var/jvm/log/* ${SCP_IP}:${SCP_PATH}/java-test/log/

DUMPS=`ls -p /var/jvm/dump/ | grep -v / | tr '\n' ','`
LOGS=`ls -p /var/jvm/log/ | grep -v / | tr '\n' ','`

java -jar send-mail.jar --ip="$SCP_IP" \
                        --application="$APPLICATION" \
                        --logPath="$SCP_PATH/dump/" \
                        --logs="$LOGS" \
                        --dumpPath="$SCP_PATH/logs/" \
                        --dumps="$DUMPS" \
                        --to="logger@gmail.com" \
                        --from="java-test@gmail.com" \
                        --replyTo="no-reply@gmail.com" \
                        --title="Erro $APPLICATION" \
                        --spring.profiles.active=prod \
                        --send-mail