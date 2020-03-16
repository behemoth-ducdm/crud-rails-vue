class User < ApplicationRecord 
    belongs_to :school, optional: true
    #moi user co 1 school_id hay moi user thuoc ve 1 school
    # validate phai co name va description
    validates :name, :description, presence: true 
    validates :name, length: {minimum:5}

    enum gender: {
       male: 1, 
       female: 2
    } 
    
    def to_collection
    {
       id: id,
       name: name,
       school: school
    }
    end
end     