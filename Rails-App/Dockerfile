FROM ruby:2.6.3

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /application
COPY . /application
WORKDIR /application

RUN bundle install

CMD rails s -b 0.0.0.0


