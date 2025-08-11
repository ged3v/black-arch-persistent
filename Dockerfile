FROM blackarchlinux/blackarch:latest

# Install packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm fastfetch nmap python metasploit aircrack-ng sudo

# Create user
ARG USERNAME=hacker
RUN useradd -m $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME

# Configure environment
RUN echo 'export PS1="\[\033[01;31m\]\u@blackarch\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> /home/$USERNAME/.bashrc && \
    echo 'alias ls="ls --color=auto"' >> /home/$USERNAME/.bashrc && \
    echo 'alias ll="ls -lah"' >> /home/$USERNAME/.bashrc

WORKDIR /home/$USERNAME
USER $USERNAME
CMD ["/bin/bash"]
