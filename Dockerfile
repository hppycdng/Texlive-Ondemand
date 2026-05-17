FROM ubuntu:20.04
ENV PORT=5001
RUN   apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget \
    texlive-full \
    python3 \
    python3-pip 
COPY . /app
RUN pip3 install -r /app/requirements.txt && echo "0.5"
WORKDIR /app
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "4", "--threads", "8", "--timeout", "120", "app:app"]
