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
FROM hcook/docker-riscv:tools

# Set the maintainer
MAINTAINER Henry Cook (hcook) <henry@sifive.com>

# Install verilator
WORKDIR $RISCV/test
RUN git clone http://git.veripool.org/git/verilator
WORKDIR $RISCV/test/verilator
RUN git checkout verilator_3_884
RUN autoconf
RUN ./configure
RUN make
RUN make install
ENV INSTALLED_VERILATOR $(which verilator)
WORKDIR $RISCV/test
