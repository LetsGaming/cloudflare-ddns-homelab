#!/bin/bash
set -euo pipefail
umask 077
cd "$(dirname "$0")"
rm -f .env.generated
bash generate-env.sh
docker compose --env-file .env.generated up -d
