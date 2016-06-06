FROM alpine:3.4
MAINTAINER Joeri van Dooren <ure@mororless.be>

RUN apk update && apk add bash tar rsync  \
perl perl-dev gcc musl-dev libxml2 libxml2-dev  make wget curl git vim redis perl-net-ssleay perl-clone perl-package-stash perl-package-stash-xs perl-lwp-useragent-determined perl-data-uuid perl-datetime perl-file-rsync perl-mime-tools perl-yaml-xs perl-extutils-cchecker perl-extutils-helpers perl-extutils-config perl-extutils-installpaths  perl-yaml-xs perl-yaml-syck perl-json perl-exporter perl-data-uuid perl-time-hires perl-time-date perl-datetime-timezone perl-file-slurp perl-params-validate perl-xml-sax && \
wget --no-check-certificate -O - http://cpanmin.us | perl - App::cpanminus && \
rm -f /var/cache/apk/* && \
apk upgrade && \
#apk add tzdata && \
#cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
#echo "Europe/Brussels" >  /etc/timezone && \
#apk del tzdata && \
cpanm Data::Dumper JSON::XS XML::LibXML Redis::Fast ExtUtils::MakeMaker parent Perl::Critic Perl::Critic::Utils Test::Perl::Critic Sentry::Raven Mojolicious  Mojo::JSON Mojolicious::Plugin::RenderFile Mojolicious::Plugin::Sentry Data::GUID Time::Interval AnyEvent AnyEvent::DNS File::Basename Mojo::IOLoop AnyEvent::HTTP AnyEvent::HTTP::Request Config::YAML WebService::HipChat Data::Validate::URI XML::Loy JSON::Syck Modern::Perl Mojolicious::Plugin::YamlConfig boolean File::Sync WWW::Mailgun experimental && \
cpanm --force XML::LibXML XML::XML2JSON

# zbar
RUN apk add linux-headers imagemagick-dev jpeg-dev libjpeg jpeg libltdl libtool lcms2-dev fontconfig-dev freetype-dev && \
cd /tmp && \
wget http://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2 && \
bunzip2 -c zbar-0.10.tar.bz2 | tar xvf - && \
cd zbar-0.10 && \
./configure --disable-video --without-python --without-qt --without-gtk && \
make && make install && \
cpanm -f Barcode::ZBar

# Your app
ADD app/mojo.pl /app/mojo.pl

# Exposed Port
EXPOSE 3000

# VOLUME /app
WORKDIR /app

ENTRYPOINT ["/app/run.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Mojolicious" \
      io.k8s.display-name="mojolicious centos7 epel" \
      io.openshift.expose-services="3000:http" \
      io.openshift.tags="builder,mojolicious,perl" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
