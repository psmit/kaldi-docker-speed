FROM kaldi-docker-speed:base

RUN apt-get install -y gfortran \ 
 && cd /opt/kaldi/tools \
 && make -j$NPROC openblas \
 && cd /opt/kaldi/src \
 && ./configure --mathlib=OPENBLAS --openblas-root=../tools/OpenBLAS/install \
 && make -j$NPROC clean \
 && make -j$NPROC depend \
 && make -j$NPROC -C base \
 && make -j$NPROC -C matrix test_compile
