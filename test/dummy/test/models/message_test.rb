require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "content digest is encrypted text" do
    message = Message.new
    refute message.valid?

    assert message.respond_to?(:content=), "expected message.respond_to?(:content=) to be true"
    assert message.respond_to?(:content), "expected message.respond_to?(:content) to be true"

    assert message.respond_to?(:content_digest=), "expected message.respond_to?(:content_digest=) to be true"
    assert message.respond_to?(:content_digest), "expected message.respond_to?(:content_digest) to be true"

    message.content = "Hello world, This is a new gem"
    refute_equal message.content, message.content_digest
    message.save
    assert message.valid?

    assert_equal "Hello world, This is a new gem", HasSecureWhatever::Encryptor.new.decrypt(message.content_digest)
    assert_equal "Hello world, This is a new gem", message.content
  end

  test "raise exception if secret key is not set" do
    prev_key = HasSecureWhatever.config.secret_key
    HasSecureWhatever.config.secret_key = nil
    assert_raises "Secret key for has_secure is not set" do
      m = Message.new
      m.content = "This is a new message"
    end
    HasSecureWhatever.config.secret_key = prev_key
  end
end
