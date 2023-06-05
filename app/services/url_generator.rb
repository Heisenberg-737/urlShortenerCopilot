class UrlGeneratorService
    attr_reader :original_url
    CHARSET = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a

    def initialize(url:)
        @url = url
    end

    def shorten!
        parse_url! if url.present?

        shortened_url = URL.find_by(original_url: url)

        if shortened_url.new_record?
            shortened_url.short_url = generate_short_url
            shortened_url.save
        end

        shortened_url
    end

    private

    def generate_short_url
        loop do
            short_url = (0...6).map { CHARSET[rand(CHARSET.size)] }.join
            break short_url unless Url.exists?(:short_url=> short_url)
        end
    end

    def parse_url!

        url = @url.to_s.strip
        if url !~ check_protocol && url[0] != "/"
            url = "http://#{url}"
        end
        @url = URI.parse(url)
        rescue URI::InvalidURIError
        false
    end

    def check_protocol
        Regexp.new('\Ahttp:\/\/|\Ahttps:\/\/', Regexp::IGNORECASE)
    end

end