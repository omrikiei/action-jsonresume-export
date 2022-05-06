#!/bin/sh -l

THEME=${1}
RESUME=${2}
OUTPUT=${3}

THEME_PACKAGE=jsonresume-theme-${THEME}
echo "Installing theme: ${THEME}"

# NOTE: this needs to be installed locally, not globally
npm install ${THEME_PACKAGE}
PUPPETEER_PRODUCT=firefox npm install

python3 -m http.server &

resume export --resume ${RESUME} --theme ${THEME} --format pdf /github/workspace/${OUTPUT}.pdf
