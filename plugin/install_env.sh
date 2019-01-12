#!/bin/bash
set -eu

DIR=$( cd "$( dirname "$0" )" && pwd )
# echo $DIR
cd $DIR

PYENV_ROOT="${DIR}/pyenv"
PYENV_D="${DIR}/../pyenv"
PYENV_BIN="${PYENV_D}/bin/pyenv"
PY_VERSION=$1
ENV_NAME=$2
PROMPT_COMMAND='prompt'

if [ ! -e "${PYENV_D}/plugins/pyenv-virtualenv" ]; then
  cd ${PYENV_D}/plugins
  ln -s ../../pyenv-virtualenv pyenv-virtualenv
  cd -
fi

if command -v  $PYENV_BIN 1>/dev/null 2>&1; then
  eval "$($PYENV_BIN init -)"
fi
eval "$($PYENV_BIN virtualenv-init -)"

if [ ! -e "${PYENV_ROOT}/versions/${PY_VERSION}" ]; then
  $PYENV_BIN install -s $PY_VERSION
  $PYENV_BIN local $PY_VERSION
fi

if [ ! -e "${PYENV_ROOT}/versions/${ENV_NAME}" ]; then
  $PYENV_BIN virtualenv $PY_VERSION $ENV_NAME
  $PYENV_BIN local $ENV_NAME
fi

pip install pynvim

for m in ${@:3}
do
  pip install ${m}
done

# pip list

exit 0
