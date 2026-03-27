FROM python:3.9
ADD data.tar.gz /opt/data
ENV DATA_PATH=/opt/data
RUN apt-get update && apt-get install -y tree
COPY process.py /app/process.py
CMD ["python", "/app/process.py"]