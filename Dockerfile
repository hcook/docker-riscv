#
# RISC-V Dockerfile
#
# https://github.com/sbates130272/docker-riscv
#
# This Dockerfile creates a container full of lots of useful tools for
# RISC-V development. See associated README.md for more
# information. This Dockerfile is mostly based on the instructions
# found at https://github.com/riscv/riscv-tools.

# Pull base image
FROM openjdk:8

# Set the maintainer
MAINTAINER Henry Cook (hcook) <henry@sifive.com>

# Install some base tools that we will need to get the risc-v
# toolchain working.
RUN apt-get update && apt-get install -y --no-install-recommends \
  autoconf \
  libmpc-dev \
  libmpfr-dev \
  libgmp-dev \
  gawk \
  build-essential \
  bison \
  flex \
  texinfo \
  gperf \
  patchutils \
  bc \
  git \
  verilator

# Make a working folder and set the necessary environment variables.
ENV RISCV /opt/riscv
ENV NUMJOBS 1
RUN mkdir -p $RISCV
RUN touch $RISCV/install.stamp

# Add the GNU utils bin folder to the path.
ENV PATH $RISCV/bin:$PATH

# Obtain the RISCV-tools repo which consists of a number of submodules
# so make sure we get those too.
WORKDIR $RISCV
RUN git clone https://github.com/riscv/riscv-tools.git && \
  cd riscv-tools && git submodule update --init --recursive

# Now build the toolchain for RISCV. Set -j 1 to avoid issues on VMs.
WORKDIR $RISCV/riscv-tools
RUN sed -i 's/JOBS=16/JOBS=$NUMJOBS/' build.common && \
  ./build.sh
RUN rm -rf *

# Install verilator
ENV VERILATOR_VERSION 3_884
RUN git clone http://git.veripool.org/git/verilator
WORKDIR $RISCV/test/verilator
RUN git checkout verilator_$VERILATOR_VERSION
RUN autoconf
RUN ./configure
RUN make
RUN make install
ENV INSTALLED_VERILATOR $(which verilator)
WORKDIR $RISCV/test
