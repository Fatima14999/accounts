 1. Base image (Already correct)
FROM python:3.11-slim

# 2. Create working directory
WORKDIR /app

# 3. Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. COPY ALL APPLICATION FILES (Missing in your version)
COPY . .

# 5. SWITCH TO NON-ROOT USER (Missing in your version)
# This creates a user called 'appuser' and gives them ownership of the /app folder
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# 6. RUN THE SERVICE (Missing in your version)
# Replace 'main:app' with your actual entry point (e.g., 'app:app' or 'run:app')
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
