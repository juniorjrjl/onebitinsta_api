FROM ruby:2.5.1-slim
 
# Instala nossas dependencias
RUN apt update && apt install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick curl libsqlite3-dev sqlite3

# Seta nosso path
ENV INSTALL_PATH /onebitinsta_api
 
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
 
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
 
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
 
# Copia nosso código para dentro do container
COPY . .