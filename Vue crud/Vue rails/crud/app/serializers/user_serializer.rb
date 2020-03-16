class UserSerializer < ActiveModel::Serializer 
   attributes :id, :name, :description, :gender 
   belongs_to :school
end     