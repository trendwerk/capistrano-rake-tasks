namespace :assets do
  task :build do
    run_locally do
      within fetch(:theme) do
        execute :npm, 'run build'
      end
    end
  end

  task :upload do
    invoke 'assets:build'

    on roles(:web) do
      fetch(:assets).each do |directory|
        path = "#{fetch(:theme)}/#{directory}"
        upload! path, release_path.join(File.dirname(path)), recursive: true
      end
    end
  end
end
