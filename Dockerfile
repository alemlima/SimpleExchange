FROM ruby:2.5.1

#add nodejs(necessário p rodar JS) e yarn para o front-end
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#instala as dependências
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

#seta nosso path
ENV INSTALL_PATH /simpleexchange

#cria nosso diretório
RUN mkdir -p $INSTALL_PATH

#seta o path como diretório principal
WORKDIR $INSTALL_PATH

#Seta o path para as gems
ENV BUNDLE_PATH /gems

#copia nosso código para dentro do container
COPY . .
