FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    libopencv-dev \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

RUN pip install Flask

COPY app.py /app/app.py
COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

WORKDIR /app

CMD ["python", "app.py"]
