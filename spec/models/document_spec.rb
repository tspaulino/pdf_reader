require 'spec_helper'

describe Document do
  before(:each) do
    @valid_attributes = {
      :title => "Testing documents",
      :pdf => File.new(RAILS_ROOT + '/spec/fixtures/test.pdf')
    }
  end

  it "should create a new instance given valid attributes" do
    Document.create!(@valid_attributes)
  end

  it "should not create a document without an attached file" do
    @document = Document.new(:title => "Testing")
    @document.save.should be_false
  end


  it "should generate a thumbnail for the attached file" do
    @document = Document.new(@valid_attributes)
    @document.save.should be_true
    @document.pdf.url(:thumb).should_not be_nil
  end

  it "should fill the content with the pdf text" do
    @document = Document.create!(@valid_attributes)
    expect{ @document.read_pdf }.to change(@document, :content)
  end


end
