class AdminPostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /admin_blogs
  # GET /admin_blogs.json
  def index
@posts = Post.page(params[:page]).per(10)
  end

  # GET /admin_blogs/1
  # GET /admin_blogs/1.json
  def show
  end

  # GET /admin_blogs/new
  def new
    @post = Post.new
  end

  # GET /admin_blogs/1/edit
  def edit
  end

  # POST /admin_blogs
  # POST /admin_blogs.json
   def create
    @post = Post.new(post_params)

    respond_to do |format|
      @post.author_id=current_user.id
      if @post.save
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin_blogs/1
  # PATCH/PUT /admin_blogs/1.json
 def update
    respond_to do |format|

      if @post.update(post_params)
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_blogs/1
  # DELETE /admin_blogs/1.json
   def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description,:body, :user_id)
    end
end
