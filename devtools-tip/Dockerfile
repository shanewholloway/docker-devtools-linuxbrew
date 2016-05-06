FROM shane/devtools-linuxbrew:core-xenial
# TO IMAGE shane/devtools-linuxbrew:tip-xenial

RUN echo "Brewing rest of devtools…" \
 && python2 -m pip install pip --upgrade \
 && python3 -m pip install pip --upgrade \
 && pip2 install mercurial \
 && npm install -g gulp grunt nodemon pm2 \
 && /bin/true

RUN echo "#!/bin/bash \n\
source $HOMEBREW_PREFIX/set-path \n\
exec /brew/bin/zsh --login \n\
" > $HOMEBREW_PREFIX/enter \
\
 && chmod +x $HOMEBREW_PREFIX/enter \
 && /bin/true

VOLUME ["$HOMEBREW_PREFIX"]
CMD ["/bin/true"]

