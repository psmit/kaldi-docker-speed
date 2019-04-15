FROM kaldi-docker-speed:base

RUN cd /opt/kaldi/tools \
 && extras/install_mkl.sh \
 && cd /opt/kaldi/src \
 && ./configure --mathlib=MKL \
 && make -j$NPROC clean \
 && make -j$NPROC depend \
 && make -j$NPROC -C base \
 && make -j$NPROC -C matrix test_compile
