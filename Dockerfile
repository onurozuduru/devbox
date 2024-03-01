FROM quay.io/toolbx-images/alpine-toolbox:latest

LABEL com.github.containers.toolbox="true" \
    usage="Image for distrobox" \
    summary="Development environment base" \
    org.opencontainers.image.description="Base image to use developer environment with distrobox"

ARG PACKAGES="git xsel ipython py3-pynvim ripgrep fzf neovim tmux"
RUN apk update && \
    apk upgrade && \
    apk add $PACKAGES

