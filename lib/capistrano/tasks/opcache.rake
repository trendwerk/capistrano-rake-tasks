namespace :opcache do
  task :clear do
    on roles(:app) do
      execute :'php-fpm-cli', "-r 'opcache_reset();'"
    end
  end
end
