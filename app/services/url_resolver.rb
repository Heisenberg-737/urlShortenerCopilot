class UrlResolverService
    attr_reader :short_url, :original_url

    def initialize(short_url:)
        @short_url = short_url
    end

    def find_url
        link = URL.find_by_code(short_url)
        link.increment!(:click_count) if link.present?

        link.try(:original_url)
    end

    def url_details
        link = URL.find_by_code(short_url)

        link
    end
end