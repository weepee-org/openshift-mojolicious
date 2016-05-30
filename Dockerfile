FROM alpine:3.3
MAINTAINER Joeri van Dooren <ure@mororless.be>

RUN apk update && apk add perl make wget curl git vim perl-net-ssleay perl-clone perl-list-moreutils perl-package-stash perl-package-stash-xs perl-lwp-useragent-determined perl-data-uuid && apk --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --update add perl-json-xs && wget --no-check-certificate -O - http://cpanmin.us | perl - App::cpanminus && cpanm Mojolicious Redis::Fast Mojo::JSON Mojolicious::Plugin::RenderFile Mojolicious::Plugin::Sentry Data::GUID Time::Interval EV AnyEvent AnyEvent::DNS File::Basename Mojo::IOLoop AnyEvent::HTTP AnyEvent::HTTP::Request File::Touch Config::YAML WebService::HipChat Data::Validate::URI File::Sync XML::Loy XML::XML2JSON JSON::Syck Modern::Perl Mojolicious::Plugin::YamlConfig YAML::XS Test::BDD::Cucumber boolean

RUN cpanm -f AnyEvent::WebSocket::Client

# Build Debug
RUN find /root/.cpanm/work/*/build.log | xargs cat

# Run scripts
ADD scripts/run.sh /scripts/run.sh

# Make executable
RUN chmod a+rx /scripts/run.sh

# Your app
ADD app/mojo.pl /app/mojo.pl

# Exposed Port
EXPOSE 3000

# VOLUME /app
WORKDIR /app

ENTRYPOINT ["/scripts/run.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Mojolicious" \
      io.k8s.display-name="mojolicious centos7 epel" \
      io.openshift.expose-services="3000:http" \
      io.openshift.tags="builder,mojolicious,perl" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
