FROM ubuntu:xenial

RUN echo "Installing prereqs for Linuxbrew (http://linuxbrew.sh/)" \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get update && apt-get install -q -y --no-install-recommends \
      file locales ca-certificates curl git build-essential ruby python-setuptools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && localedef -i en_US -f UTF-8 en_US.UTF-8 \
 && /bin/true

ENV HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/brew}

RUN echo "Installing Linuxbrew (http://linuxbrew.sh/) at '$HOMEBREW_PREFIX'" \
 && git clone https://github.com/Linuxbrew/brew.git $HOMEBREW_PREFIX \
\
 && echo "#!/bin/bash \n\
export HOMEBREW_PREFIX=\"$HOMEBREW_PREFIX\" \n\
export PATH=\"\$HOMEBREW_PREFIX/bin:\$PATH\" \n\
export MANPATH=\"\$HOMEBREW_PREFIX/share/man:\$MANPATH\" \n\
export INFOPATH=\"\$HOMEBREW_PREFIX/share/info:\$INFOPATH\" \n\
" > $HOMEBREW_PREFIX/set-path \
\
 && echo "#!/bin/bash \n\
source $HOMEBREW_PREFIX/set-path \n\
exec /bin/bash --login -c \"\${@}\" \n\
" > $HOMEBREW_PREFIX/enter \
\
 && echo "#!/bin/bash \n\
$HOMEBREW_PREFIX/bin/brew cleanup \n\
rm -rf \$($HOMEBREW_PREFIX/bin/brew --cache) \n\
/bin/true \n\
" > $HOMEBREW_PREFIX/bin/brew-docker-cleanup \
\
 && chmod +x \
      $HOMEBREW_PREFIX/set-path \
      $HOMEBREW_PREFIX/enter \
      $HOMEBREW_PREFIX/bin/brew-docker-cleanup \
 && /bin/true

ENV PATH="$HOMEBREW_PREFIX/bin:$PATH"

RUN echo "Priming Linuxbrew installation…" \
 && brew update && brew doctor \
 && brew install --build-from-source pkg-config \
 && brew-docker-cleanup

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/devtools-linuxbrew-base:xenial
