class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    artist.songs << self
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents=(arr_content)
    arr_content.each do |content|
      note = Note.find_or_create_by(content: content)
      notes << note
    end
  end

  def note_contents
    notes ? notes.map(&:content) : nil
  end
end
