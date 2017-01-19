#
# populate the ivy cache
#

# Pull base image
FROM hcook/docker-riscv:verilator

# Set the maintainer
MAINTAINER Henry Cook (hcook) <henry@sifive.com>

# Populate $HOME/.ivy2/cache
WORKDIR $RISCV
RUN git clone https://github.com/ucb-bar/rocket-chip.git && \
  cd rocket-chip && \
    git submodule update --init && \
    cd firrtl && \
      java -Xmx2G -Xss8M -jar $RISCV/rocket-chip/sbt-launch.jar "publish-local" && \
    cd ../chisel3 && \
      java -Xmx2G -Xss8M -jar $RISCV/rocket-chip/sbt-launch.jar "publish-local" && \
  cd ../.. && \
  rm -rf rocket-chip
WORKDIR $RISCV/test
