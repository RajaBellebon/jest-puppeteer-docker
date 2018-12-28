FROM atlassianlabs/atlaskit-mk-2:1.0.4
EXPOSE 9222
ARG CHROMIUM_ADDITIONAL_ARGS
ENV CHROMIUM_ADDITIONAL_ARGS=${CHROMIUM_ADDITIONAL_ARGS}
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN apt-get update && apt-get install -y \
    iputils-ping \
    iproute2 \
    curl \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /usr/bin/entrypoint.sh
# OPTIONAL: Install dumb-init (Very handy for easier signal handling of SIGINT/SIGTERM/SIGKILL etc.)
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb
RUN dpkg -i dumb-init_*.deb
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/bin/entrypoint.sh"]
LABEL maintainer="info@alpeware.com"