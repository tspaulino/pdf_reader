require 'spec_helper'
require 'ostruct'

describe DocumentsController do

  it "should return search results when receiving a keyword to search" do
    document = mock_model(Document)
    Document.should_receive(:search).with("test").and_return(OpenStruct.new(:results => [document]))
    get :search, :keyword => "test"
    assigns[:documents].should include(document)
  end

end
