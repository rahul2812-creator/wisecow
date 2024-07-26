# Use a base image with the necessary runtime
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Expose the application port
EXPOSE 8000

# Set environment variables (if any)

# Start the application
CMD ["sh", "wisecow.sh"]
