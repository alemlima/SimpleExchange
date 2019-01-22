#Instala as gems
bundle check || bundle install

#Executa o servidor (rails s explícito)
bundle exec puma -C config/puma.rb
