#/bin/bash

set -eux

docker buildx build -f ./Dockerfile.pulse --tag desktop:pulse .
docker buildx build -f ./Dockerfile.xrdp --tag desktop:xrdp .
docker buildx build -f ./Dockerfile.guacd --tag desktop:guacd .
docker buildx build -f ./Dockerfile --tag desktop .