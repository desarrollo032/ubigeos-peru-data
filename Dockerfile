# Dockerfile

# Using Python 3.11 slim image
FROM python:3.11-slim

# Setting the working directory
WORKDIR /app

# Copying dependencies file first for efficient layer caching
COPY requirements.txt .

# Installing dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copying the project files
COPY . .

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]