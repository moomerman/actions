FROM node:slim

LABEL "maintainer"="Richard Taylor <moomerman@gmail.com>"

LABEL "com.github.actions.name"="Chrome"
LABEL "com.github.actions.description"="A GitHub Action to run chrome"
LABEL "com.github.actions.icon"="globe"
LABEL "com.github.actions.color"="green"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r chromeuser \
  && useradd -r -g chromeuser -G audio,video chromeuser \
  && mkdir -p /home/chromeuser/Downloads \
  && chown -R chromeuser: /home/chromeuser

USER chromeuser
