From jenkins:2.60.3
Maintainer Timothy

USER root
RUN mkdir /var/log/jenkins
RUN chown -R  jenkins:jenkins /var/log/jenkins
USER jenkins
