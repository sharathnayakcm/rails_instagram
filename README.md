# README
## user Section

create **User** table using "Devise Gem"
which take care login part
User model has many posts,likes and comments


## Post Section
create **Post** table

Post model has many likes and comments and 

Post model

```belongs_to :user ```

 and 

```has_one_attached :image ```

## Image Section
Use the rails Active storage to store images

## Like Section

 For Like I need to create "Like" table which belongs to post and User

 *Our user model will have many likes, and so will our post model*

 ```rails generate model Like post:references user:references```

 user will click  like button once to like  the post
 once post or user is deleted its associated like row will also be deleted

## Comment Section
 For "Comments" I need to create "Comments" table which belongs to post and User

 *Our user model will have many comments, and so will our post model*

 ```rails g model Comment body:text post:references user:references```

 User will have click on comment  link to comment
