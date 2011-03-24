class PdfWriter

  @queue = :default

  def self.perform(doc_id)
    doc = Document.find(doc_id)
    doc.read_pdf
  end
end