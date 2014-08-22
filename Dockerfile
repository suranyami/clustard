FROM ubuntu:14.04
MAINTAINER suranyami <david.parry@suranyami.com>

# Install base package
RUN apt-get update
RUN apt-get install -y wget git build-essential

# Install Erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y erlang

# Install Elixir
WORKDIR /tmp/elixir-build
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR elixir
RUN git checkout v0.15.1 && make && make install

# Set UTF-8 in locale
RUN locale-gen en_US.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL C.UTF-8

# Install Clustard
RUN git clone https://github.com/suranyami/websockets-elixir
WORKDIR websockets-elixir
ENV PORT 4000
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get --verbose
ENV MIX_ENV prod
RUN mix phoenix.start &

# Allow HTTP access
EXPOSE 4000
