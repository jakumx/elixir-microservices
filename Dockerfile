FROM elixir:latest

COPY . /opt/application

WORKDIR /opt/application

RUN mix local.hex --force

RUN mix deps.get

EXPOSE 4000