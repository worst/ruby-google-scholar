module Google
  module Scholar
    class ArticleSummary
      def initialize(doc)
        @document = doc
      end
      def title
        @title ||= @document.css(".gsc_a_at").text
      end
      def authors
        @authors ||= @document.css(".gs_gray").first.text
      end
      def publisher
        @publisher ||= @document.css(".gs_gray").last.text
      end
      def citations
        @citations ||= @document.css(".gsc_a_ac").text.to_i
      end
      def year
        @year ||= @document.css(".gsc_a_hc").text.to_i
      end
      def full_article_url
        @full_article_url ||= "#{Google::Scholar.google_url}#{@document.css(".gsc_a_at").attr("data-href").text}"
      end
    end
  end
end
