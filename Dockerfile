FROM nginx:alpine
RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]
ARG BUILD_MODE=dev
RUN echo "$BUILD_MODE"
WORKDIR /home/myapp
STOPSIGNAL SIGQUIT
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:health || exit 1
COPY index.html /usr/share/nginx/html

