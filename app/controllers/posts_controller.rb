    class PostsController < ApplicationController

        def hashtag
        if params[:name].nil?
            @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
        else
            @hashtag = Hashtag.find_by(hashname: params[:name])
            @post = @hashtag.posts
            @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
        end
        end
    
    
        def index
        @posts = Post.all
        end
    
        def show
        @post = Post.find(params[:id])
        end
    
        def new
        @postnew = Post.new
        end
    
        def create
        @postnew = Post.new(post_params)
    
        if @postnew.save
            redirect_to posts_path
        else
            render('posts/new')
        end
        end
    
        def update
        @post = Post.find(params[:id])
        respond_to do |format|
            if @post.update(post_params)
            format.html { redirect_to @post, notice: "Post  was successfully updated." }
            format.json { render :show, status: :ok, location: @post }
            else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
        end
    
        def destroy
        @post = Post.find(params[:id])
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
        end
    
    
        private
    
        def post_params
            params.require(:post).permit(:body, :hashbody, :user_id, postss: [], hashtag_ids: [])
        end
    end