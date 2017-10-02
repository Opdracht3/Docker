"# Docker" 

1.Run onderstaande commando's
  
  1.1 docker build -t myjenkins  https://github.com/Opdracht3/Docker.git
  
  1.2 docker run -p 4001:8080 --name=jenkins-master -d myjenkins
  
2. Ga vervolgens naar http://localhost:4001

  2.1 vul het admin wachtwoord die in de log met met commando "docker logs -f jenkins-master" te zien is
