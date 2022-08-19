puts "🌱 Seeding spices..."

# Seed your database here
# Make 10 categorie
10.times do
  Category.create(name: Faker::Name.name)
end

50.times do
  # create a a todo  with random data
  category = Category.order("RANDOM()").first
  puts "🎮 Creating a todo for #{category.name}..."
  Todo.create(
    task: Faker::Hobby.activity,
    category_id: category.id
  )
end
puts "✅ Done seeding!"
