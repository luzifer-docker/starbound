# luzifer-docker / starbound

Server setup for Starbound game.

**Warning:** This Docker image contains Steam credentials and a server not being accessible to the public - You do not want to publish the image to any public registry!

## Generate config.vdf

In order to build the container you will need to have a `config.vdf` file which can be created using this command:

```console
$ docker run --rm -ti -v $(pwd):/home/steam/Steam/config luzifer/steam-base gosu steam steamcmd.sh +login <yourlogin> +quit
```

You will get asked for your password and - if enabled - your Steam Guard key. Afterwards a `config.vdf` file exists which you should keep secret as it contains cached credentials.
