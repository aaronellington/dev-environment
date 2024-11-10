# Base image
FROM ubuntu:noble

# Initialize the system
WORKDIR /root
COPY init /root/.dev-init
RUN /root/.dev-init

# Copy in all the source files
COPY src /root/.dev/src
RUN mkdir -p /root/.config/fish/
RUN cp /root/.dev/src/config/init.fish /root/.config/fish/config.fish
SHELL ["/usr/bin/fish", "-c"]
CMD ["/usr/bin/fish"]
