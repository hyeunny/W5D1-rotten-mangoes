class SearchController < ApplicationController
  def index
    title = params[:title]
    director = params[:director]
    runtime = params[:runtime_in_minutes].to_i

    query = ""

    query += "title like '#{title}%'" if !title.blank?
    query += "director like '#{director}%'" if title.blank? && !director.blank?
    query += " and director like '#{director}%'" if !director.blank? && !title.blank?
    query += " and runtime_in_minutes < 90" if runtime < 90 && (title || director)
    query += " and runtime_in_minutes >= 90 and runtime_in_minutes <= 120" if runtime >= 90 && runtime <= 120 && (title || director)
    query += " and runtime_in_minutes > 120" if runtime > 120 && (title || director)

    @movies = Movie.where(query)

  end
end
