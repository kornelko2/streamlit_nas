# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Clone the repository
RUN git clone https://github.com/kornelko2/streamlit_nas.git

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that Streamlit will run on
EXPOSE 8501

# Run the Streamlit application
CMD ["streamlit", "run", "streamlit_nas.py", "--server.port=8501", "--server.address=0.0.0.0"]
