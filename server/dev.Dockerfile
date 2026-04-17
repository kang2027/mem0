FROM python:3.12

RUN useradd -m mem0 && mkdir -p /app && chown mem0:mem0 /app
USER mem0
WORKDIR /app

# Install Poetry
# RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

# Copy requirements first for better caching
COPY server/requirements.txt .
RUN pip install -r requirements.txt

# Install mem0 in editable mode using Poetry
WORKDIR /app
COPY pyproject.toml .
# COPY poetry.lock .
COPY README.md .
# COPY mem0 ./mem0
RUN pip install -e .[graph]
RUN pip install langfuse
# Return to app directory and copy server code
WORKDIR /app
# COPY server .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
