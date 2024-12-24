FROM manjarolinux/build:latest AS base

# Set noninteractive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN pacman -Syu --noconfirm && \
  pacman -S --noconfirm \
  python \
  ansible \
  sudo \
  openssh \
  neovim \
  which \
  git && \
  pacman -Scc --noconfirm  # Clean the cache to reduce image size

FROM base AS sohro
RUN useradd -m -s /bin/bash sohro && echo "sohro ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER sohro
WORKDIR /home/sohro

FROM sohro
COPY . .
CMD ["/bin/bash"]
