# encoding: utf-8
require 'asciidoctor'

class AsciiDoc
  
  @@asciidoc = "asciidoc -a icons -a iconsdir='/redmine/images/icons' -a imagesdir='/redmine/images'"

  # Takes a string or file path plus any additional options and converts the input.
  def self.to_html(*args)
    new(*args).to_html
  end

  # Takes a string or file path plus any additional options and creates a new converter object.
  def initialize(*args)
    target = args.shift
    @target  = File.exists?(target) ? File.read(target) : target rescue target
  end
    
  # Converts the object's input to HTML.
  def to_html
    Asciidoctor.convert @target
  end
  
end

