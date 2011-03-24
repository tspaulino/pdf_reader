class Document < ActiveRecord::Base
  acts_as_solr :fields => [:title, :content]

  has_attached_file :pdf, :styles => {:thumb => ["100x200#", :jpg]}

  validates_attachment_presence :pdf
  validates_attachment_content_type :pdf, :content_type => "application/pdf"

  attr_accessible :title, :pdf_file_name, :pdf_file_size, :pdf_content_type, :pdf_updated_at, :content, :pdf


  def async_read_pdf
    Resque.enqueue(PdfWriter, self.id)
  end

  def begin_page(arg = nil)
   self.content = "" if self.content.nil?
   self.content << ""
  end

  def show_text(string, *params)
    self.content << " " + string.strip
  end

  alias :super_show_text :show_text
  alias :move_to_next_line_and_show_text :show_text
  alias :set_spacing_next_line_show_text :show_text

  def show_text_with_positioning(*params)
    params = params.first
    params.each { |str| show_text(str) if str.kind_of?(String)}
  end

  def read_pdf
    self.update_attributes(:content => "")
    PDF::Reader.file(self.pdf.path, self)
    self.save
  end

end
