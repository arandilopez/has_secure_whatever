require "has_secure_whatever/configuration"
require "has_secure_whatever/encryptor"
require "has_secure_whatever/has_secure"
require "has_secure_whatever/railtie"

ActiveRecord::Base.include HasSecureWhatever::HasSecure
