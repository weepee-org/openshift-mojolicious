FROM perl:latest
MAINTAINER Joeri van Dooren

# install Carton & Mojo
RUN cpanm Carton Mojolicious

# fix timezone shizzle
RUN cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
echo "Europe/Brussels" >  /etc/timezone

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
      io.k8s.display-name="mojolicious perl" \
      io.openshift.expose-services="3000:http" \
      io.openshift.tags="builder,mojolicious,perl"
