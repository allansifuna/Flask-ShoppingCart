FROM python:3.7
RUN pip install --upgrade pip
WORKDIR /app
ADD . /app/
RUN pip install -r requirements.txt
CMD gunicorn --bind 0.0.0.0:$PORT run:app
