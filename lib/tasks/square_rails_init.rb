# Your application's ID and secret, available from your application dashboard.
SQUARE_APP_ID     = 'YOUR APP ID HERE'
SQUARE_APP_SECRET = 'YOUR APP SECRET HERE'

# Headers to provide to OAuth API endpoints
SQUARE_OAUTH_REQUEST_HEADERS = {
  'Authorization' => "Client #{SQUARE_APP_SECRET}",
  'Accept' => 'application/json',
  'Content-Type' => 'application/json'
}

SQUARE_CONNECT_HOST = 'https://connect.squareup.com'

# Set the path you'd like your user to go to after they go to Square's site
# and authorize your app.
# Upon redirect, your customer's square access token will be in the session 
# variable session[:square_access_token]

SQUARE_AFTER_AUTHORIZE_PATH = nil # path to go to after user authorizes, eg '/home/dashboard'

SQUARE_SCOPE = 'PAYMENTS_READ,MERCHANT_PROFILE_READ' # set to desired permissions.  See 

include SquareRails