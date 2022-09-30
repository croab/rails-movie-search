class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.global_search(params[:query])
      PgSearch::Multisearch.rebuild(Movie)
      PgSearch::Multisearch.rebuild(TvShow)
      @results = PgSearch.multisearch(params[:query]).map!{ |result| result.searchable }
      @results = @results.where(theme: params[:theme]) if params[:theme].present?
    else
      @all_shows = (Movie.all + TvShow.all).shuffle
    end
  end
end
