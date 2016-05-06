FROM shane/devtools-linuxbrew-base:xenial

RUN echo "Brewing core devtools…" \
 && brew install --build-from-source \
      vim \
      zsh \
      git \
      htop \
      socat \
      tmux \
 && brew-docker-cleanup

RUN echo "Brewing python (2.7+)…" \
 && brew install --build-from-source python \
 && brew-docker-cleanup

RUN echo "Brewing python3 (3.5+)…" \
 && brew install --build-from-source python3 \
 && brew-docker-cleanup

RUN echo "Brewing node (6.0+)…" \
 && brew install --build-from-source node \
 && brew-docker-cleanup

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/devtools-linuxbrew-core:xenial

# Then in an inherited Dockerfile, add:
#
#     VOLUME ["$HOMEBREW_PREFIX"]
#

