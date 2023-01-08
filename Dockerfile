FROM ruby:3.0.0-alpine

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    tzdata \
    nodejs \
    yarn

RUN mkdir /chat-application

WORKDIR /chat-application

ADD Gemfile /chat-application/Gemfile

ADD Gemfile.lock /chat-application/Gemfile.lock

RUN bundle install

ADD . /chat-application

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
CMD ["sh", "docker-entrypoint.sh"]

EXPOSE 3000