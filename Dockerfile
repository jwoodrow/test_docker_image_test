FROM ruby:2.7.0

LABEL "name"="Test Docker Image Test"
LABEL "version"="0.0.1"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update --fix-missing
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev

ENV BUNDLE_PATH='/bundle/vendor'
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=C.UTF-8
ENV PG_HOST='postgres'
ENV PG_PASSWORD='postgres'
ENV PG_USERNAME='postgres'
ENV RACK_ENV='test'
ENV RAILS_ENV='test'
ENV RUBYOPT='-W0'
ENV REDIS_CACHE_URL='redis://redis:6379/0'
ENV REDIS_QUEUE_URL='redis://redis:6379/0'

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash \
    && source $NVM_DIR/nvm.sh

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN  apt-get update && \
     apt-get install -y google-chrome-stable && \
     echo "CHROME_BIN=/usr/bin/google-chrome" | tee -a /etc/environment && \
     apt-get -yqq install libpq-dev && \
     apt-get install -qq -y google-chrome-stable yarn postgresql

RUN gem install bundler:2.1.2
