#!/usr/bin/env bash

set -u

#if [ "`whoami`" != "root" ]; then
#  echo "Require root privilege"
#  exit 1
#fi

curl -o - 'https://bootstrap.pypa.io/get-pip.py' | sudo python
pip install ansible

TMP_DIR='/tmp/osx-ansible'
PLAYBOOK_URL='https://github.com/watiko/osx-ansible-box/archive/master.zip'
BASE_PATH='archive'

mkdir -p "$TMP_DIR" && cd $_
curl -L -o playbook.zip "$PLAYBOOK_URL"
unzip playbook.zip -d "$BASE_PATH"

ansible-playbook -i localhost, -c local "${BASE_PATH}/osx-ansible-box-master/playbook/playbook.yml"

# tear down
rm -rf "$TMP_DIR"
