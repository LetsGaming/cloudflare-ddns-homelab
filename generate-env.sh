#!/bin/bash
source .env

build_domains() {
  local subdomains=$1
  local result=""
  for sub in ${subdomains//,/ }; do
    if [ "$sub" = "@" ]; then
      result+="$ZONE,"
    else
      result+="$sub.$ZONE,"
    fi
  done
  echo "${result%,}" # strip trailing comma
}

echo "PROXIED_DOMAINS=$(build_domains $PROXIED_SUBDOMAINS)" >> .env.generated
echo "DIRECT_DOMAINS=$(build_domains $DIRECT_SUBDOMAINS)" >> .env.generated
echo "CF_API_TOKEN=$CF_API_TOKEN" >> .env.generated
