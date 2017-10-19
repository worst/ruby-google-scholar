require 'nokogiri'
require 'open-uri'
module Google
  module Scholar
    class AuthorsProfileDocument < Document
      def articles(force=false)
        return @citations if @citations && !force
        @citations = []
        self.css(".gsc_a_tr").each {|row| @citations << Google::Scholar::ArticleSummary.new(row)}
        return @citations
      end
    end
  end
end