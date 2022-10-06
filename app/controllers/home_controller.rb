class HomeController < ApplicationController
  @@ary = []
  @@ary1 = []
  def index
    # @user=current user
  end
  def create
    begin
      create_blog = NewBlog.new(user_params)
      create_blog[:users_id]=session[:user_id]
      comment = params[:id]
           if create_blog.save
        redirect_to '/listblog'
       else
        p 'fialed'
      
      end
    rescue Exception => err
          redirect_to "/error?#{err.message}"
          flash[:notice] = err
    end
  end

  def blog_list
    begin
      @list_blog = NewBlog.all
rescue Exception => err
          redirect_to "/error?#{err.message}"
          flash[:notice] = err
end
  end

  def comment
    begin
      if params[:id] != nil
        @@ary.insert(0, params[:id])
      end
      @showblogs = NewBlog.find(@@ary[0])
      @asw = @@ary[0]
      @showcomments = BlogComment.all
      rescue Exception => err
        redirect_to "/error?#{err.message}"
        flash[:notice] = err
     end
   end

  def comment_save
    begin
      comment= BlogComment.new(params.require(:comment).permit( :comment ))
    comment[:users_id]=session[:user_id]
    comment[:new_blogs_id]=@@ary[0]
  if comment.save
    redirect_to "/comment"
  end
  rescue Exception => err
    redirect_to "/error?#{err.message}"
    flash[:notice] = err 
  end
end
def destroy
  begin
    @del=NewBlog.find(params[:id])
  @com_del=BlogComment.where(new_blogs_id: @del.id)
  if @com_del.destroy_all
    if @del.destroy
      redirect_to "/listblog"
    end
  end
rescue Exception => err
  redirect_to "/error?#{err.message}"
  flash[:notice] = err
end
end
def my_blogs
  begin
    @items = NewBlog.where(users_id: current_user.id)
rescue Exception => err
  redirect_to "/error?#{err.message}"
  flash[:notice] = err
end
end
def update
 @newblog = NewBlog.find(params[:id])
 @@ary1.insert(0, params[:id])
end
def update_blog
  @newblog = NewBlog.find(@@ary1[0])

  @newblog.update(update_params)

  redirect_to "/"
 end
  private
    def user_params
      params.require(:home).permit(:blog_title, :blog_description, :blog_image)
    end
    def update_params
      params.require(:home).permit(:blog_title, :blog_description, :blog_image)
    end

end
