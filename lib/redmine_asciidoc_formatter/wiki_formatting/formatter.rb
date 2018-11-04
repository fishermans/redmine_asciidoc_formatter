# encoding: utf-8

require 'redmine_asciidoc_formatter/asciidoc'

module RedmineAsciidocFormatter::WikiFormatting
  class Formatter
    #    include ActionView::Helpers::TagHelper

    def initialize(text)
      @text = text
    end

    def to_html(&block)
      @text.gsub!(/([\{\}]){2}/, '%%\1%%')

      html = AsciiDoc.new(@text).to_html
      html.gsub!(/%%([\{\}])%%/, '\1\1')
      html.gsub(/wiki:(\w+(\/\w+)*)/, '[[\1]]')
    end
  end
end
