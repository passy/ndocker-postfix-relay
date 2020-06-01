#!/usr/bin/env sh

set -ex

# shellcheck disable=SC2154
if test "$NOMAD_PORT_smtp"; then
  export SMTP_PORT="$NOMAD_PORT_smtp"
else
  export SMTP_PORT="smtp"
fi

busybox syslogd -n -O /dev/stdout &
bbchild=$!

newaliases
postmap /etc/postfix/virtual

consul-template -config /etc/ndocker/postfix.hcl &
child=$!

trap 'kill $bbchild $child' INT TERM
trap 'newaliases && postmap /etc/postfix/virtual' USR1
wait $child
