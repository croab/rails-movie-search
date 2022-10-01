class MoviesController < ApplicationController
  def index
    if params[:query].present? && params[:theme].present?
      @results = standard_search(params[:query])
      @results = @results.joins(:themes).where(theme: params[:theme]).map{ |result| result.searchable }
    elsif params[:query].present?
      @results = standard_search(params[:query]).map{ |result| result.searchable }
    elsif params[:theme].present?
      filtered_movies = Movie.joins(:themes).where(themes: {name: params[:theme]} )
      filtered_tvshows = TvShow.joins(:themes).where(themes: {name: params[:theme]} )
      @results = (filtered_movies + filtered_tvshows).shuffle
    else
      @results = (Movie.all + TvShow.all).shuffle
    end
  end

  private

  def standard_search(query)
    PgSearch::Multisearch.rebuild(Movie)
    PgSearch::Multisearch.rebuild(TvShow)
    @results = PgSearch.multisearch(params[:query])
  end
end
