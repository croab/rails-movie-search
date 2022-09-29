class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.global_search(params[:query])
      PgSearch::Multisearch.rebuild(Movie)
      PgSearch::Multisearch.rebuild(TvShow)
      @results = PgSearch.multisearch(params[:query])
    else
      p "hi"
      @all_shows = (Movie.all + TvShow.all).shuffle.order(title: :desc)
    end
  end
end
