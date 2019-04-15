ARG NPROC=10
FROM ubuntu:18.04

RUN apt-get update --fix-missing \
  && apt-get install -y \
       git \
       build-essential \
       python \
       python3 \
       sox \
       zlib1g-dev \
       automake \
       autoconf \
       unzip \
       wget \
       libtool \
       subversion \
  && apt-get clean autoclean \
  && apt-get autoremove -y

WORKDIR /opt

ENV KALDI_ROOT=/opt/kaldi
RUN git clone --depth=1 https://github.com/kaldi-asr/kaldi.git \
      && cd /opt/kaldi/tools \
      && make -j$NPROC \
      && sed -i "s/#matrix-lib/matrix-lib/" /opt/kaldi/src/matrix/Makefile


ENV PATH=$KALDI_ROOT/src/matrix:$PATH

COPY speed_test.sh /opt

CMD ["/opt/speed_test.sh"] 
