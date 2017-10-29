#! /bin/bash
sudo docker run -d -p 8080:8080 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v /home/husamay/workspace/docker/jenkins_home:/var/jenkins_home test
