FROM debian:stable-slim

LABEL "maintainer"="Richard Taylor <moomerman@gmail.com>"

LABEL "com.github.actions.name"="Git for GitHub Actions"
LABEL "com.github.actions.description"="Runs git in an Action"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
	apt-get install git-core -y && \
	apt-get clean -y

ENTRYPOINT ["/entrypoint.sh"]
