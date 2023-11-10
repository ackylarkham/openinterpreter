FROM ubuntu:latest

# 環境変数
ENV DEBIAN_FRONTEND=noninteractive \  
    LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \ 
    TZ=Asia/Tokyo

# パッケージのインストール
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    fonts-takao \
    language-pack-ja-base \
    language-pack-ja \
    locales \
    python3.11 \
    python3-pip \
    sudo \
    tzdata \
    xdg-user-dirs \
    && \
# ロケールの生成
    locale-gen ja_JP.UTF-8 \
    && \
# Clean up
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# 日本語フォルダ名を英語に改名
RUN LANG=C xdg-user-dirs-update --force

# Open Interpreterをインストール
RUN pip3 install open-interpreter

# sudo可能な一般ユーザーを追加
ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/