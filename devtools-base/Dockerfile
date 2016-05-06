FROM ubuntu:xenial
# TO IMAGE shane/devtools-linuxbrew:base-xenial

RUN echo "Installing prereqs for Linuxbrew (http://linuxbrew.sh/)" \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get update && apt-get install -q -y --no-install-recommends \
      locales ca-certificates curl git build-essential ruby python-setuptools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && localedef -i en_US -f UTF-8 en_US.UTF-8 \
 && /bin/true

ENV HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/brew}

RUN echo "Installing Linuxbrew (http://linuxbrew.sh/) to '$HOMEBREW_PREFIX'" \
 && git clone https://github.com/Linuxbrew/brew.git $HOMEBREW_PREFIX \
 && echo "#!/bin/sh \n\
export PATH=\"$HOMEBREW_PREFIX/bin:$PATH\" \n\
export MANPATH=\"$HOMEBREW_PREFIX/share/man:$MANPATH\" \n\
export INFOPATH=\"$HOMEBREW_PREFIX/share/info:$INFOPATH\" \n\
" > $HOMEBREW_PREFIX/brew-path.sh \
 && echo "#!/bin/csh \n\
setenv PATH \"$HOMEBREW_PREFIX/bin:$PATH\" \n\
setenv MANPATH \"$HOMEBREW_PREFIX/share/man:$MANPATH\" \n\
setenv INFOPATH \"$HOMEBREW_PREFIX/share/info:$INFOPATH\" \n\
" > $HOMEBREW_PREFIX/brew-path.tcsh \
 && /bin/true

ENV PATH="$HOMEBREW_PREFIX/bin:$PATH" \
    MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH" \
    INFOPATH="$HOMEBREW_PREFIX/share/info:$INFOPATH"

RUN echo "Priming Linuxbrew installation…" \
 && brew update && brew doctor \
 && brew install --build-from-source pkg-config \
 && /bin/true
