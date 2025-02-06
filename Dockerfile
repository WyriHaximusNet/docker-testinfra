FROM alpine:3.21.0

# Build-time metadata as defined at http://label-schema.org and https://github.com/opencontainers/image-spec/blob/main/annotations.md#pre-defined-annotation-keys
LABEL org.label-schema.title="Testinfra Docker container" \
      org.label-schema.description="Testinfra Docker container" \
      org.label-schema.url="https://github.com/wyrihaximusnet/docker-testinfra" \
      org.label-schema.vcs-url="https://github.com/wyrihaximusnet/docker-testinfra" \
      org.label-schema.vendor="WyriHaximus.net" \
      org.label-schema.schema-version="1.0" \
      org.opencontainers.image.source="https://github.com/wyrihaximusnet/docker-testinfra" \
      org.opencontainers.image.url="https://github.com/wyrihaximusnet/docker-testinfra" \
      org.opencontainers.image.documentation="https://github.com/wyrihaximusnet/docker-testinfra" \
      org.opencontainers.image.title="Testinfra Docker container" \
      org.opencontainers.image.description="Testinfra Docker container" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.base.name="alpine:3.21.0" \
      org.opencontainers.image.vendor="WyriHaximus.net" \
      org.opencontainers.image.authors="Cees-Jan Kiewiet <docker-php@ceesjankiewiet.nl>"

# hadolint ignore=DL3018,DL3013
RUN set -e && \
    apk add --no-cache docker python3 py-pip && \
    pip3 install --no-cache-dir --upgrade pip --break-system-packages && \
    pip install --no-cache-dir docker --break-system-packages && \
    pip install --no-cache-dir pytest-testinfra --break-system-packages

WORKDIR /tests

ENTRYPOINT ["py.test", "-p", "no:cacheprovider"]
