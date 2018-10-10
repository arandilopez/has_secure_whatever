namespace :has_secure_whatever do
  desc "Generate new secret key"
  task :generate_secret_key => :environment do
    puts HasSecureWhatever::Encryptor.generate_secret_key
  end
end
