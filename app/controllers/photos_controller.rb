class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :create]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all.page params[:page]
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @comments = @photo.comments.order(created_at: :asc).page params[:page]
    @comment = @photo.comments.build
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    @comment = @photo.comments.build
  end

  # GET /photos/1/edit
  def edit
    @comment = @photo.comments.build
  end

  # POST /photos
  def create
    if @photo.save
      redirect_to @photo, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    redirect_to photos_url, notice: 'Photo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = params[:id] ? Photo.find(params[:id]) : Photo.new(photo_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:user_id, :content, :image)
    end
end
