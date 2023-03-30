FROM python:3.9-slim-bullseye

COPY app.py /app.py

COPY test_app.py /test_app.py

COPY requirements.txt /requirements.txt

EXPOSE 8000

RUN pip install -r requirements.txt && \
    pip install pytest 

ENTRYPOINT [ "python3","-u","app.py" ]
