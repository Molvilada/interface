FROM ruby:2.6

RUN mkdir /interface
WORKDIR /interface

ADD Gemfile /interface/Gemfile
ADD Gemfile.lock /interface/Gemfile.lock

RUN bundle install
ADD . /interface
