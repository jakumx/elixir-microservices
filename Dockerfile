FROM elixir:latest

COPY . /opt/application

WORKDIR /opt/application

# CMD ["mix" "deps.get"]
RUN mix local.hex --force

RUN mix deps.get

EXPOSE 4000