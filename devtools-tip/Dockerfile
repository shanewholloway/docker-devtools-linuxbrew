FROM shane/devtools-linuxbrew:core-xenial
# TO IMAGE shane/devtools-linuxbrew:tip-xenial

RUN echo "Brewing rest of devtools…" \
 && brew install --build-from-source \
      mercurial \
 && /bin/true

VOLUME ["$HOMEBREW_PREFIX"]

