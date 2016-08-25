require "daily/txt/config"
require "daily/txt/path_builder"
require 'date'
require 'optparse'
require 'file/visitor'

class Daily::Txt::CLI

  class << self

    def parse_option(argv)
      option = {}
      parser = OptionParser.new

      parser.on('-f PATH', 'config file path') do |path|
        option[:config_path] = path
      end
      parser.on('-l', '--list', 'list text files') do |path|
        option[:mode] = :list
      end
      parser.on('--ascending', 'make list order ascending') do
        option[:asc] = true
      end

      begin
        parser.parse!(argv)
      rescue OptionParser::MissingArgument => e
        abort(e.to_s)
      end
      option
    end

    def bootstrap(argv)
      begin
        option = parse_option(argv)
      rescue OptionParser::InvalidOption => e
        abort(e.to_s)
      end
      begin
        config_path = option[:config_path]
        config = Daily::Txt::Config.load(config_path)
      rescue Daily::Txt::Config::NotFound => e
        if config_path
          abort(e.to_s)
        end
        config = Daily::Txt::Config.create_default
      end

      Daily::Txt::PathBuilder.prepare_basedir(config["home"])
      
      dispatch_action(option, config)
    end

    def dispatch_action(option, config)
      case option[:mode]
      when :list
        list(config, option)
      else
        open_today(config)
      end
    end

    def list(config, option)
      visitor = File::Visitor.new
      visitor.add_filter(:ext, Daily::Txt::PathBuilder::DEFAULT_EXT)

      if option[:asc]
        visitor.set_direction(:asc)
      else
        visitor.set_direction(:desc)
      end

      visitor.visit(config["home"]) do |path|
        puts path
      end
    end

    def open_today(config)
      path = Daily::Txt::PathBuilder.by_date(
        config["home"], Date.today)
      Daily::Txt::PathBuilder.prepare_basedir(path)
      Daily::Txt::System.exec(config["editor"], path)
    end

  end

<<MEMO

  begin
    config = Daily::Txt::Confing.load
  rescue Daily::Txt::NotInitializedError
    self.initialize
    exit
  end

  begin
    manager = Daily::Txt::DirectoryManager.new(config)
  rescue Daily::Txt::ScanError
  end

  manager.get_current_file
  Daily::Txt::System.open(

  manager.get_files(count: 10).each do |result|
    result.year
    result.month
    result.path
  end

  results = manager.search(regexp)

  printer = Daily::Txt::Confing::Printer(config)
  printer.print_files(manager.get_files)

MEMO

end
