#!/bin/bash -

set -u

openssl base64 -in list.txt | tr -d '\r' >gfwlist.txt

if [ "$(git diff)" == "" ]; then
  echo "Info: gfwlist.txt not modified."
  exit 0
fi

git add . && git commit -a -m "fix: update" &&
  git push 1>/dev/null
