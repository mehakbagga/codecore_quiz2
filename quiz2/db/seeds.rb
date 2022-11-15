# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Like.destroy_all
Review.destroy_all
Idea.destroy_all
User.destroy_all

mehak = User.create(
    first_name: "Mehak",
    last_name: "Bagga",
    email: "mehakbagga55@gmail.com",
    password: "123"
)

20.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}@#{last_name.downcase}.com",
        password: "123"
    )
end

users = User.all 

30.times do
    idea = Idea.create(
        title: Faker::TvShows::BigBangTheory.quote,
        description: Faker::Lorem.paragraph(sentence_count: 10),
        user: users.sample
    )

    if idea.valid?
        rand(5..10).times do
            review = Review.create(
                body: Faker::TvShows::TheITCrowd.quote,
                idea: idea,
                user: users.sample
            )
        end
        
        idea.likers = users.shuffle.slice(0, rand(users.count))
    end
end