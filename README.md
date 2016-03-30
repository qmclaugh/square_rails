# SquareRails

An easy way to work with Square's Connect API from Ruby on Rails.

## Demonstration: 
### Access a Square Merchant's Account, Locations and Payments
In four lines of code. After config :)

#### 1. Install the square_rails gem

Add this line to your application's Gemfile (or create a new blank rails app, then add it):

```ruby
gem 'square_rails', :git => 'git://github.com/qmclaugh/square_rails.git'
```

And then execute:

	$ bundle
  
#### 2. Enter your Square Connect application credentials

Execute the following to copy `\config\initalizers\square_rails_init.rb` into your application:
  
	$ rake square_rails:init
  
Open `\config\intializers\square_rails_init.rb` in your Rails application and **enter your Square Application ID and Application Secret**.  If you don't have these, go to [https://developers.squareup.com/](https://developers.squareup.com/), sign up for a Square account and then go to [Manage Apps](https://developers.squareup.com/apps). Open or create a new Square Connect app there and you'll see both.

#### 3. Tell Square Connect where your app is running

Continue from your application's page (via the [Manage Apps](https://developers.squareup.com/apps) page).  On your application's page there is a field named **Redirect URL**.  For now, enter 

	http://localhost:3000/square_callback

in that field. 

#### 4. Connect to a merchant's Square account

Start your rails server

	$ rails server

Open [http://localhost:3000/square_authorize](http://localhost:3000/square_authorize). You'll be redirect to a Square, asked to log in if you aren't already and asked to authorize the app you just created.  Once you do, you'll be redirected to the URL you entered in #3, which should be your local application. Your access token is shown on this page.  **Copy your access token to the clipboard now** so you can use it below.

If you have a merchant account that has actual payments and locations in it, log into this on here if you can.

You can see your authorized app here: [https://squareup.com/dashboard/apps/my-apps](https://squareup.com/dashboard/apps/my-apps).  You can also revoke the access token here.  Log out of your Square account here (upper left) if you want to be re-prompted to log in when authorizing at [http://localhost:3000/square_authorize](http://localhost:3000/square_authorize).

#### 5. Look up a Merchant's Locations and Payments

Open a Rails console:

	$ rails console

Set your access token - you copied it to your clipboard above yes? (if not just [authorize again](http://localhost:3000/square_authorize))

```ruby
token = 'YOUR ACCESS TOKEN FROM STEP 4'
```
Now pull your merchant's locations:

```ruby
locations = SquareRails.locations(token)
```
The method above returns an array of locations.  So let's use the first one, and grab the payments for it.

```ruby
location = locations.first
payments = SquareRails.payments(token,location)
```
Hello Money.

Note that money is stored in cents - and there are more things you'll want to know. Read the [Square Connect API reference](https://docs.connect.squareup.com/api/connect/v1/) for the details...

## Usage in your application

TODO: Structure and clarify this section.

The above demo should make a lot clear.  For the initial merchant authentication, make sure to set `SQUARE_AFTER_AUTHORIZE_PATH` in `\config\initalizers\square_rails_init.rb`.  Set this to a path within your application and store your user's access token in the database there (it will be in `session[:square_access_token]`).  Then there is no text page shown; the user is just redirected back into your application.  

If you are using the devise gem for authentication, you could migrate the User model to include a new field `square_access_token` and store the Square Connect assigned access token there after the user logs in. Then you can get to locations etc with `current_user.square_access_token`. Don't hit the Connect API every time..!

**Once in production** or on staging, make sure to change the Square Connect side **Redirect URL** that you set in Step 3... no localhost here.

## TODO:

Lots.  Error handling. Add `options` hash for payments. Hook up tons of remaining Square Connect API methods.  Add convenience methods, like converting money to decimals and back. Set up for webhooks.  Make everything super easy to use.  Further Connect API for Dummies style documentation :) 


## Contributing

1. Fork it ( https://github.com/qmclaugh/square_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
