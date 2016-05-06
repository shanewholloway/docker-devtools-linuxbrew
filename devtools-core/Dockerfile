FROM shane/devtools-linuxbrew-base:xenial

RUN echo "Brewing python (2.7+)…" \
 && brew install --build-from-source python \
 \
 && echo "Brewing python3 (3.5+)…" \
 && brew install --build-from-source python3 \
 \
 && echo "Brewing node (6.0+)…" \
 && brew install --build-from-source node \
 \
 && brew-docker-cleanup

RUN echo "Brewing core devtools…" \
 && brew install --build-from-source \
      vim \
      zsh \
      git \
      htop \
      socat \
      tmux \
 && brew-docker-cleanup \
 && echo "#!/bin/bash \n\
source $HOMEBREW_PREFIX/set-path \n\
exec /brew/bin/zsh --login \"\${@}\" \n\
" > $HOMEBREW_PREFIX/enter \
 && chmod +x $HOMEBREW_PREFIX/enter \
 \
 && python2 -m pip install pip --upgrade \
 && python3 -m pip install pip --upgrade \
 \
 && /bin/true

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/devtools-linuxbrew-core:xenial

# Then in an inherited Dockerfile, add:
#
#     VOLUME ["$HOMEBREW_PREFIX"]
#

