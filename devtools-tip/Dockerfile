FROM shane/devtools-linuxbrew-core:xenial

RUN echo "Updating pip and npm devtools…" \
 && pip2 install mercurial \
 && npm install -g gulp grunt nodemon pm2 \
 && /bin/true

VOLUME ["$HOMEBREW_PREFIX"]

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/devtools-linuxbrew-tip:xenial
