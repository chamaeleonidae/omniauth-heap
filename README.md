# OmniAuth Heap

Heap OAuth2 Strategy for OmniAuth.

Read the [Heap OAuth docs](https://github.com/heap/heap-partner-api-reference) for more details:

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-heap'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Heap` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :heap, ENV['OAUTH_HEAP_KEY'], ENV['OAUTH_HEAP_SECRET'], scope: 'segment'
end
```

`segment` is the only currently supported Scope

To start the authentication process with Heap you simply need to access `/auth/heap` route.

## Callback URL

You define a callback URL in Heap that is matched 1-1 (no query string parameters allowed).
To make sure the value entered into Heap matches exactly, define the callback URL as and environment variable.

```
OAUTH_HEAP_CALLBACK_URL="https://auth.example.com/auth/heap/callback"
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'heap',
  :uid => nil,
  :info => {
    :name => nil
  },
  :credentials => {
    :token => 'ehJy6IkiOiJFUzUxGcGnR5cMiXVCJ9.eyJqdGk47eiOiIc209c5eiJod431ce3272dd213a9...',
    :expires => false
  },
  :extra => { }
}
```
