FROM jenkins/jenkins:slim

#Add docker socket
USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers


#INSTALL SLOPPY.IO(hosting) CLI
RUN curl -L https://files.sloppy.io/sloppy-`uname -s`-`uname -m` > /tmp/sloppy
VOLUME /usr/local/bin/sloppy

USER jenkins

#Skip setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#Make admin with pasword admin
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

#Install plugins
RUN /usr/local/bin/install-plugins.sh workflow-multibranch docker-plugin docker-slaves github-branch-source scm-api git-client git greenballs