require 'capybara-webkit'
require 'mini_magick'


Capybara.default_wait_time = 5

module Photograph
  class Artist
    attr_accessor :options
    attr_reader :image

    MissingUrlError = Class.new(Exception)
    DefaultOptions  = {
      :x => 0,          # top left position
      :y => 0,
      :w => 1280,       # bottom right position
      :h => 1024,

      :wait => 1,       # if selector is nil, wait 1 seconds before taking the screenshot
      :selector => nil  # wait until the selector matches to take the screenshot
    }

    def self.browser
      @browser ||= Capybara::Session.new :webkit
    end

    def browser
      self.class.browser
    end

    def initialize options={}
      raise MissingUrlError unless options[:url]

      @options = DefaultOptions.merge(options)
    end

    def shoot!
      @image = capture
    end

    def capture
      browser.visit @options[:url]

      if @options[:selector]
        browser.wait_until do
          browser.has_css? @options[:selector]
        end
      else
        sleep @options[:wait]
      end

      @tempfile = Tempfile.new(['photograph','.png'])

      browser.driver.render @tempfile.path,
        :width  => options[:w] + options[:x],
        :height => options[:h] + options[:y]

      @image = adjust_image
    end

    def adjust_image
      image = MiniMagick::Image.read @tempfile

      if options[:h] && options[:w]
        image.crop "#{options[:w]}x#{options[:h]}+#{options[:x]}+#{options[:y]}"

        image.write @tempfile

      end

      image
    end

    def clean!
      @tempfile.unlink
    end
  end
end

