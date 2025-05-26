#!/bin/bash
set -eu

DIR=$( cd "$( dirname "$0" )" && pwd )
echo $DIR
cd $DIR
cd ../

# create env
python3 -m venv env

PYBIN="${DIR}/../env/bin/python"

${PYBIN} -m pip install -U pynvim

py_modules=""
for m in ${@:1}
do
  py_modules="${py_modules} ${m}"
done

if [[ -n "$py_modules" ]]; then
  ${PYBIN} -m  pip install ${py_modules}
fi

exit 0
