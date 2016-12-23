FROM ruby:2.3.3

ENV LANG C.UTF-8

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get update -qq \
  && apt-get install -y mysql-client nodejs yarn --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/lib/mysql && touch /var/lib/mysql/mysql.sock
COPY ./containers/db/my.cnf /etc/

RUN mkdir /myapp
WORKDIR /myapp

ENV BUNDLE_PATH /bundle
