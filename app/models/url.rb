class URL < ActiveRecord::Base
  validates :original_url, presence: true
  validates :original_url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  validates :original_url, uniqueness: true

  def details_json
    as_json(only: [:id, :original_url, :short_url, :click_count])
    end
end