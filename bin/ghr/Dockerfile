FROM debian:stable-slim

LABEL "maintainer"="Richard Taylor <moomerman@gmail.com>"

LABEL "com.github.actions.name"="GHR for GitHub Actions"
LABEL "com.github.actions.description"="Runs ghr in an Action"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
	apt-get install curl -y && \
	apt-get clean -y && \
  curl -fSL -O https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz && \
  tar zxf ghr_v0.12.0_linux_amd64.tar.gz && \
  mv ghr_v0.12.0_linux_amd64/ghr . && \
  rm -rf ghr_v0.12.0_linux_amd64*

ENTRYPOINT ["/entrypoint.sh"]
