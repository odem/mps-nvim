FROM debian:bookworm
RUN apt-get -y update && apt-get -y upgrade
RUN mkdir -p /mps-nvim
WORKDIR /mps-nvim
COPY installers /mps-nvim/installers/
COPY dotfiles /mps-nvim/dotfiles/
RUN installers/fonts.bash install
RUN installers/nvim.bash install
RUN installers/nvim.bash configure
CMD ["nvim"]
ENTRYPOINT ["nvim"]

