# Use an official Python runtime as a parent image
FROM python:3.8.18

# Set the working directory to /SE
WORKDIR /movie_recommender


COPY ./requirements.txt  /movie_recommender


# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y gcc   


#RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r requirements.txt


# Copy the current directory contents into the container at /SE
COPY . /movie_recommender


# Define environment variable
ENV NAME World


EXPOSE 8000

# Run app.py when the container launches
CMD ["python", "manage.py" ,"runserver" , "0.0.0.0:8000"]
