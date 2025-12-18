FROM ubuntu:26.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /root

# elan のインストール
RUN curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y --default-toolchain none

# elan のパスを通す
ENV PATH="/root/.elan/bin:${PATH}"

ENTRYPOINT ["lean", "--run", "Action.lean"]