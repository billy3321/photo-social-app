class CommentsController < ApplicationController

  before_filter :find_photo
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :create]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @comments = @photo.comments.all
  end

  # GET /photo/#{photo_id}/comments/1
  def show
  end

  # GET /photo/#{photo_id}/comments/new
  def new
    @comment = Comment.new
  end

  # GET /photo/#{photo_id}/comments/1/edit
  def edit
  end

  # POST /photo/#{photo_id}/comments/
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to photo_comment_path(@photo, @comment), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /photo/#{photo_id}/comments/1
  def update
    if @comment.update(comment_params)
      redirect_to photo_comment_path(@photo, @comment), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photo/#{photo_id}/comments/1
  def destroy
    @comment.destroy
    redirect_to photo_comments_url(@photo), notice: 'Comment was successfully destroyed.'
  end

  private

    def find_photo
      @photo = Photo.find(params[:photo_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = params[:id] ? Comment.find(params[:id]) : Comment.new(comment_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :photo_id, :user_id)
    end
end