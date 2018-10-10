module HasSecureWhatever
  class Configuration
    attr_accessor :secret_key

    def initialize
      @secret_key = nil
    end
  end

  def self.configure
    yield config
  end

  def self.config
    @configuration ||= Configuration.new
  end
end
