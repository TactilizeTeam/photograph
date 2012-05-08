require 'spec_helper'

module Photograph
  describe Artist do
    URL = "http://rubygems.org"

    it "should instanciate a new artist" do
      Artist.new :url => URL
    end

    it "should raise an error without an url" do
      expect { Artist.new }.should raise_error(Artist::MissingUrlError)
    end

    describe "Default size values" do
      before(:each) { @artist = Artist.new :url => URL }

      it "should have default values for x,y : 0,0" do
        @artist.options[:x].should == 0
        @artist.options[:y].should == 0
      end

      it"should have default values for h,w : 1280, 1024" do
        @artist.options[:w].should == 1280
        @artist.options[:h].should == 1024
      end
    end

    describe "Cropping" do
      before(:each) { @artist = Artist.new :url => URL }

      it "should take a screenshot large enough to crop later" do
        pending

        @artist = Artist.new :url => URL, :x => 200, :y => 100, :h => 400, :w => 400

        Artist.browser.driver.stub :render

        @artist.shoot!
      end
    end
  end
end
