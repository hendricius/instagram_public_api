module InstagramPublicApi
  module Entities
    class MediumNode
      include Virtus.model
      attribute :code, String
      attribute :dimensions, Hash, default: {}
      attribute :comments, Hash, default: {}
      attribute :owner, Hash, default: {}
      attribute :likes, Hash, default: {}
      attribute :date, Numeric
      attribute :thumbnail_src, String
      attribute :is_video, Boolean
      attribute :id, String
      attribute :display_src, String

      # returns the likes count of the medium node
      def likes_count
        likes[:count] || 0
      end

      # returns true if the dimensions are a square
      def is_square?
        dimensions[:width] && dimensions[:height] && dimensions[:width] == dimensions[:height]
      end

      # returns true if the image is landscape mode
      def is_landscape?
        dimensions[:width] && dimensions[:height] && dimensions[:width] > dimensions[:height]
      end

      # returns true if the image is in portrait mode
      def is_portrait?
        dimensions[:width] && dimensions[:height] && dimensions[:height] > dimensions[:width]
      end
    end
  end
end
