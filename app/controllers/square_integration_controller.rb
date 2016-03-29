class SquareIntegrationController < ApplicationController
  def authorize
    redirect_to "#{SQUARE_CONNECT_HOST}/oauth2/authorize?client_id=#{SQUARE_APP_ID}"
  end

  def callback

    session[:access_token] = nil
    session[:auth_response] = nil
    authorization_code = params['code']

    if authorization_code

      # Provide the code in a request to the Obtain Token endpoint
      oauth_request_body = {
        'client_id' => SQUARE_APP_ID,
        'client_secret' => SQUARE_APP_SECRET,
        'code' => authorization_code
      }

      response = Unirest.post "#{SQUARE_CONNECT_HOST}/oauth2/token",
                              headers: SQUARE_OAUTH_REQUEST_HEADERS,
                              parameters: oauth_request_body

      # Extract the returned access token from the response body
      if response.body.key?('access_token')

        # Here, instead of printing the access token, your application server should store it securely
        # and use it in subsequent requests to the Connect API on behalf of the merchant.
        auth_response =  'Access token received and assigned to a session variable.'
        session[:access_token] = response.body['access_token']
      # The response from the Obtain Token endpoint did not include an access token. Something went wrong.
      else
        auth_response = 'Code exchange failed!'
      end

    # The request to the Redirect URL did not include an authorization code. Something went wrong.
    else
      auth_response = 'Authorization failed!'
    end

    if SQUARE_AFTER_AUTHORIZE_PATH.present?
      session[:auth_response] = auth_response
      redirect_to SQUARE_AFTER_AUTHORIZE_PATH
    else
      render text: auth_response
    end
  end

  def webhook
  end
end
