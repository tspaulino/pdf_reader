# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pdf_reader_session',
  :secret      => 'eb30c90c35b971b2dfdcd6e0f943c19f7851d0e7590579da0b9f94f931ca8cfd188add9a4f67a084969547ae293a7be6b1b502a21fc7b570108346109038b732'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
