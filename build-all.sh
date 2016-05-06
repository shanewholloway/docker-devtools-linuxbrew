#!/bin/sh
echo ":: Building 'devtools-linuxbrew' chain" \
  \
  && echo "\n\n:: Build 'devtools-linuxbrew:base' \n" \
  && docker build \
      -t shane/devtools-linuxbrew-base:xenial \
      -t shane/devtools-linuxbrew-base:latest \
      \
      -t shane/devtools-linuxbrew:base-xenial \
      -t shane/devtools-linuxbrew:base \
      ./devtools-base \
  \
  && echo "\n\n:: Build 'devtools-linuxbrew:base' \n" \
  && docker build \
      -t shane/devtools-linuxbrew-core:xenial \
      -t shane/devtools-linuxbrew-core:latest \
      \
      -t shane/devtools-linuxbrew:core-xenial \
      -t shane/devtools-linuxbrew:core \
      ./devtools-core \
  \
  && echo "\n\n:: Build 'devtools-linuxbrew:tip' \n" \
  && docker build \
      -t shane/devtools-linuxbrew-tip:xenial \
      -t shane/devtools-linuxbrew-tip:latest \
      \
      -t shane/devtools-linuxbrew:tip-xenial \
      -t shane/devtools-linuxbrew:tip \
      -t shane/devtools-linuxbrew:latest \
      -t devtools \
      ./devtools-tip \
  \
  && echo "\n\n:: Completed building 'devtools-linuxbrew' chain \n" \
  && true
