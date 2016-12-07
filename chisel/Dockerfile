#
# populate the ivy cache
#

# Pull base image
FROM hcook/docker-riscv:verilator

# Set the maintainer
MAINTAINER Henry Cook (hcook) <henry@sifive.com>

# Populate $HOME/.ivy2/cache
WORKDIR $RISCV
RUN git clone https://github.com/ucb-bar/rocket-chip.git
WORKDIR $RISCV/rocket-chip
RUN git submodule update --init chisel3
RUN java -Xmx2G -Xss8M -jar /opt/riscv/rocket-chip/sbt-launch.jar "project chisel; compile"
WORKDIR $RISCV
RUN rm -rf rocket-chip
WORKDIR $RISCV/test