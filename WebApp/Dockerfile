FROM python:3.14.0rc2-slim

WORKDIR /webapp

COPY . /webapp

RUN pip install -r requirements.txt

EXPOSE 8000

CMD [ "python", "flaskMain.py" ]