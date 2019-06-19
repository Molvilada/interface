FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs mysql-client default-libmysqlclient-dev
RUN gem install bundler

RUN mkdir /interface
WORKDIR /interface

ADD Gemfile /interface/Gemfile
ADD Gemfile.lock /interface/Gemfile.lock

RUN bundle install
ADD . /interface

EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]

