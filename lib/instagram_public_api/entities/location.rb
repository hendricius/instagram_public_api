module InstagramPublicApi
  module Entities
    class Location
      include Virtus.model
      attribute :name, String
      attribute :lat, Float
      attribute :lng, Float
      attribute :id, String
      attribute :top_posts, Array, default: []
      attribute :media, Array, default: []
      attribute :paging_info, Object, default: {}

      # returns all media including top posts and media
      def all_media
        [top_posts, media].flatten.uniq{|m| m.id }.sort_by {|m| m.likes_count }.reverse
      end

      # adds an array of media to the location
      def add_media(array)
        array.each {|m| self.media << m }
      end

      # returns how much media has been added to this location.
      def total_media_count
        all_media.length
      end

    end
  end
end
