FROM elixir:1.13.2-alpine

RUN apk add --no-cache build-base npm git python3 inotify-tools bash

WORKDIR /var/www/web

RUN mix local.hex --force && \
    mix local.rebar --force
COPY mix.* ./
RUN mix do deps.get, deps.compile

COPY . /var/www/web

EXPOSE 4000