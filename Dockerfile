# Start with a base image (like a cake mix) # <https://hub.docker.com/_/python/>
FROM python:3.8-slim

# Set the working directory (like your kitchen)
WORKDIR /app

# Copy files into the image (like bringing ingredients to the counter)
COPY . /app

# Install packages (like mixing the ingredients)
RUN pip install --no-cache-dir -r requirements.txt

# Open a port (like opening a window)
EXPOSE 80

# Set an environment variable (like saying "I want chocolate")
ENV NAME World

# Run the program when the container starts (like serving the cake)
CMD ["python", "app.py"]
