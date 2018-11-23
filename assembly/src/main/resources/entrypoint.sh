#!/bin/sh
set -e

VM_OPTIONS=`cat start.vmoptions | egrep -v "^#.*"`

exec java ${VM_OPTIONS} ${JAVA_OPTIONS} -jar application.jar --spring.profiles.active=prod ${@}