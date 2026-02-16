# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Réinitialisation de la base..."

Like.destroy_all
Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
Tag.destroy_all

puts "Création des villes..."
villes = [
  { name: "Paris", zip_code: "75000" },
  { name: "Lyon", zip_code: "69000" },
  { name: "Marseille", zip_code: "13000" },
  { name: "Toulouse", zip_code: "31000" },
  { name: "Bordeaux", zip_code: "33000" },
  { name: "Nice", zip_code: "06000" }
]

villes.each { |v| City.create!(v) }

puts "Création des utilisateurs..."
users = [
  { first_name: "Remy", last_name: "Martin", email: "remy@example.com", age: 28, city: City.first },
  { first_name: "Julie", last_name: "Durand", email: "julie@example.com", age: 32, city: City.second },
  { first_name: "Thomas", last_name: "Bernard", email: "thomas@example.com", age: 25, city: City.third },
  { first_name: "Camille", last_name: "Petit", email: "camille@example.com", age: 29, city: City.fourth },
  { first_name: "Lucie", last_name: "Moreau", email: "lucie@example.com", age: 35, city: City.fifth },
  { first_name: "Hugo", last_name: "Lefèvre", email: "hugo@example.com", age: 22, city: City.first },
  { first_name: "Sarah", last_name: "Lambert", email: "sarah@example.com", age: 27, city: City.second },
  { first_name: "Nicolas", last_name: "Roux", email: "nicolas@example.com", age: 31, city: City.third }
]

users.each { |u| User.create!(u) }

puts "Création des tags..."
tags = [ "Secret", "Amour", "Travail", "Famille", "Rumeur", "Soirée", "École", "Voisinage", "Café", "Mystère" ]
tags.each { |t| Tag.create!(title: t) }

puts "Création des potins..."
gossips = [
  { title: "Le mystère du café disparu", content: "Quelqu’un vide la cafetière tous les matins avant 8h…", user: User.first },
  { title: "Julie et le voisin", content: "On les a vus discuter très tard dans le hall hier soir.", user: User.second },
  { title: "Promotion surprise", content: "Thomas aurait été promu sans prévenir personne.", user: User.third },
  { title: "Camille prépare une fête", content: "Elle a acheté des guirlandes et des ballons en secret.", user: User.fourth },
  { title: "Lucie change de travail", content: "Elle aurait passé un entretien confidentiel la semaine dernière.", user: User.fifth },
  { title: "Hugo a gagné un concours", content: "Il aurait remporté un voyage mais refuse d’en parler.", user: User.find_by(first_name: "Hugo") },
  { title: "Sarah a un admirateur", content: "Une lettre anonyme a été trouvée dans sa boîte aux lettres.", user: User.find_by(first_name: "Sarah") },
  { title: "Nicolas déménage bientôt", content: "Il aurait trouvé un appartement plus grand dans le centre.", user: User.find_by(first_name: "Nicolas") },
  { title: "Réunion secrète au bureau", content: "Plusieurs employés ont été vus dans la salle 204 tard le soir.", user: User.first },
  { title: "Un chat rôde dans l’immeuble", content: "Personne ne sait à qui il appartient, mais il entre partout.", user: User.second }
]

gossips.each { |g| Gossip.create!(g) }

puts "Association des tags aux potins..."
Gossip.all.each do |gossip|
  gossip.tags << Tag.all.sample(2)
end

puts "Création des commentaires..."
commentaires = [
  "Je confirme, j’ai entendu la même chose.",
  "C’est totalement vrai, j’y étais.",
  "Je ne suis pas sûr, mais ça semble crédible.",
  "Incroyable, je ne m’y attendais pas.",
  "Ah oui, ça circule depuis un moment.",
  "J’ai vu un truc bizarre aussi.",
  "Ça ne m’étonne pas du tout.",
  "On en parle depuis des semaines."
]

40.times do
  Comment.create!(
    content: commentaires.sample,
    user: User.all.sample,
    commentable: Gossip.all.sample
  )
end

puts "Création des likes..."
80.times do
  Like.create!(
    user: User.all.sample,
    likeable: [ Gossip.all.sample, Comment.all.sample ].sample
  )
end

puts "Seeds terminés ! 🎉"
