#!/bin/bash

if [ $MOJO_MODE="production" ]; then
  PERL_ANYEVENT_RESOLV_CONF=resolv.conf /usr/local/bin/hypnotoad -f mojo.pl
else
  PERL_ANYEVENT_RESOLV_CONF=resolv.conf /usr/local/bin/morbo -m development -f mojo.pl -w /app/mojo.pl w /app/modules -v
fi
