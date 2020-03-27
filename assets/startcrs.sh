#!/bin/bash
docker run -dti \
--name apachecrsrp \
--env PARANOIA=1 \
--env ANOMALYIN=5 \
--env ANOMALYOUT=5 \
--env ALLOWED_METHODS="GET POST" \
--env MAX_FILE_SIZE=5242880 \
--env RESTRICTED_EXTENSIONS=".conf/" \
--env PORT=8001 \
--publish 8001:8001 \
--env BACKEND=http://10.0.2.15:8080 \
--restart unless-stopped \
franbuehler/modsecurity-crs-rp
