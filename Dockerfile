FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y \ 
    python3-pip python3-dev \
    libasound2 libdbus-glib-1-2 \
    xvfb \
    nodejs npm;

RUN pip3 install \
    robotframework \
    robotframework-browser;

RUN rfbrowser init

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod -R +x /bin/entrypoint.sh

ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

CMD ["entrypoint.sh"]