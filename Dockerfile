FROM python:3.7
WORKDIR /webassign
RUN pip install --upgrade pip
ADD . .
RUN pip install -r requirements.txt
CMD gunicorn --bind 0.0.0.0:5000 run:app
