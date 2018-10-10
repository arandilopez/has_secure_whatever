module HasSecureWhatever
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/has_secure_whatever_tasks.rake"
    end
  end
end
