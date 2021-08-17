# README

Like Section  
 For Like I need to create "Like" table which belongs to post and User
 Our user model will have many likes, and so will our post model
 ```rails generate model Like post:references user:references```
 user will click  like button once to like  the post and if he clicks again then like will be deleted
 once post or user is deleted its associated like row will also be deleted

Comment Section
 For "Comments" I need to create "Comments" table which belongs to post and User
 Our user model will have many comments, and so will our post model
 ```rails g model Comment body:text post:references user:references```
 User will have click on comment  link to comment and there will be deleted buuton on comment if he wants to delete his own comments
 once post or user is deleted its associated comment row will also be deleted
