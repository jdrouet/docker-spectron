ARG IMAGE_TAG=latest

FROM electronuserland/builder:${IMAGE_TAG}

RUN apt-get update \
  && apt-get install -y xvfb libxss1 libasound2 socat \
  && rm -rf /var/lib/apt/lists/*

ENV ELECTRON_ENABLE_STACK_DUMPING=true
ENV ELECTRON_ENABLE_LOGGING=true
ENV DISPLAY=:99

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

