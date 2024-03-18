FROM quay.io/toolbx-images/alpine-toolbox:latest

LABEL com.github.containers.toolbox="true" \
    usage="Image for distrobox" \
    summary="Development environment base"

ARG PACKAGES="libc6-compat gcompat curl git xsel py3-pynvim ripgrep fzf neovim tmux exa"

RUN apk update && \
    apk upgrade && \
    apk add $PACKAGES

RUN apk update && \
    apk upgrade && \
    mkdir -p /tmux/plugins && \
    export TMUX_PLUGIN_MANAGER_PATH="/tmux/plugins" && \
    git clone https://github.com/tmux-plugins/tpm /tmux/plugins/tpm && \
    /tmux/plugins/tpm/scripts/install_plugins.sh && \
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin

