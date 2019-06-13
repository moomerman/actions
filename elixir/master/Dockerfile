FROM erlang:22

LABEL "repository"="https://github.com/moomerman/actions"
LABEL "homepage"="https://github.com/moomerman/actions/elixir"
LABEL "maintainer"="Richard Taylor <moomerman@gmail.com>"

LABEL "com.github.actions.name"="Elixir master mix"
LABEL "com.github.actions.description"="An action for running Elixir commands"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="purple"

# elixir expects utf8.
ENV ELIXIR_VERSION="master" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION}.tar.gz" \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean

ARG MIX_HOME=/.mix
ENV MIX_HOME=$MIX_HOME
ARG MIX_ENV=dev
ENV MIX_ENV=$MIX_ENV

RUN mix local.rebar --force
RUN mix local.hex --force

CMD ["iex"]
