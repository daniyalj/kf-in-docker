FROM ubuntu:18.04

RUN apt-get update && apt-get install -y vim  apt-transport-https gnupg2 git curl

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

RUN gsutil cp gs://kf-releases/v2.0.0/kf-linux /tmp/kf
RUN chmod a+x /tmp/kf
RUN mv /tmp/kf /usr/local/bin/kf

# Handy for keeping container alive

#CMD tail -f /dev/null
