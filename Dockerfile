FROM alpine:3.4
MAINTAINER Joeri van Dooren <ure@mororless.be>

RUN apk update && apk add tzdata bash tar rsync  \
libxml2 wget curl git vim redis libjpeg jpeg libltdl libtool \
perl-dev gcc musl-dev libxml2-dev make linux-headers imagemagick-dev jpeg-dev lcms2-dev fontconfig-dev freetype-dev imagemagick imagemagick-dev \
perl perl-net-ssleay perl-clone perl-package-stash perl-package-stash-xs perl-lwp-useragent-determined perl-data-uuid perl-datetime perl-file-rsync perl-mime-tools perl-yaml-xs perl-extutils-cchecker perl-extutils-helpers perl-extutils-config perl-extutils-installpaths  perl-yaml-xs perl-yaml-syck perl-json perl-exporter perl-data-uuid perl-time-hires perl-time-date perl-datetime-timezone perl-file-slurp perl-params-validate perl-xml-sax perl-test-deep perl-test-leaktrace perl-test-sharedfork perl-test-tcp perl-data-guid perl-boolean perl-mime-base64 && \
apk upgrade && \
wget --no-check-certificate -O - http://cpanmin.us | perl - App::cpanminus && \
cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
echo "Europe/Brussels" >  /etc/timezone && \
cpanm Data::Dumper JSON::XS ExtUtils::MakeMaker parent Perl::Critic Perl::Critic::Utils Test::Perl::Critic Sentry::Raven Mojolicious  Mojo::JSON Mojolicious::Plugin::RenderFile Mojolicious::Plugin::Sentry  Time::Interval AnyEvent AnyEvent::DNS File::Basename Mojo::IOLoop AnyEvent::HTTP AnyEvent::HTTP::Request Config::YAML WebService::HipChat Data::Validate::URI XML::Loy JSON::Syck Modern::Perl Mojolicious::Plugin::YamlConfig File::Sync WWW::Mailgun experimental Sentry::Raven MongoDB::MongoClient MongoDB::GridFS AnyEvent::WebSocket::Client && \
cpanm --force XML::LibXML XML::XML2JSON Redis::Fast Image::Magick && \
cd /tmp && \
wget http://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2 && \
bunzip2 -c zbar-0.10.tar.bz2 | tar xvf - && \
cd zbar-0.10 && \
./configure --disable-video --without-python --without-qt --without-gtk --prefix=/usr && \
make && make install && \
cpanm -f Barcode::ZBar && \
rm -fr /tmp/* && \
#apk del tzdata perl-dev gcc musl-dev libxml2-dev make linux-headers imagemagick-dev jpeg-dev lcms2-dev fontconfig-dev freetype-dev && \
rm -f /var/cache/apk/*

# Your app
ADD app/mojo.pl /app/mojo.pl

# Exposed Port
EXPOSE 3000

# VOLUME /app
WORKDIR /app

ENTRYPOINT ["/app/run.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Mojolicious" \
      io.k8s.display-name="mojolicious alpine" \
      io.openshift.expose-services="3000:http" \
      io.openshift.tags="builder,mojolicious,perl" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
