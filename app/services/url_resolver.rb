class UrlResolverService
    attr_reader :code, :url

    def initialize(code)
        @code = code
    end

    def find_url
        link = Url.find_by(short_url: code)
        link.increment!(:click_count) if link.present?

        link.try(:original_url)
    end

    def url_details
        link = Url.find_by(short_url: code)

        link
    end
end