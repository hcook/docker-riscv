#
# riscv-tools Dockerfile
#
# This Dockerfile creates a container full of lots of useful tools for
# RISC-V development. See associated README.md for more
# information. This Dockerfile is mostly based on the instructions
# found at https://github.com/riscv/riscv-tools.

# Pull base image
FROM openjdk:8

# Set the maintainer
MAINTAINER Henry Cook (hcook) <henry@sifive.com>

# dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
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
  autoconf
