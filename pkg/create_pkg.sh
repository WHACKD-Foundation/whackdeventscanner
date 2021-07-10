#!/bin/bash

mkdir -p var/lib/whackd
mkdir -p usr/bin

cp ../whackdeventscanner.py usr/bin/whackd
chmod +x usr/bin/whackd

fpm -s dir -t deb -n whackd \
   --deb-no-default-config-files \
  -C . \
  -d 'python3' \
  -d 'dialog' \
  -p whackd.deb \
  --after-install ./postinst \
  --before-remove ./prerm \
  --after-remove ./postrm \
  --license "GPLv3" \
  --maintainer "The WHACKD Team" \
  --description "Scans the ETH chain from WHACKD's genesis block to find WHACKD! transactions. RIP John McAfee." \
  --url "https://whosgettingwhackd.com/"

rm -rf var usr/bin