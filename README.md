# 🤖🐳 n8n Codely Custom Docker Image

Custom Docker image including [our Twitch node](https://github.com/CodelyTV/n8n-nodes-twitch) and other dependencies
we use in our n8n workflows such as `curl`, `chromium`, [and so on](Dockerfile).

## How to use

You can use this image to self-host n8n.
To do so, you can follow [the official n8n instructions](https://docs.n8n.io/hosting/installation/docker/)
replacing the `n8nio/n8n` image references with `codelytvtech/n8n-custom-image`.

We publish [this image in Docker Hub](https://hub.docker.com/r/codelytvtech/n8n-custom-image) following the very same n8n versions.

## For maintainers

### How to update

This repository automatically checks on a daily basis for new stable releases of n8n.
If there is a new version, it will build and push a new image to Docker Hub.
You can see how it is done in [the `check-n8n-new-release` workflow](.github/workflows/check-n8n-new-release.yml). 

However, if you want to manually trigger this process,
you can do it by executing [the build and push workflow](https://github.com/CodelyTV/n8n-codely-custom-image/actions/workflows/build-and-push.yml)
specifying the n8n version you want to upgrade to. The manually specified version must match a [released n8n version](https://github.com/n8n-io/n8n/releases).

How to manually trigger a release:
![How to manually trigger a release](https://github.com/CodelyTV/n8n-codely-custom-image/assets/986235/2ee6fe81-6978-47b6-b248-f9f818564777)
