require 'date'
require 'fileutils'

class Daily::Txt::PathBuilder

  DIR_TEXT = "text"
  DEFAULT_EXT = "txt"

  class << self

    def filename(date)
      "%04d_%02d_%02d.%s" % [date.year, date.month, date.day, DEFAULT_EXT]
    end

    def prepare_basedir(path)
      dir = File.dirname(path)
      unless Dir.exist?(dir)
        FileUtils.mkdir_p(dir)
      end
    end

    def by_date(root, date)
      File.join(root, DIR_TEXT,
        "%04d" % date.year,
        "%02d" % date.month,
        filename(date))
    end

  end

end

