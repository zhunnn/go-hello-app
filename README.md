# go-hello-app

## jenkins
docker rm -f jenkins

docker run -d \
  --name jenkins \
  --user root \
  -p 8120:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:latest

docker exec -u root -it jenkins bash

apt-get update
apt-get install -y docker.io
docker --version
exit