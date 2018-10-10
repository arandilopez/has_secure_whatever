module HasSecureWhatever
  class Encryptor
    KEY_LEN = 32
    def initialize(key = nil)
      @key = nil
      if key
        @key = key.unpack('m').first
      else
        secret_key = HasSecureWhatever.config.secret_key
        @key = secret_key.unpack('m').first unless secret_key.nil?
      end
      if @key.nil?
        raise "Secret key for has_secure is not set"
      end
      @crypt = ActiveSupport::MessageEncryptor.new(@key)
    end

    def encrypt(unencrypted_value)
      @crypt.encrypt_and_sign(unencrypted_value)
    end

    def decrypt(encrypted_value)
      @crypt.decrypt_and_verify(encrypted_value)
    end

    def self.generate_secret_key
      salt = SecureRandom.random_bytes(KEY_LEN)
      key = ActiveSupport::KeyGenerator.new('password').generate_key(salt, KEY_LEN)
      [key].pack('m')
    end
  end
end
