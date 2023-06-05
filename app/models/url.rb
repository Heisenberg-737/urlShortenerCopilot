class URL < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  validates :url, uniqueness: true

  def details_json
    as_json(only: [:id, :original_url, :short_url, :click_count])
    end
end