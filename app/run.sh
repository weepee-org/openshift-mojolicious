if [ $MOJO_MODE="production" ]; then
  PERL_ANYEVENT_RESOLV_CONF=resolv.conf hypnotoad -f mojo.pl
else
  PERL_ANYEVENT_RESOLV_CONF=resolv.conf morbo -m development -f mojo.pl -w /app/mojo.pl w /app/modules -v
fi
