# 2020/5/2 時点の最新の安定版を指定している
FROM ruby:3.0.1
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential nodejs
# Webpacker のインストールのため 1 系の yarn をインストールする必要がある
# @see https://classic.yarnpkg.com/en/docs/install#debian-stable
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
