FROM jenkins/jenkins:latest

#Add important library and apps
USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && apt-get install -y sudo libltdl-dev \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
      && apt-get install -y sudo nodejs

RUN sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
    && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list \
    && sudo apt-get update \
    && sudo apt-get install -y sudo google-chrome-stable

#INSTALL SLOPPY.IO(hosting) CLI
RUN curl -L https://files.sloppy.io/sloppy-`uname -s`-`uname -m` > /tmp/sloppy
VOLUME /usr/local/bin/sloppy

USER jenkins

#Skip setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#Make admin with pasword admin
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

#Install plugins
RUN /usr/local/bin/install-plugins.sh workflow-aggregator workflow-multibranch docker-plugin docker-slaves github-branch-source scm-api git-client git greenballs
