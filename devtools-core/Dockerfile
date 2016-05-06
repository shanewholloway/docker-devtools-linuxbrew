FROM shane/devtools-linuxbrew-base:xenial
# TO IMAGE shane/devtools-linuxbrew-core:xenial

RUN echo "Brewing core devtools…" \
 && brew install --build-from-source \
      vim \
      zsh \
      git \
      htop \
      socat \
      tmux \
 && /bin/true

RUN echo "Brewing python (2.7+)…" \
 && brew install --build-from-source python

RUN echo "Brewing python3 (3.5+)…" \
 && brew install --build-from-source python3

RUN echo "Brewing node (6.0+)…" \
 && brew install --build-from-source node

# Then in an inherited Dockerfile, add:
#
#     VOLUME ["$HOMEBREW_PREFIX"]
#

