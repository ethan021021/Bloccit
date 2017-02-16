require 'random_data'

# advertisements
10.times do
  Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number)
end

# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

20.times do
  Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false)
end

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    topic: topics.sample
  )
end

unique_post = '';

1.times do
  unique_post = Post.find_or_create_by!(title: "Custom Title", body: "Custom Body")
end

posts = Post.all

100.times do
  Comment.create!(post: posts.sample,
  body: RandomData.random_paragraph)
end

1.times do
  Comment.find_or_create_by!(post: unique_post, body: "Custom Comment Body")
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
