require 'spec_helper'

module Photograph
  describe Service do
    context "Normalizing parameters" do
      before :each do
        @in  = {
          "url" => CGI::escape("http://google.fr"),
          "x" => "0",
          "y" => "0",
          "w" => "1024",
          "y" => "768",
          "wait" => "50",
          "selector" => ".page"
        }

        @out = Service.new.send(:normalize_params)
      end

      it "should convert x and y to integers" do
        @out[:x].should ==(@in["x"].to_i)
        @out[:y].should ==(@in.to_i)
      end
    end
  end
end
