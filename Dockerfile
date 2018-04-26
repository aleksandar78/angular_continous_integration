FROM node:8
LABEL maintainer="aleksandar.pavlovic78@gmail.com"

USER root

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update && apt-get install -y Xvfb google-chrome-stable \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt    

RUN wget https://yarnpkg.com/latest.tar.gz 
RUN tar -xvf latest.tar.gz && mkdir yarn && mv yarn-* yarn

ENV PATH "$PATH:/opt/yarn/bin"

CMD ["/bin/bash"]