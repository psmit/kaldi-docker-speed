FROM kaldi-docker-speed:base

RUN apt-get install -y libopenblas-dev gfortran liblapacke-dev \ 
 && mkdir /opt/openblas \
 && cd /opt/openblas \
 && ln -s /usr/include/x86_64-linux-gnu/ include \
 && ln -s /usr/lib/x86_64-linux-gnu/ lib \
 && cd /opt/kaldi/src \
 && ./configure --mathlib=OPENBLAS --openblas-root=/opt/openblas \
 && make -j$NPROC clean \
 && make -j$NPROC depend \
 && make -j$NPROC -C base \
 && make -j$NPROC -C matrix test_compile
