module Photograph
  class Configuration
    def initialize path
      @configuration = Yaml.load_file path
    end

    def [] name
      @configuration[name]
    end
  end
end
