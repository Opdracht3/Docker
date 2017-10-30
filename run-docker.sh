#! /bin/bash
sudo docker run -d -p 80:80 -p 8080:8080 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v /home/husamay/workspace/rps-pipeline/jenkins_home:/var/jenkins_home test
