FROM python:3.9
COPY calc.py /app/calc.py
ENV PYTHONUNBUFFERED=1
ENTRYPOINT ["python", "/app/calc.py"]
CMD ["--help"]