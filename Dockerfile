FROM ruby:2.3.2

ENV LANG C.UTF-8

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get update -qq && \
  apt-get install -y mysql-client nodejs yarn --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /var/lib/mysql && touch /var/lib/mysql/mysql.sock
ADD ./containers/db/my.cnf /etc/

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV app_dir /myapp
RUN mkdir $app_dir
WORKDIR $app_dir
ADD . $app_dir

EXPOSE 3000
