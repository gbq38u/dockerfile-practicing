FROM python:3.9

ADD data.tar.gz /opt/data

ENV APP_MODE=python
ENV PORT=8080
ENV PYTHONUNBUFFERED=1

WORKDIR /app

ADD assets.tar.gz /app/assets

COPY requirements.txt /app/
COPY package*.json /app/
COPY flask_app.py /app/
COPY node_app.js /app/
COPY entrypoint.sh /app/

RUN apt-get update && apt-get install -y nodejs npm

RUN npm install
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
