require 'nokogiri'
require 'open-uri'
module Google
  module Scholar
    class AuthorsDocument < Document
      def valid?
        validity = !self.content.downcase.index("authors").nil?
        validity = false if !self.content.downcase.index("didn't match any").nil?
        validity
      end
      def authors_count
        self.css('.gsc_1usr').length
      end
      def authors(force=false)
        return @authors if @authors && !force
        @authors = []
        self.css('.gsc_1usr').each {|author| @authors << Google::Scholar::Author.new(author)}
        @authors
      end
      def last_author
        authors.last
      end
    end
  end
end
