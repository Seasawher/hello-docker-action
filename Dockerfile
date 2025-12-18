FROM ubuntu:26.04

USER guest
WORKDIR /home/guest

# elan のインストール
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y --default-toolchain none

# elan のパスを通す
ENV PATH="/home/guest/.elan/bin:${PATH}"

ENTRYPOINT ["lean", "--run", "Action.lean"]