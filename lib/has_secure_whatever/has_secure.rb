module HasSecureWhatever
  module HasSecure
    extend ActiveSupport::Concern

    module ClassMethods
      def has_secure(attribute, validations: true, digest_name: nil)
        digest_attribute = digest_name || "#{attribute}_digest"

        define_method("#{attribute}") do
          encrypted_value = self.send("#{digest_attribute}")
          if encrypted_value.nil?
            return nil
          else
            Encryptor.new.decrypt(encrypted_value)
          end
        end

        define_method("#{attribute}=") do |unencrypted_value|
          if unencrypted_value.nil?
            self.send("#{digest_attribute}=", nil)
          elsif !unencrypted_value.empty?
            encrypted_value = Encryptor.new.encrypt(unencrypted_value)
            self.send("#{digest_attribute}=", encrypted_value)
          end
        end

        if validations
          include ActiveModel::Validations
          validate do |record|
            record.errors.add(attribute, :blank) unless record.send(digest_attribute).present?
          end
        end
      end
    end
  end
end
