require 'daily/txt/system'
require 'json'

class Daily::Txt::Config

  class NotFound < StandardError; end
  class ParseError < StandardError; end
  class Invalid < StandardError; end

  DEFAULT_CONFIG_PATH = "#{Dir.home}/.daily_txt_config.json"
  DEFAULT_ROOT_DIR = "daily_txt"
  REQUIRED_KEYS = [
    "home",
    "editor",
    "color"
  ]

  class << self

    def select_from_candidates(label, candidates)
      index = 1
      candidates.each do |candidate|
        puts "[#{index}] #{candidate}"
        index = index + 1
      end
      input = Daily::Txt::System.wait_input(label)
      selected_index = input.to_i - 1
      if selected_index >= 0 && candidates[selected_index]
        return candidates[selected_index]
      end
      abort("invalid selection: #{input}")
    end

    def create_default
      editors = Daily::Txt::System.find_editor
      if editors.empty?
        abort('No editor found')
      end

      selected_editor = editors.size == 1 ?  editors.first : nil
      unless selected_editor
        selected_editor = select_from_candidates(
          "> Which editor do you use? : ", editors)
      end

      config = {
        "home" => File.join(Dir.home, DEFAULT_ROOT_DIR),
        "editor" => selected_editor,
        "color" => true
      }
      File.write(DEFAULT_CONFIG_PATH,
        JSON.pretty_generate(config))
      self.load(DEFAULT_CONFIG_PATH)
    end

    def load(path)
      path ||= DEFAULT_CONFIG_PATH

      unless File.readable?(path)
        raise NotFound, "file not found: #{path}"
      end

      begin
        config = JSON.parse(IO.read(path))
      rescue JSON::ParserError => e
        raise ParseError, "cannot parse: #{path}"
      end
      validate(config)
      config
    end

    def validate(config)
      REQUIRED_KEYS.each do |key|
        unless config.has_key?(key)
          raise Invalid, "config has not required key: #{key}"
        end
      end
      true;
    end

  end

end
