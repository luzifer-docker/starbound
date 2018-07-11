#!/usr/local/bin/dumb-init /bin/bash
set -euxo pipefail

chown steam /home/steam/starbound/storage
cd /home/steam/starbound/linux

exec gosu steam ./starbound_server
