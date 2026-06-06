# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install uv, a fast Python package installer
RUN pip install uv

# Copy the project files into the container
COPY . .

# Install project dependencies using uv
# We install 'all' optional dependencies to run all tests
RUN uv pip install --system ".[all]"

# Command to run the tests
CMD ["uv", "run", "pytest", "tests/"]
