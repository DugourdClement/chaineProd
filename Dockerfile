FROM jenkins/jenkins:lts

USER root

RUN apt-get update -qq \
&& apt-get install -qqy apt-transport-https ca-certificates \
curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
| apt-key add -
RUN add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/debian \
$(lsb_release -cs) \
stable"

RUN apt-get install -y \
           apt-transport-https \
           ca-certificates \
           curl \
           gnupg2 \
           software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && echo "deb [arch=arm64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y docker-ce
