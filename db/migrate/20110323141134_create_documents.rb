class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :title
      t.string :pdf_file_name
      t.integer :pdf_file_size
      t.string :pdf_content_type
      t.datetime :pdf_updated_at
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
