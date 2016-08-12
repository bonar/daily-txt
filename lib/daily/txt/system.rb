require 'systemu'
require 'which'

class Daily::Txt::System

  EDITOR_CANDIDATES = [
    "vim",
    "vi",
    "emacs"
  ]

  class << self

    def wait_input(question)
      print question
      return gets.chomp
    end

    def find_editor
      editors = []
      EDITOR_CANDIDATES.each do |candidate|
        found = Which.which(candidate)
        if found && !found.empty?
          editors = editors + found
        end
      end
      editors
    end

    def exec(command_path, arg)
      system(command_path, arg)
    end

  end

end
