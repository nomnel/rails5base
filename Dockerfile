FROM ruby:2.3.2

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y mysql-client nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

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
