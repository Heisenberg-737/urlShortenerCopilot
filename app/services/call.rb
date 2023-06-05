require_relative 'url_generator'
require_relative 'url_resolver'

class Call
    class << self
        def service service
            case service
            when :url_generator
                UrlGeneratorService
            when :url_resolver
                UrlResolverService
            else
                raise "Unknown service: #{service}"
            end
        end
        alias_method :[], :service
    end
end