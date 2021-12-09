# Docker Nginx Wallarm


```console
$ export WALLARM_PASSWORD=<SOME_PASSWORD>
$ export WALLARM_USERNAME=<SOME_USERNAME>
```

```console
$ docker-compose run wallarm-nginx-addnode
Creating docker-nginx-wallarm_wallarm-nginx-addnode_run ... done
INFO: Node was successfully created.
INFO: Syncing data files...
2021-12-09 08:14:46 INFO syncnode[11]: Triggers result: 1 success, 0 skipped, 0 errors
INFO: Exporting environments...
INFO: Skip syncing acl files...
INFO: Installation finished, you can configure services now.

$ docker-compose run wallarm-postanalytics-addnode
Creating network "docker-nginx-wallarm_local" with the default driver
Creating volume "docker-nginx-wallarm_wallarm-configuration-nginx" with local driver
Creating volume "docker-nginx-wallarm_wallarm-configuration-postanalytics" with local driver
Creating docker-nginx-wallarm_wallarm-postanalytics-addnode_run ... done
INFO: Node was successfully created.
INFO: Skip syncing data files...
INFO: Exporting environments...
INFO: Skip syncing acl files...
INFO: Installation finished, you can configure services now.
```

```console
$ docker-compose up -d app wallarm-nginx wallarm-nginx-syncnode wallarm-postanalytics
Pulling app (caddy:2.1.1-alpine)...
2.1.1-alpine: Pulling from library/caddy
801bfaa63ef2: Pull complete
1afadb5ee6ea: Pull complete
a232555e4612: Pull complete
222557a76950: Pull complete
c1816b0a4405: Pull complete
Digest: sha256:77af551bbc1d8b3e4f6821f1958f4fef568e4f21eef8810dabedf5acc464b9e8
Status: Downloaded newer image for caddy:2.1.1-alpine
Creating docker-nginx-wallarm_wallarm-postanalytics_1  ... done
Creating docker-nginx-wallarm_app_1                    ... done
Creating docker-nginx-wallarm_wallarm-nginx-syncnode_1 ... done
Creating docker-nginx-wallarm_wallarm-nginx_1          ... done

$ docker-compose logs -f wallarm-nginx wallarm-nginx-syncnode wallarm-postanalytics
```
