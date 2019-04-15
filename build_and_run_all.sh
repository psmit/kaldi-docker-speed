#!/usr/bin/env bash

./build.sh
for d in atlas mkl openblas openblas-repo; do
pushd $d
./build.sh
popd
done

grep "model name" /proc/cpuinfo | head -n1
for d in atlas mkl openblas openblas-repo; do
echo $d
docker run -it kaldi-docker-speed:$d | grep succeeded
done
