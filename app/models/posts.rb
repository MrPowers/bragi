class Posts 
  def self.all
    @posts ||= load_posts
    @posts
  end

  def self.find(slug)
    all.select  { |post| post.slug == slug }[0]
  end

  private
  def self.load_posts
    Dir["#{ENV['posts_path']}/*"].map { |file| Post.new(file) } 
  end
end