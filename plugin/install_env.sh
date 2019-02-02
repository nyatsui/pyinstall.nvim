#!/bin/bash
set -eu

DIR=$( cd "$( dirname "$0" )" && pwd )
# echo $DIR
cd $DIR

export PYENV_ROOT="${DIR}/../pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
PY_VERSION=$1
export PROMPT_COMMAND='prompt'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ ! -e "${PYENV_ROOT}/versions/${PY_VERSION}" ]; then
  pyenv install -s $PY_VERSION
  pyenv local $PY_VERSION
fi

pip install pynvim

for m in ${@:2}
do
  pip install ${m}
done

# pip list

exit 0
