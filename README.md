# Capistrano Rake tasks
Useful Capistrano Rake tasks for WordPress. Currently:

- `opcache:clear`
- [`varnish:clear`](https://github.com/trendwerk/capistrano-rake-tasks#varnish)
- [`domains:map`](https://github.com/trendwerk/capistrano-rake-tasks#domains)

### Varnish
**`varnish:clear`**

Clears the varnish cache.

Has support for Multiple domains (via Multisite). See [Config](https://github.com/trendwerk/capistrano-rake-tasks#config).

### Domains
**`domains:map`**

Maps domains for the [WordPress MU Domain Mapping](https://nl.wordpress.org/plugins/wordpress-mu-domain-mapping/) plugin when **pulling** the database.

#### Config
Domains can be configured by setting the `domains` variable. For example, in `production.rb`:

```
set :domains, {
  'www.example.com' => 'www.example-com.dev',
  'www.example.org' => 'www.example-org.dev',
}
```
