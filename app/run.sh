#!/bin/sh

if [ $RUNTYPE="production" ]; then
  PERL_ANYEVENT_RESOLV_CONF=resolv.conf hypnotoad -f mojo.pl
else
  PERL_ANYEVENT_RESOLV_CONF=resolv.conf morbo -f mojo.pl
fi
