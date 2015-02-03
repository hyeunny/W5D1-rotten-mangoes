class Movie < ActiveRecord::Base
  mount_uploader :poster, MoviePosterUploader

  has_many :reviews
  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }
  
  validates :description,
    presence: true

  # validates :poster_image_url,
  #   presence: true

  validates :release_date,
    presence: true

  def review_average
    if !reviews.empty?
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

end
