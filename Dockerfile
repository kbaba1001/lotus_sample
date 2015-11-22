FROM ruby:2.2.3

RUN apt-get update -qq
RUN apt-get install -y sqlite libsqlite3-dev
RUN apt-get install -y build-essential libpq-dev nodejs npm nodejs-legacy graphviz
RUN npm install -g phantomjs

ENV APP_HOME /lotus_sample
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

ADD . $APP_HOME
