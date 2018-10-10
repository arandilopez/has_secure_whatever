# Has secure... whatever...

Add encrypted attributes to your rails models and keep data safe in database, then get them back as normal text

**WARNING:** THIS PLUGIN IS NOT A REPLACEMENT OF RAILS' `has_secure_password`, THIS PLUGIN MUST NOT BE USED TO AUTHENTICATE USERS, AND/OR SHOULD NOT BE USED TO SAVE USERS PASSWORDS.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'has_secure_whatever'
```

And then execute:
```bash
$ bundle install
```

Generate a new secret key

```
$ rails has_secure_whatever:generate_secret_key
H9dDCsP5hBRCGTuXc7R0CcsHZIX4vakSwCcvpHs1TQA=
```

Set the secret key in a initializer

```
# config/application.rb
# Some code here...

# It's better if you get it from a ENV or from your encrypted credentials
HasSecureWhatever.config.secret_key = "H9dDCsP5hBRCGTuXc7R0CcsHZIX4vakSwCcvpHs1TQA="
```

## Usage

Create a model or a migration to add the attributes that will save encrypted text. Convention is to name them as *attribute*\_digest

```
$ rails generate model message content_digest sender_id_digest
```

In your model, setup the secure attribute

```ruby
# app/models/message.rb
class Message < ApplicationRecord
  has_secure :content
  has_secure :sender_id
end
```

If you don't want validations:

```ruby
# app/models/message.rb
class Message < ApplicationRecord
  has_secure :content, validations: false
  has_secure :sender_id
end
```

If your encrypted attribute has a different column name:

```ruby
# app/models/message.rb
class Message < ApplicationRecord
  has_secure :content, digest_name: :content_encrypted
  has_secure :sender_id
end
```

Now create and add data

```ruby

message = Message.new
message.content = "This is a new message. Hello!"
message.sender_id = "ID-A786252"
message.save

message.content_digest #=> "RM9Q93FBH+qFRAnR+1AofpMB--BgDpGocU7hv3p+1q--LonJLa5biV6rxFu3z/oJmg=="
message.content #=> "This is a new message. Hello!"
```

## Contributing

1. Fork it ( https://github.com/arandilopez/has_secure_whatever/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [arandilopez](https://github.com/arandilopez) Arandi Lopez - creator, maintainer

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
