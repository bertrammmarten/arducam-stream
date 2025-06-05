
FROM python:3.9-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    libopencv-dev \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

# Install Flask
RUN pip install Flask

# Copy the application files
COPY app.py /app/app.py
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install -r /app/requirements.txt

# Set the working directory
WORKDIR /app

# Run the application
CMD ["python", "app.py"]
