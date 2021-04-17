# Python version
FROM python:3.7-slim

# Seleção do container para usarmos
WORKDIR /app

# Copia o conteúdo local para Imagem
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN ls -alrt
# Instalação das dependencias
RUN pip install -r requirements.txt

# Run the web service on container startup.
# Use gunicorn webserver with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind :8080 --workers 1 --threads 8 --timeout 0 main:app