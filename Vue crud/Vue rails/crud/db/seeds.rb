# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Giup viec tao file du lieu nhu DB
if School.count == 0
(1..300).each do |i|    
        School.create(
            name: "school_#{i}",
            description: "description_#{i}"
        )
    end 
end 

(1..300).each do |i|
    
        User.create(
            name: "user_#{i}",
            description: "description_#{i}",
            gender: %i[male female].sample,
            school_id: (1..300).to_a.sample 
        )
end    
    