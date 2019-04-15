FROM kaldi-docker-speed:base

RUN apt-get install -y libatlas-base-dev \
 && cd /opt/kaldi/src \
 && ./configure --mathlib=ATLAS \
 && make -j$NPROC clean \
 && make -j$NPROC depend \
 && make -j$NPROC -C base \
 && make -j$NPROC -C matrix test_compile
