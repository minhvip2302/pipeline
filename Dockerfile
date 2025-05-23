
FROM jenkins/jenkins

USER root

RUN apt-get update && apt-get install python3-pip  -y 
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g firebase-tools

USER jenkins