Given(/^There is a Forum$/) do
  Forum.create!(name: "Test forum name1", description: "test description with a minimum of 20 characters..", user_id: User.first.id)

  expect(Forum.last.name).to eq("Test forum name1")
end

Given(/^I have (\d+) posts$/) do |num|
  find_or_create_posts(num.to_i)

  expect(Post.first.title).to eq("Post title1")
  expect(Post.count).to eq(num.to_i)
end

Given(/^There is a User$/) do
  User.create!(email: "user@test.com", password: "password#1")

  expect(User.first.email).to eq("user@test.com")
end

Given(/^There is a Post$/) do
  find_or_create_posts(1)

  expect(Post.count).to be > 0
end

Given(/^There is a post with a comment$/) do
  find_or_create_posts(1)
  post = Post.first
  user = User.first
  Comment.create!(body: "Comment body1", user_id: user.id, commentable_type: "Post", commentable_id: post.id)
end

Given(/^I am a registered user$/) do
  find_or_create_user
end

World(Populate_methods)
# Available methods include:
# find_or_create_posts(num)                     <- Will create a single Forum and User.
# find_or_create_forums(num)                    <- Will create a single User if one does not exist
# find_or_create_user(email=nil, password=nil)  <- will return with a fail message if supplied with single email (no pass) and it DOESN'T exist