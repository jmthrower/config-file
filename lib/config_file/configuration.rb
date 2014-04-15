class ConfigFile
  class Configuration

    def env=(val)
      @env = (val || :dev).to_sym
    end

    def env
      env_aliases[@env] || @env
    end

    def alias_env(label, env)
      env_aliases[label] = env
    end

    def env_aliases
      @env_aliases ||= {}
    end
  end
end
