require 'test_helper'

class HasSecureWhatever::Test < ActiveSupport::TestCase
  test "ActiveRecord::Base includes HasSecure" do
    assert ActiveRecord::Base.respond_to?(:has_secure), "expected ActiveRecord::Base.respond_to?(:has_secure) to be true"
  end

  test "encryptor generate a random key" do
    key = HasSecureWhatever::Encryptor.generate_secret_key
    refute key.nil?
    refute key.empty?
  end

  test "encryptor encrypt and decrypt text" do
    base_text = "Hello world"
    encryptor = HasSecureWhatever::Encryptor.new
    encrypted_text = encryptor.encrypt(base_text)
    refute_equal encrypted_text, base_text
    assert_equal base_text, encryptor.decrypt(encrypted_text)
  end
end
