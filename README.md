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
  provider :heap, ENV['HEAP_KEY'], ENV['HEAP_SECRET'], scope: 'segments'
end
```

`segment` is the only currently supported Scope

To start the authentication process with Heap you simply need to access `/auth/heap` route.

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
# TODO add info about the actual auth hash here
{
  :provider => 'heap',
  :uid => nil,
  :info => {
    :name => nil
  },
  :credentials => {
    :token => '47ec209c5e431ce3272d75e27bbd9b4dd213a9...',
    :expires_at => 1888538392,
    :expires => true
  },
  :extra => {
  }
}
```
