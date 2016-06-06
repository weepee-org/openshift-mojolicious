#!/bin/bash -x

cd /app

MOJO_MODE=development
PERL_ANYEVENT_RESOLV_CONF=resolv.conf

if [ "$MOJO_MODE" = "production" ]; then
   /usr/local/bin/hypnotoad -f mojo.pl
else
  while true; do
   /usr/local/bin/morbo -m development mojo.pl -w /app/mojo.pl -w /app/modules -v
   sleep 2;
 done
fi
