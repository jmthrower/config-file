class ConfigFile
  class ConfigError < StandardError ; end
  class MissingFile < ConfigError ; end
  class InvalidKey < ConfigError ; end
end
