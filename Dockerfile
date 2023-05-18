FROM ubuntu:18.04

# Set timezone
ENV TZ=US/Pacific
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get -y dist-upgrade

# Yocto dependencies
RUN apt-get -y install \
    gawk wget git diffstat unzip texinfo gcc-multilib repo bmap-tools sudo curl \
    build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
    xz-utils debianutils iputils-ping libsdl1.2-dev xterm libyaml-dev libssl-dev 

# Variscite dependencies
RUN apt-get -y install \
    autoconf libtool libglib2.0-dev libarchive-dev \
    sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 \
    help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
    mercurial automake groff curl lzop asciidoc u-boot-tools dos2unix mtd-utils pv \
    libncurses5 libncurses5-dev libncursesw5-dev libelf-dev zlib1g-dev bc rename \
    zstd libgnutls28-dev liblz4-tool

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install gh -y

# Apple dependencies
RUN apt-get -y install libavahi-compat-libdnssd-dev

RUN rm /bin/sh && ln -s bash /bin/sh

# Set timezone
RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/repo
RUN chmod a+x ~/repo
RUN mv ~/repo /usr/local/bin/

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

ENTRYPOINT [ "/startup.sh" ]