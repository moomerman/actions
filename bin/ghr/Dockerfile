FROM debian:stable-slim

LABEL "maintainer"="Richard Taylor <moomerman@gmail.com>"

LABEL "com.github.actions.name"="GHR for GitHub Actions"
LABEL "com.github.actions.description"="Runs ghr in an Action"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

ARG GHR_VERSION="0.12.1"
ENV GHR_VERSION=$GHR_VERSION

RUN apt-get update && \
	apt-get install curl -y && \
	apt-get clean -y && \
  curl -fSL -O https://github.com/tcnksm/ghr/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz && \
  tar zxf ghr_v${GHR_VERSION}_linux_amd64.tar.gz && \
  mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin && \
  rm -rf ghr_v${GHR_VERSION}_linux_amd64*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
