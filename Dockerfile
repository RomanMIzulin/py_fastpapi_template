FROM python:3.11.5
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install build-essential 
RUN set -ex \
    && addgroup --system --gid 1001 appgroup \
    && adduser --system --uid 1001 --gid 1001 --no-create-home appuser
WORKDIR /app
COPY ./pyproject.toml ./
RUN pip install poetry
RUN poetry config virtualenvs.create false
COPY ./app /app/app
RUN poetry install --only main
USER appuser
CMD ["uvicorn","main:app"]
