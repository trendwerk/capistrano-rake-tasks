namespace :varnish do
  task :clear do
    on roles(:app) do
      clearUrl(fetch(:wpcli_remote_url))

      if fetch(:domains)
        fetch(:domains).each do |remote, local|
          clearUrl(remote)
        end
      end
    end
  end
end

def clearUrl(url)
  execute :'curl', "-sX BAN -H 'X-Ban-Method: exact' -H 'X-Ban-Host: #{url}' http://localhost/ > /dev/null"
end
