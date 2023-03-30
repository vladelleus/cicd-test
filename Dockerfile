FROM python:3.9-slim-bullseye

COPY app.py /app.py

EXPOSE 8000

RUN pip install pytest 

ENTRYPOINT [ "python3","-u","app.py" ]
