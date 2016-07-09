FROM centos:latest
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install find xargs pwgen supervisor bash-completion psmisc tar postgresql mysql uuid libuuid curl wget git gcc hiredis hiredis-devel libidn expat socat zeromq3 lrzip redis && \
yum search perl | grep "^perl" | awk "{ print \$1 }" | grep x86 | grep -v gettext | xargs yum -y --allowerasing --best install && yum clean all -y && \
curl -L https://cpanmin.us | perl - --sudo App::cpanminus && \
ln -s /usr/local/bin/cpanm /usr/bin/cpanm && \
/usr/local/bin/cpanm App::cpanoutdated && \
cpan-outdated -p | sudo /usr/local/bin/cpanm && \
cpanm Mojolicious Redis::Fast Mojo::JSON Mojolicious::Plugin::RenderFile Mojolicious::Plugin::Sentry Data::GUID Time::Interval EV AnyEvent AnyEvent::DNS File::Basename Mojo::IOLoop AnyEvent::HTTP AnyEvent::HTTP::Request File::Touch Config::YAML WebService::HipChat Data::Validate::URI File::Sync XML::Loy XML::XML2JSON JSON::Syck Modern::Perl Mojolicious::Plugin::YamlConfig YAML::XS Test::BDD::Cucumber boolean && \
cpanm -f AnyEvent::WebSocket::Client

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
      io.openshift.tags="builder,mojolicious,perl"
