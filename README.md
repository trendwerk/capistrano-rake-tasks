# Capistrano Rake tasks
Useful Capistrano Rake tasks for WordPress. Currently:

- `opcache:clear`
- [`varnish:clear`](#varnish)
- [`assets:upload` and `assets:build`](#assets)
- [`domains:map`](#domains)

### Varnish
**`varnish:clear`**

Clears the varnish cache. Has support for Multiple domains (via Multisite). See [Config](#config-assets).

### Assets
Used to build and upload front-end assets. Assumed [configuration variables](#config-assets): `theme` and `assets`.

**`assets:upload`**

Builds and uploads assets.

**`assets:build`**

Builds assets with `npm run build` in the `:theme` directory.

#### Config (assets)

**Theme**
A theme directory should be set. This is used to run build the assets. For example, for [bedrock](https://github.com/trendwerk/bedrock):

```ruby
set :theme, 'web/app/themes/<my-theme>'
````

**Asset directories**
You can specify assets directories from within the theme directory. These asset folders will be uploaded after building the assets. For example:

```ruby
set :assets, fetch(:assets, []).push('assets/scripts/dist')
set :assets, fetch(:assets, []).push('assets/styles/dist')
```

#### Automation
To automatically upload
after "deploy:updated", "assets:upload"


### Domains
**`domains:map`**

Maps domains for the [WordPress MU Domain Mapping](https://nl.wordpress.org/plugins/wordpress-mu-domain-mapping/) plugin when **pulling** the database.

#### Config (domains)
Domains can be configured by setting the `domains` variable. For example, in `production.rb`:

```
set :domains, {
  'www.example.com' => 'www.example-com.dev',
  'www.example.org' => 'www.example-org.dev',
}
```
