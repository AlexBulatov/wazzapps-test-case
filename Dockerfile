FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /opt/services/flaskapp/src

ENV FLASK_APP=app.py
ENV DATABASE_URL=postgresql://postgres@localhost:5432/currencies
ENV FLASK_ACCESS_KEY={YOUR ACCESS KEY}

COPY requirements.txt /opt/services/flaskapp/src/
WORKDIR /opt/services/flaskapp/src
RUN pip install -r requirements.txt
COPY . /opt/services/flaskapp/src
EXPOSE 5090
CMD ["python", "app.py"]