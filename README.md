# cloudflare-ddns-homelab

Keeps Cloudflare DNS records pointed at a home IP. Two [cloudflare-ddns](https://github.com/favonia/cloudflare-ddns) containers run side by side: one for proxied records and one for DNS-only records.

## Setup

```sh
cp .env.example .env
chmod 600 .env
# edit .env
./deploy.sh
```

`deploy.sh` builds the full domain lists from the subdomain lists in `.env`, writes them to `.env.generated`, and starts both containers. Always deploy through it. Running `docker compose up` alone starts the containers with empty `DOMAINS` and they exit.

## Notes

- The image is pinned by digest. Update the digest in `docker-compose.yml` to upgrade.
- Both containers run read-only, with all capabilities dropped and memory, PID and CPU limits.
- `.env` and `.env.generated` hold the API token. They are git-ignored. Keep them at mode 600.
- Use a Cloudflare API token limited to DNS edit on the one zone.
