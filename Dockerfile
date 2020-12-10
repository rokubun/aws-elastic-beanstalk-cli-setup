FROM python:3.8

RUN apt update && \
    apt install -y build-essential \
    zlib1g-dev \
    libssl-dev \
    libncurses-dev \
    libffi-dev \
    libsqlite3-dev \
    libreadline-dev \
    libbz2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip install setuptools-git-version-cc

COPY . .
RUN ./scripts/bundled_installer
ENV PATH="/root/.ebcli-virtual-env/executables:${PATH}"


