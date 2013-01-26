class CreatePosts < ActiveRecord::Migration
  def up
      create_table :posts do |t|
          t.text    :body
          t.string  :article_type
          t.string  :title
          t.timestamps
      end
      Post.create(title: "My first post", body: "And this is the post's content.", article_type: 'text')
      Post.create(title: "How to lasso your dog", 
                body: "1. Tie a rope into a lasso. 2. Swing it over that unruly dog's torso. 3. Gently pull.", article_type: 'text')
      Post.create(title: "Top 10 coffee shops in Austin", body: "1..10: Epoch Coffee, the 24/7 coffee shop.", article_type: 'text')
      mardown_text = <<EOF
### 5. Preparation for Deploy

I'd like to use Github to host my blog, so below are steps on how to deploy Octopress to Github. Please refer to the [offical document](http://octopress.org/docs/deploying/) if you prefer Heroku of Rsync or visit [Moncef Belyamani ](http://www.moncefbelyamani.com/how-to-install-and-configure-octopress-on-a-mac/) if you think Amazon S3 is good choice.

As we want to deploy to Github, you need a Github account. If you still don't have, it's time to get one. Please add the ssh key (which could be found at ~/.ssh/id_rsa.pub) to your Github `Account Settings>SSH Keys` to make your life easier.

#### 5.1 Create repo for Octopress

Here is the command help you set up Octopress site to publish to your projects gh-pages repository:

```
$ rake setup_github_pages
```

Then you'll be asked to provide repository url, input `git@github.com:username/blog.git`. 


|--------------+---------------+--------------|
| First Header | Second Header | Third Header |
| :------------| :-----------: | ------------:|
| Cell         |      Cell     |         Cell |
|--------------+---------------+---------------
| Cell         |      Cell     |         Cell |
|--------------+---------------+--------------|


EOF
      Post.create(title: "Markdown", body: mardown_text, article_type: 'markdown')

  end

  def down
      drop_table :posts
  end
end
