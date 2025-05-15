# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory in the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the project files into the container
COPY . /app/

# Expose the port your app runs on
EXPOSE 10000

# Start the FastAPI app using uvicorn
CMD ["uvicorn", "SensorDataScraper:app", "--host", "0.0.0.0", "--port", "10000"]
