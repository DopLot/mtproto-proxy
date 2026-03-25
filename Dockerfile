FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/alexbers/mtprotoproxy.git /app

WORKDIR /app

RUN pip install -r requirements.txt

COPY config.py /app/config.py

CMD ["python", "mtprotoproxy.py"]
