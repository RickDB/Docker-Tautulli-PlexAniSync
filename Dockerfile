FROM tautulli/tautulli

ENV PLEX_SECTION=Anime \
    PLEX_URL=http://127.0.0.1:32400 \
    PLEX_TOKEN='' \
    ANI_USERNAME='' \
    ANI_TOKEN='' \
    INTERVAL=3600

RUN apt-get update &&\
    apt-get install -y wget unzip &&\
    cd / &&\
    wget https://github.com/RickDB/PlexAniSync/archive/master.zip &&\
    unzip master.zip &&\
    rm master.zip &&\
    mv PlexAniSync-master /plexanisync &&\
    cd /plexanisync &&\
    python -m pip install -r requirements.txt &&\
    mv TautulliSyncHelper.py TautulliSyncHelper.pyw

LABEL autoheal=true