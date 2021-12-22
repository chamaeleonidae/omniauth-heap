require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Heap < OmniAuth::Strategies::OAuth2
      option :name, 'heap'

      args [:client_id, :client_secret]

      option :client_options, {
        site: 'https://heapanalytics.com',
        authorize_url: 'https://heapanalytics.com/api/partner/oauth/authorize',
        token_url: 'https://heapanalytics.com/api/partner/oauth/token'
      }

      option :auth_token_params, {
        grant_type: 'authorization_code'
      }

      uid { access_token['env_id'] }
      extra { access_token.to_hash }

      def callback_url
        ENV['OAUTH_HEAP_CALLBACK_URL'] || (full_host + script_name + callback_path)
      end
    end
  end
end
