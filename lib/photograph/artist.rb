require 'capybara-webkit'
require 'mini_magick'

module Photograph
  class Artist
    attr_accessor :options
    attr_reader :image

    def self.browser
      @browser ||= Capybara::Session.new :webkit
    end

    def browser
      self.class.browser
    end

    def initialize options={:x => 0, :y => 0}
      @options = options
    end

    def shoot!
      @image = capture
    end

    def capture
      browser.visit @options[:url]

      @tempfile_path = Tempfile.new(['photograph','.png'])

      browser.driver.render @tempfile_path.path,
        :width  => options[:w],
        :height => options[:h]

      @image = adjust_image
    end

    def adjust_image
      image = MiniMagick::Image.read @tempfile_path

      if options[:h] && options[:w]
        image.crop "#{options[:x]}x#{options[:y]}+#{options[:w]}+#{options[:h]}"

        image.write @tempfile_path

      end

      image
    end

    def clean!
      @tempfile_path.unlink
    end
  end

  Artist.browser
end

