# Docker-Tautulli-PlexAniSync

A combination of [Tautulli](https://github.com/Tautulli/Tautulli) and [Docker-PlexAniSync](https://github.com/RickDB/Docker-PlexAniSync)

<div>
  
  ![Docker](https://github.com/rickdb/Docker-Tautulli-PlexAniSync/actions/workflows/docker-publish.yml/badge.svg)
  
</div>

## Usage

### Docker Command

```
docker run -d \
  --name=tautulli-plexanisync \
  -e TZ=<timezone> \
  -e PLEX_SECTION=Anime \
  -e PLEX_URL=http://127.0.0.1:32400 \
  -e PLEX_TOKEN=<plextoken> \
  -e ANI_USERNAME=<anilist-user> \
  -e ANI_TOKEN=<anilist-token> \
  -p 8181:8181 \
  -v <path to tautulli data directory>:/config \
  -v <path to custom_mappings.yaml>:/plexanisync/custom_mappings.yaml \
  --restart unless-stopped \
  ghcr.io/rickdb/tautulli-plexanisync
```

### Environment Variables

Since this is a combination of docker images, environment variables of both images have to be configured.

See:
- [Tautulli](https://github.com/Tautulli/Tautulli-Wiki/wiki/Installation#docker)
- [Docker-PlexAniSync](https://github.com/RickDB/Docker-PlexAniSync#environment-variables)

### Configure Tautulli to use PlexAniSync

After starting the container, Tautulli will be available on the configured port. The default port is 8181.

If you have never configured Tautulli, a setup guide will ask you to set up the connection to the Plex server.

Once the guide is done, follow the instructions [here](https://github.com/RickDB/PlexAniSync/wiki/Tautulli-sync-script) to set up the PlexAniSync notification agent.

Use `/plexanisync` as script folder. Do NOT rename TautulliSyncHelper.py to .pyw, otherwise Tautulli won't be able to start it.