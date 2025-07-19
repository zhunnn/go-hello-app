# go-hello-app

## jenkins
docker run -d \
    --name jenkins \
    -p 8120:8080 -p 50000:50000 \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jenkins/jenkins:lts

docker exec -it jenkins /bin/sh
cat /var/jenkins_home/secrets/initialAdminPassword

