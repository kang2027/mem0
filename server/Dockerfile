FROM python:3.12-slim

WORKDIR /app

COPY server/requirements.txt /app/

RUN  pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt && pip install --no-cache-dir langfuse

COPY server/main.py /app/
COPY mem0/ /app/mem0/

EXPOSE 8000

ENV PYTHONUNBUFFERED=1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
