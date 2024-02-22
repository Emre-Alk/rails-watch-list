class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(set_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    puts "ok"
  end

  private

  def set_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
