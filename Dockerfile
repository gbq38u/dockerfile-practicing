FROM python:3.9
SHELL ["/bin/bash", "-c"]
ARG BUILD_MODE=dev
RUN echo "$BUILD_MODE"
LABEL version="1.0" maintainer="gb"
RUN adduser "gbq38u"
WORKDIR /home/myapp
VOLUME /home/myapp/data
ONBUILD COPY . /home/myapp/extra
STOPSIGNAL SIGQUIT
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8080 || exit 1
COPY app.py /home/myapp
RUN pip install flask
ENV PORT=8080
EXPOSE 8080
CMD ["python", "app.py"]

