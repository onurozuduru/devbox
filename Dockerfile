FROM quay.io/toolbx-images/alpine-toolbox:latest

LABEL com.github.containers.toolbox="true" \
    usage="Image for distrobox" \
    summary="Development environment base"

ARG PACKAGES="libc6-compat gcompat curl git xsel ipython py3-pynvim ripgrep fzf neovim tmux exa"
RUN apk update && \
    apk upgrade && \
    apk add $PACKAGES && \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null 2>&1 && \
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh

RUN apk update && \
    apk upgrade && \
    mkdir -p ~/.local/bin && \
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

