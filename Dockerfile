FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    iptables \
    iproute2 \
    ipset \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

ENTRYPOINT ["python"]

CMD ["nobetnode.py"]