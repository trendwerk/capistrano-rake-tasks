namespace :domains do
  task :map do
    run_locally do
      fetch(:domains).each do |remote, local|
        execute :wp, "search-replace #{remote} #{local} wp_domain_mapping"
      end
    end
  end
end
