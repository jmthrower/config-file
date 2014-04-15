require "config_file/version"
require "config_file/errors"
require "config_file/configuration"

class ConfigFile
  attr_reader :path

  class << self
    attr_reader :config

    def config
      @config ||= Configuration.new
    end

    def configure
      self.config ||= Configuration.new
      yield(config)
    end
  end
  
  def initialize(path, env_mode={})
    @path = path
    @mode = env_mode[self.class.config.env]
  end

  def validate_existence!
    return if validate_existence
    raise_or_warn("Configuration file does not exist at path '#{@path}'", 
      MissingFile)
  end

  def validate_existence
    File.exist?(@path)
  end

  def validate_key!(key, match=nil)
    return if validate_key(key, match)
    raise_or_warn("Invalid configuration key '#{key}' in file '#{@path}': '#{
      data[key.to_s]}'", InvalidKey)
  end

  def raise_or_warn(msg, err_klass)
    case @mode
    when :warn
      warn "WARNING: #{msg}. Functionality may be restricted."
    else
      raise err_klass, msg
    end
  end

  def validate_key(key, match=nil)
    return !!data[key] if match.nil?
    data[key] =~ match
  end

  def data
    @data ||= if validate_existence
      get_keys
    else
      {}
    end
  end

  def get_keys
    all = YAML.load_file(@path)
    config_env = self.class.config.env.to_s
    return all[config_env] if all[config_env]
    self.class.config.env_aliases.each do |al, env|
      str = al.to_s
      return all[str] if all[str] && env == config_env.to_sym
    end
    {}
  end
end
