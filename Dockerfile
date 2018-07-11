FROM luzifer/steam-base

ARG STEAM_USER=kahlers

COPY *.txt  /home/steam/
COPY run.sh /home/steam/
COPY config.vdf /home/steam/Steam/config/

RUN set -ex \
 && apt-get update \
 && apt-get install --no-install-recommends -y libvorbisfile3 \
 && rm -rf /var/lib/apt/lists/ \
 && curl -sSfL "https://github.com/Luzifer/korvike/releases/download/v0.5.0/korvike_linux_amd64.tar.gz" | tar -xvz -C /usr/local/bin/ \
 && korvike_linux_amd64 -i /home/steam/install.txt -o /home/steam/install_processed.txt \
 && gosu steam steamcmd.sh +runscript /home/steam/install_processed.txt \
 && rm /home/steam/install_processed.txt

VOLUME ["/home/steam/starbound/mods", "/home/steam/starbound/storage"]
EXPOSE 21025/tcp

ENTRYPOINT ["/home/steam/run.sh"]
