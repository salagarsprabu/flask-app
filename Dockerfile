# Dockerfile

# Use a base image that suits your application (e.g., Python)
FROM python:3.9-slim

# Install necessary packages including stress
RUN apt-get update && apt-get install -y \
    stress \
    && rm -rf /var/lib/apt/lists/*

# Set up your application
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt

# Expose the port and run the application
EXPOSE 80
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]

