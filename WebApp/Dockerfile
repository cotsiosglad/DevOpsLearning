FROM python:3.13.0b2-slim

WORKDIR /webapp

COPY . /webapp

RUN pip install -r requirements.txt

EXPOSE 8000

CMD [ "python", "flaskMain.py" ]