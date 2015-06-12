class Artwork
  attr_reader(:description, :museum_museum)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @museum_id = attributes.fetch(:museum_id)
  end

  define_method(:==) do |another_artwork|
    self.description.==(another_artwork.description).&(self.museum_id).==(another_artwork.id)
  end

  define_singleton_method(:all) do
    returned_artworks = DB.exec('SELECT * FROM artworks;')
    artworks = []
    returned_artworks.each() do |artwork|
      description = artwork.fetch('description')
      museum_id = artwork.fetch('museum_id').to_i()
      artworks.push(artwork.new({:description => description, :museum_id => museum_id}))
    end
    artworks
  end
  define_method(:save) do
    DB.exec("INSERT INTO artworks (description, museum_id) VALUES ('#{@description}', #{@museum_id});")
  end

  define_method(:update) do |attributes|
    @description= attributes.fetch(:description)
    @id = self.id
    DB.exec("UPDATE artworks SET description = '#{@description}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM artworks WHERE id = #{self.id};")
  end
end
