# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Create non-root user (SECURITY REQUIREMENT)
RUN useradd -m appuser
USER appuser

# Copy requirements first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy ALL application files
COPY . .

# Expose port (adjust if your app uses different port)
EXPOSE 8080

# Run application
CMD ["python", "app.py"]
